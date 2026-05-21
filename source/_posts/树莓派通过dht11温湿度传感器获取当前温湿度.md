---
title: "树莓派通过DHT11温湿度传感器获取当前温湿度"
date: 2021-04-12
categories: 
  - "树莓派"
tags: 
  - "python"
  - "树莓派"
---

## DHT11温湿度传感器参数

- 供电电压为 3－5.5V
- 湿度测量范围：20－90％RH
- 温度测量范围：0－50℃
- 测湿度、温度精度：±5％RH  、  ±2℃

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/eaff5ee7cdafb8c13811794a1e3592d.jpg)

## 连接方式

参考[树莓派引脚对照表](http://www.demon1630.cn/%E6%A0%91%E8%8E%93%E6%B4%BE%E5%BC%95%E8%84%9A%E5%AF%B9%E7%85%A7%E8%A1%A8/)

1. GND连接树莓派6号引脚
2. DATA连接树莓派3号引脚
3. VCC连接树莓派1号引脚

## python读取代码

```
#!/usr/bin/python
import RPi.GPIO as GPIO
import time

channel =2
data = []
j = 0

GPIO.setmode(GPIO.BCM)

GPIO.setup(channel, GPIO.OUT)
GPIO.output(channel, GPIO.LOW)
time.sleep(0.025)
GPIO.output(channel, GPIO.HIGH)
GPIO.setup(channel, GPIO.IN)

while GPIO.input(channel) == GPIO.LOW:
  continue
while GPIO.input(channel) == GPIO.HIGH:
  continue

while j < 40: 
  k = 0 
while GPIO.input(channel) == GPIO.LOW: 
  continue 
while GPIO.input(channel) == GPIO.HIGH: 
  k += 1 
  if k > 100:
      break
  if k < 8:
    data.append(0)
  else:
    data.append(1)

  j += 1

print "DHT11 sensor is working."

humidity_bit = data[0:8]
humidity_point_bit = data[8:16]
temperature_bit = data[16:24]
temperature_point_bit = data[24:32]
check_bit = data[32:40]

humidity = 0
humidity_point = 0
temperature = 0
temperature_point = 0
check = 0

for i in range(8):
  humidity += humidity_bit[i] * 2 ** (7-i)
  humidity_point += humidity_point_bit[i] * 2 ** (7-i)
  temperature += temperature_bit[i] * 2 ** (7-i)
  temperature_point += temperature_point_bit[i] * 2 ** (7-i)
  check += check_bit[i] * 2 ** (7-i)

tmp = humidity + humidity_point + temperature + temperature_point

if check == tmp:
  print ""
  print "temperature :", temperature, "*C, humidity :", humidity, "%"
else:
  print "crc wrong"
  print "check :", check, ", tmp :", tmp

GPIO.cleanup()
```

保存为dht11.py，然后执行

```
python dht11.py
```

之后就可以看到当前输出的温度和湿度信息
