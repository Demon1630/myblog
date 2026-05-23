---
title: 使用python设置excel单元格格式为常规、日期、数字
date: 2021-12-21
categories:
- python
tags:
- excel
- python
---
使用openpyxl来设置Excel单元格的格式，总结如下：

一、导入：

from openpyxl.styles import numbers  或

import openpyxl

 

二、使用：

1、将单元格\[2,3\]，设置为 “常规” 格式

work\_sheet.cell(row=2, column=3).number\_format = 'General'

2、将单元格\[2,3\]，设置为 “纯文本” 格式

work\_sheet.cell(row=2, column=3).number\_format = '@'

3、将单元格\[2,3\]，设置为 “自定义” 格式中的“0”

work\_sheet.cell(row=2, column=3).number\_format = '0'

3、将单元格\[2,3\]，设置为 “自定义” 格式中的“0.000”

work\_sheet.cell(row=2, column=3).number\_format = '0.000'

 

三、具体详细：

```
# Copyright (c) 2010-2021 openpyxl

import re

from openpyxl.descriptors import (
    String,
    Sequence,
    Integer,
)
from openpyxl.descriptors.serialisable import Serialisable

BUILTIN_FORMATS = {
    0: 'General',
    1: '0',
    2: '0.00',
    3: '#,##0',
    4: '#,##0.00',
    5: '"$"#,##0_);("$"#,##0)',
    6: '"$"#,##0_);[Red]("$"#,##0)',
    7: '"$"#,##0.00_);("$"#,##0.00)',
    8: '"$"#,##0.00_);[Red]("$"#,##0.00)',
    9: '0%',
    10: '0.00%',
    11: '0.00E+00',
    12: '# ?/?',
    13: '# ??/??',
    14: 'mm-dd-yy',
    15: 'd-mmm-yy',
    16: 'd-mmm',
    17: 'mmm-yy',
    18: 'h:mm AM/PM',
    19: 'h:mm:ss AM/PM',
    20: 'h:mm',
    21: 'h:mm:ss',
    22: 'm/d/yy h:mm',

    37: '#,##0_);(#,##0)',
    38: '#,##0_);[Red](#,##0)',
    39: '#,##0.00_);(#,##0.00)',
    40: '#,##0.00_);[Red](#,##0.00)',

    41: r'_(* #,##0_);_(* \(#,##0\);_(* "-"_);_(@_)',
    42: r'_("$"* #,##0_);_("$"* \(#,##0\);_("$"* "-"_);_(@_)',
    43: r'_(* #,##0.00_);_(* \(#,##0.00\);_(* "-"??_);_(@_)',

    44: r'_("$"* #,##0.00_)_("$"* \(#,##0.00\)_("$"* "-"??_)_(@_)',
    45: 'mm:ss',
    46: '[h]:mm:ss',
    47: 'mmss.0',
    48: '##0.0E+0',
    49: '@', }

BUILTIN_FORMATS_MAX_SIZE = 164
BUILTIN_FORMATS_REVERSE = dict(
        [(value, key) for key, value in BUILTIN_FORMATS.items()])

FORMAT_GENERAL = BUILTIN_FORMATS[0]
FORMAT_TEXT = BUILTIN_FORMATS[49]
FORMAT_NUMBER = BUILTIN_FORMATS[1]
FORMAT_NUMBER_00 = BUILTIN_FORMATS[2]
FORMAT_NUMBER_COMMA_SEPARATED1 = BUILTIN_FORMATS[4]
FORMAT_NUMBER_COMMA_SEPARATED2 = '#,##0.00_-'
FORMAT_PERCENTAGE = BUILTIN_FORMATS[9]
FORMAT_PERCENTAGE_00 = BUILTIN_FORMATS[10]
FORMAT_DATE_YYYYMMDD2 = 'yyyy-mm-dd'
FORMAT_DATE_YYMMDD = 'yy-mm-dd'
FORMAT_DATE_DDMMYY = 'dd/mm/yy'
FORMAT_DATE_DMYSLASH = 'd/m/y'
FORMAT_DATE_DMYMINUS = 'd-m-y'
FORMAT_DATE_DMMINUS = 'd-m'
FORMAT_DATE_MYMINUS = 'm-y'
FORMAT_DATE_XLSX14 = BUILTIN_FORMATS[14]
FORMAT_DATE_XLSX15 = BUILTIN_FORMATS[15]
FORMAT_DATE_XLSX16 = BUILTIN_FORMATS[16]
FORMAT_DATE_XLSX17 = BUILTIN_FORMATS[17]
FORMAT_DATE_XLSX22 = BUILTIN_FORMATS[22]
FORMAT_DATE_DATETIME = 'yyyy-mm-dd h:mm:ss'
FORMAT_DATE_TIME1 = BUILTIN_FORMATS[18]
FORMAT_DATE_TIME2 = BUILTIN_FORMATS[19]
FORMAT_DATE_TIME3 = BUILTIN_FORMATS[20]
FORMAT_DATE_TIME4 = BUILTIN_FORMATS[21]
FORMAT_DATE_TIME5 = BUILTIN_FORMATS[45]
FORMAT_DATE_TIME6 = BUILTIN_FORMATS[21]
FORMAT_DATE_TIME7 = 'i:s.S'
FORMAT_DATE_TIME8 = 'h:mm:ss@'
FORMAT_DATE_TIMEDELTA = '[hh]:mm:ss'
FORMAT_DATE_YYMMDDSLASH = 'yy/mm/dd@'
FORMAT_CURRENCY_USD_SIMPLE = '"$"#,##0.00_-'
FORMAT_CURRENCY_USD = '$#,##0_-'
FORMAT_CURRENCY_EUR_SIMPLE = '[$EUR ]#,##0.00_-'

COLORS = r"\[(BLACK|BLUE|CYAN|GREEN|MAGENTA|RED|WHITE|YELLOW)\]"
LITERAL_GROUP = r'".*?"' # anything in quotes
LOCALE_GROUP = r'\[(?!hh?\]|mm?\]|ss?\])[^\]]*\]' # anything in square brackets, except hours or minutes or seconds
STRIP_RE = re.compile(f"{LITERAL_GROUP}|{LOCALE_GROUP}")
TIMEDELTA_RE = re.compile(r'\[hh?\](:mm(:ss(\.0*)?)?)?|\[mm?\](:ss(\.0*)?)?|\[ss?\](\.0*)?', re.I)

```
