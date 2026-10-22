@echo off
title Git Auto Update

echo Checking Git status...
git status
if errorlevel 1 goto error

echo.
echo Pulling latest changes from origin/main...
git pull --rebase origin main
if errorlevel 1 goto error

echo.
echo Staging changes...
git add .
if errorlevel 1 goto error

echo.
git diff --cached --quiet
if not errorlevel 1 (
    echo No changes to commit.
    goto push
)

set /p message=Enter commit message:
if "%message%"=="" goto error

echo.
git commit -m "%message%"
if errorlevel 1 goto error

:push
echo.
echo Pushing changes to origin/main...
git push -u origin main
if errorlevel 1 goto error

echo.
echo Git update completed successfully.
pause
exit /b 0

:error
echo.
echo Git operation failed. Check the error above.
echo Resolve the issue before trying again.
pause
exit /b 1
