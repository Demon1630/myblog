---
title: NAS 上搭 Grafana：卧室环境、用电、系统、健康四张仪表盘
date: 2026-11-15
tags: [Grafana, InfluxDB, Prometheus, Home Assistant, 智能家居, NAS]
categories: [智能家居]
---

## 为什么要搭

Home Assistant 自带的历史记录只能看单个实体，时间一长就查不到，而且卧室环境、电费、设备状态、健康数据散在四个地方。

我想找一个地方把它们拼起来：早上看一眼就知道昨晚睡得怎么样、家里空气怎么样、这个月电用了多少、几台服务器活得好不好。

方案是 NAS 上跑 Grafana + InfluxDB + Prometheus，都是开源免费的，数据全在自己手里。

## 能干啥

四张仪表盘：

**卧室环境**：温度、湿度、CO₂、PM2.5、甲醛、TVOC 六个面板，数据来自空气传感器进 HA 再推到 InfluxDB。

**用电**：八个面板。月度用量/费用、两块电表对比、本月用电/本月电费（从 1 号起的累计曲线）、本月用电趋势（每日用量）、近 7 日用电、账户余额、今年累计用电。

**系统监控**：七个面板，一台设备一张卡：NAS、树莓派、网络流量（几台设备的上传下载）、服务状态表、几台服务器各一张卡。

**健康趋势**：HRV 趋势、静息心率、每日步数、每晚睡眠四个面板，数据来自手机健康，最近 50 天。每天早上一个定时任务自动同步，当天重跑不会重复。

## 什么原理

```
空气传感器 ──┐
电表 ────────┤
            ├─→ Home Assistant ─→ InfluxDB ─→ Grafana
服务器 ──────┤
            └─→ Prometheus ─→ Grafana
手机健康 ───────→ InfluxDB ─→ Grafana
```

三层：

- **存数据**：InfluxDB，只在局域网内，不对外暴露。HA 推送传感器数据，手机健康数据每天同步一次写进来。
- **采数据**：Prometheus，30 秒抓一次。各设备上装 node-exporter 采 CPU、内存、磁盘，blackbox-exporter 定时探几个关键服务是不是活着。
- **画图**：Grafana，只负责画，不存数据。仪表盘是 JSON 文件，改完重新导入覆盖。

HA 往 InfluxDB 推数据时，measurement 是单位名（°C、ppm、kWh、%），field 固定叫 value，写查询的时候按这个结构找。

## 要怎么搭

**1. 起几个容器**：InfluxDB、Grafana、Prometheus，再加 node-exporter 和 blackbox-exporter，都在 NAS 的 Docker 里。

**2. 接 HA**：HA 的配置文件里加一段 influxdb 配置（api_version 2，include sensor 和 binary_sensor 两个域），重启 HA 就开始推送。

**3. 接服务器监控**：各设备上装 node_exporter，用 setsid 脱管 + crontab @reboot 开机自启。Prometheus 配置文件里加一个 job，改完 `docker exec prometheus kill -HUP 1` 热加载，不用重启容器。

**4. 接健康数据**：用 health-cli 从手机拉数据，写成每天中午一个时间戳的点，再调 InfluxDB 的 v2 API 写进去。同日重跑会覆盖，不会重复。

**5. 补电费历史**：HA 是最近才装的国家电网集成，之前的数据 HA 里没有。所以早期的月度账单和日用电，是用集成里已保存的登录会话调国家电网接口拉了一次，写进 InfluxDB。装集成那天之后 HA 自动存，以后不用再拉。

**6. 导仪表盘**：Grafana 里 Import > Upload JSON 导入仪表盘文件，改完重新导入覆盖。

## 踩过的坑

**坑 1：Grafana 13 的文件 provisioning 导不进仪表盘。** provisioning 写了配置，仪表盘就是不出现。只能走浏览器 UI 的 Import > Upload JSON 导入，本地 JSON 文件留着当底稿。

**坑 2：两块电表对比面板的时间戳对不上。** 两个电表的实时读数差几毫秒，Grafana 会把它们分成两组显示，并排柱状图就错位了。解法是所有对比面板的 Flux 查询都加 `aggregateWindow(every: 1d, fn: last)`，按天归并时间戳。

**坑 3：blackbox 探针走局域网 IP 超时。** blackbox 容器里用局域网 IP 探其他容器里的服务会超时，是 Docker 的 hairpin NAT 问题。解法是把 blackbox 容器连到那几个服务所在的 Docker 网络，探针直接走容器 IP。注意容器 IP 重启后可能变，服务状态变离线先查容器 IP 变了没有。

**坑 4：本月电费传感器读数是 0。** HA 里 `current_month_usage_cost` 现在是 0，集成还没算出当月的费用。早期的费用是按 0.588 元/度估算回填的，等集成更新后 HA 会自动推真实值。如果过几天还是 0，再去查集成。

**坑 5：Grafana 容器运行的用户和数据目录权限对不上。** 数据目录权限不对会一直重启循环，改一下目录权限解决。

## 花了多少钱

0 元。Grafana、InfluxDB、Prometheus、node_exporter 全是开源免费，跑在现成的 NAS 和服务器上，没买新硬件。

## 一句话总结

家庭监控这件事，核心就三句话：数据先进 InfluxDB（HA 推、Prometheus 抓、health-cli 同步），Grafana 只负责画，历史数据缺了就从源头一次性补。坑主要在时间戳归并、容器网络和 Grafana 13 的 provisioning 上，都是配好一次就不用再管的东西。
