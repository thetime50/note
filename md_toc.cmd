@echo off
set toc_main_path=D:\1024\Python\practice\practice\md_toc\main.py

python "%toc_main_path%" %*
::>> "%~p1/toc.log"
::type "%~p1/toc.log"
cmd