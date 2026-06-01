@echo off
setlocal
set "AIDER_USER_ENV=%USERPROFILE%\.aider\aider.env"
if not exist "%AIDER_USER_ENV%" (
  echo LM Studio aider config not found: %AIDER_USER_ENV%
  echo Run:  powershell -File "%~dp0install-user-config.ps1"
  exit /b 1
)
aider --env-file "%AIDER_USER_ENV%" %*
