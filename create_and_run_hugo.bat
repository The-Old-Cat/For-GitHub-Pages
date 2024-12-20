@echo off
REM Включение UTF-8 для корректного отображения кириллицы
chcp 65001 > nul

REM Запрос имени проекта
set /p PROJECT_NAME=Введите название проекта: 

REM Открытие диалогового окна для выбора директории
echo Выберите директорию для размещения проекта...
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; $folder = [Microsoft.VisualBasic.Interaction]::InputBox('Введите путь к папке, где будет создан проект:', 'Выбор директории'); if ($folder) {echo $folder} else {exit 1}}" > selected_dir.txt

REM Чтение выбранной директории
set /p BASE_DIR=<selected_dir.txt
del selected_dir.txt

REM Проверка, указана ли директория
if "%BASE_DIR%"=="" (
    echo Ошибка: директория не выбрана.
    pause
    exit /b
)

REM Создание директории проекта
SET PROJECT_DIR=%BASE_DIR%\%PROJECT_NAME%
echo Создание проекта Hugo с названием "%PROJECT_NAME%" в директории "%PROJECT_DIR%"...
hugo new site "%PROJECT_DIR%"

REM Проверка, успешно ли создан проект
if not exist "%PROJECT_DIR%" (
    echo Ошибка: не удалось создать проект.
    pause
    exit /b
)

REM Переход в директорию проекта
cd /d "%PROJECT_DIR%"

REM Установка темы (по желанию, замените на вашу тему)
echo Установка темы для проекта...
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
echo theme = "ananke" >> hugo.toml

REM Создание первой страницы
echo Создание первой страницы...
hugo new posts/my-first-post.md

REM Запуск сервера
echo Запуск сервера Hugo...
hugo server -D

REM Пауза, чтобы консоль не закрывалась после завершения работы
pause
