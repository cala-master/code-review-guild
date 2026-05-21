@echo off
setlocal

if "%~1"=="session-start" (
  bash "%~dp0session-start.sh"
  exit /b %errorlevel%
)

echo Unknown hook: %~1 1>&2
exit /b 1
