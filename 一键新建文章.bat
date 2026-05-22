@echo off
chcp 65001 > nul
cls
echo ====================================================
echo               Hexo Matery 新文章自动生成器
echo ====================================================
echo.

:: 1. 提示输入文章标题
set /p post_title="请输入新文章的标题: "

:: 如果直接回车，则用当前日期命名
if "%post_title%"=="" set post_title=新文章_%date:~0,4%%date:~5,2%%date:~8,2%

:: 2. 强力获取标准的 YYYY-MM-DD 日期（无视系统语言和格式干扰）
for /f "tokens=1 delims= " %%a in ('powershell -Command "Get-Date -Format 'yyyy-MM-dd'"') do set current_date=%%a

:: 3. 设定生成路径
set filepath=source\_posts\%post_title%.md

:: 4. 严格写入标准 Front-matter 头部配置
(
echo ---
echo title: "%post_title%"
echo date: %current_date%
echo categories:
echo   - "未分类"
echo tags:
echo   - "标签1"
echo img: /medias/featureimages/0.jpg
echo summary: 这里写文章的简短摘要
echo top: false
echo cover: false
echo ---
echo.
echo 在这里开始用 Markdown 语法编写你的正文内容...
) > "%filepath%"

echo.
echo ----------------------------------------------------
echo [🎉 成功] 文章《%post_title%》已完美生成！
echo [💡 提示] 日期已通过 PowerShell 强制格式化为: %current_date%
echo ----------------------------------------------------
echo.
pause