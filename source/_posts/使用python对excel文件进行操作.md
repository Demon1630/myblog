---
title: "使用python对excel文件进行操作"
date: 2021-12-20
categories: 
  - "python"
tags: 
  - "excel"
  - "python"
---

对合并单元格进行取消合并

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20211220230838.png)

```
import openpyxl
def chuli_excel(path):
    wb = openpyxl.load_workbook(path)
    print(wb.sheetnames)
    ws = wb['立体库出入库明细']
    m_list = ws.merged_cells   #获取合并的单元格信息
    print(m_list)
    cr = []
    for m_area in m_list:
        # 合并单元格的起始行坐标、终止行坐标。。。。，
        r1, r2, c1, c2 = m_area.min_row, m_area.max_row, m_area.min_col, m_area.max_col
        # 只对上下合并的单元格进行获取
        # if r2 - r1 > 0:
        #     cr.append((r1, r2, c1, c2))

        #获取所有的合并单元格
        cr.append((r1, r2, c1, c2))
    for r in cr:
        ws.unmerge_cells(start_row=r[0], end_row=r[1], start_column=r[2], end_column=r[3])
    wb.save(path)
```
