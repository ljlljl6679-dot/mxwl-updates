@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"
set "REPO=https://github.com/ljlljl6679-dot/mxwl-updates.git"
where git >nul 2>nul
if errorlevel 1 (
  echo [ERROR] This script requires Git for Windows. Install from https://git-scm.com/downloads/win
  pause
  exit /b 1
)
if not exist "manifest.json" (
  echo [ERROR] manifest.json not found.
  pause
  exit /b 1
)
if not exist ".git\" (
  git init
  if errorlevel 1 goto fail
  git branch -M main
  git remote add origin "%REPO%"
  git config --local user.name "MXWL Game Center"
  git config --local user.email "246611885+ljlljl6679-dot@users.noreply.github.com"
) else (
  git branch -M main
  git remote set-url origin "%REPO%" >nul 2>nul
)
rem Explicit file paths only: never upload administrator private keys.
git add -- .nojekyll index.html manifest.json files README.md
if errorlevel 1 goto fail
git diff --cached --quiet
if errorlevel 1 (
  git commit -m "Publish MXWL official updates"
  if errorlevel 1 goto fail
) else (
  echo No changes to commit.
)
echo Uploading to GitHub; sign in through browser if Git asks.
git push --set-upstream origin main
if errorlevel 1 goto fail
echo.
echo Success. Configure Settings ^> Pages ^> Deploy from a branch ^> main ^> /(root).
echo URL: https://ljlljl6679-dot.github.io/mxwl-updates/manifest.json
pause
exit /b 0
:fail
echo [ERROR] Upload failed. Make sure the empty public repository exists and Git credentials are available.
pause
exit /b 1
