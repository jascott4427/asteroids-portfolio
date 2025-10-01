@echo off
echo ========================================
echo Django Development Server Launcher
echo ========================================

REM ========================================
REM CONFIGURE THESE PATHS FOR YOUR PROJECT
REM ========================================
set VENV_PATH=C:\Users\erica\OneDrive\Documents\GitHub\asteroids-portfolio\venv\Scripts\activate.bat
set PROJECT_PATH=C:\Users\erica\OneDrive\Documents\GitHub\asteroids-portfolio\portfolio
REM ========================================

echo Checking paths...

REM Check if virtual environment exists
if not exist "%VENV_PATH%" (
    echo ERROR: Virtual environment not found at:
    echo %VENV_PATH%
    echo Please update the VENV_PATH in this batch file.
    pause
    exit /b 1
)

REM Check if project directory exists
if not exist "%PROJECT_PATH%" (
    echo ERROR: Project directory not found at:
    echo %PROJECT_PATH%
    echo Please update the PROJECT_PATH in this batch file.
    pause
    exit /b 1
)

REM Check if manage.py exists in project directory
if not exist "%PROJECT_PATH%\manage.py" (
    echo ERROR: manage.py not found in project directory!
    echo Please make sure PROJECT_PATH points to your Django project root.
    pause
    exit /b 1
)

echo All paths verified successfully!
echo.

REM Activate virtual environment
echo Activating virtual environment...
call "%VENV_PATH%"

if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to activate virtual environment!
    pause
    exit /b 1
)

REM Change to project directory
cd /d "%PROJECT_PATH%"

echo Virtual environment activated.
echo Project directory: %PROJECT_PATH%
echo.
echo Starting Django development server...
echo Press Ctrl+C to stop the server
echo ========================================

REM Run the Django development server
python manage.py runserver

REM If server stops, keep the window open
echo.
echo Server stopped.
pause