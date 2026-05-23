---
title: Excel调用Nist RefProp计算介质物性
date: 2020-05-20
categories:
- excel
- 制冷技术
tags:
- excel
- refprop
---
Nist Refprop 是一个常用到的物性计算软件，在 Excel 中调用起来也比较方便。

## 1\. 安装 Nist Refprop V9.1

- 官网
- NIST2391.EXE

安装完之后：

- 32位系统默认安装路径是 `C:\Program Files\REFPROP`
- 64位系统默认安装路径是 `C:\Program Files (x86)\REFPROP`

## 2\. Excel 配置

> 64位系统：先将 `C:\Program Files (x86)` 目录下的 `REFPROP` 文件夹全部复制到 `C:\Program Files` 内。。。

- 新建一个excel表格
- 打开 `文件` - `选项` - `加载项`
- 选择下方的 `管理` - `excel加载项`
- 点击 `转到` - `浏览`
- 选择路径 `C:\Program Files\REFPROP\REFPROP.XLA`，`确定`
- 在单元格里输入 `=RefpropXLSVersionNumber()`
- 应该返回 `9.1` ，表明配置正确。

## 3\. 使用

### 3.1 常用函数

| 函数名 | 名称 | 单位 |
| --- | --- | --- |
| Temperature | 温度 | K |
| Pressure | 压力 | MPa |
| Density | 密度 | kg/m^3 |
| CompressibilityFactor | 压缩比 |
| LiquidDensity | 液体密度 | kg/m^3 |
| VaporDensity | 蒸汽密度 | kg/m^3 |
| Volume | 体积 | m^3/kg |
| Energy | 能量 | kJ/kg |
| Enthalpy | 焓 | kJ/kg |
| Entropy | 熵 | kJ/kg-K |
| IsochoricHeatCapacity | 等容热容量（ Cv） | kJ/kg-K |
| IsobaricHeatCapacity | 等压热容量（ Cp） | kJ/kg-K |
| SpeedOfSound | 声速 | m/s |
| HeatOfVaporization | 汽化潜热 | kJ/kg |
| VolumeExpansivity | 体积膨胀率 | 1/K |
| Viscosity | 粘性 | uPa-s |
| KinematicViscosity | 粘性 | cm^2/s |
| ThermalConductivity | 导热系数 | mW/m-K |
| Prandtl | 普朗特 |
| SurfaceTension | 表面张力 | mN/m |
| DielectricConstant | 介电常数 |
| MolarMass | 摩尔质量 | g/mol |
| MoleFraction | 摩尔分数 | mol/mol |
| MassFraction | 质量分数 | g/g |

### 3.2 使用说明

\= **Float** (FluidName, InpCode, Units, Prop1, Prop2)

- FluidName:
    - `"air", "water", "oxygen", "nitrogen"`
    - `"hydrogen", "carbon dioxide", "methane"`
- InpCode:
    - `"TP"`: 特定温度、压力下，Prop1为温度，Prop2为压力
    - `"Tliq"`, `"Pvap"`: 饱和温度、压力下，Prop1为温度/压力，Prop2为空
- Units: `"SI"`
- Prop1: `value1`
- Prop2: `value2`

**示例1**

- 标态下空气密度（0℃, 0.101325MPa）
- 公式 `= Density("air","TP","SI",273.15,0.101325)`
- 返回值：**1.293** (kg/m^3)

**示例2**

- 标准大气压下水蒸汽饱和温度（0.101325MPa）
- 公式 `= Temperature("water","Pliq","SI",0.101325)-273.15`
- 返回值：**99.97** (℃)
- 也可以直接使用摄氏度单位制：
- 公式 `= Temperature("water","Pliq","SI with C",0.101325)`
- 返回值：**99.97** (℃)

**示例3**

- 计算水蒸气的汽化潜热（0.101325MPa）
- 公式 `= HeatOfVaporization("water","Pvap","SI",0.101325)`
- 返回值：**2256.4** (kJ/kg)
- 也可以使用焓计算： `= Enthalpy("water","Pvap","SI",0.101325) - Enthalpy("water","Pliq","SI",0.101325)`
- 返回值：**2256.4** (kJ/kg)

* * *

> 更多用法见官方帮助文档 : https://www.nist.gov/sites/default/files/documents/srd/REFPROP9.PDF
