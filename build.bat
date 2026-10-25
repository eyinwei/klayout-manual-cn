@echo off
rem Compile the Chinese KLayout manual with XeLaTeX (two passes for TOC and refs).
rem Usage: double-click this file, or run "build.bat" in a terminal.
cd /d "%~dp0"
if not exist build mkdir build
xelatex -interaction=nonstopmode -output-directory=build main.tex
xelatex -interaction=nonstopmode -output-directory=build main.tex
if exist build\main.pdf (
  echo.
  echo [OK] build\main.pdf generated
) else (
  echo.
  echo [FAIL] compile failed, see build\main.log
)
pause
