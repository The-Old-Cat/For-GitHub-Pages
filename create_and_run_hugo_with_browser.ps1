# Установка кодировки для поддержки кириллицы
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Функция для выбора директории через окно проводника
function Select-FolderDialog {
    Add-Type -AssemblyName System.Windows.Forms
    $folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    $folderBrowser.Description = "Выберите директорию для проекта"
    $folderBrowser.ShowNewFolderButton = $true
    if ($folderBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        return $folderBrowser.SelectedPath
    } else {
        Write-Host "Директория не выбрана. Выход..." -ForegroundColor Yellow
        Exit
    }
}

# Запрос имени проекта
$ProjectName = Read-Host "Введите название проекта"

# Выбор базовой директории через проводник
$BaseDir = Select-FolderDialog
$ProjectDir = Join-Path -Path $BaseDir -ChildPath $ProjectName

# Создание проекта Hugo
Write-Host "Создание проекта Hugo с названием '$ProjectName'..."
hugo new site $ProjectDir

# Проверка, успешно ли создан проект
if (!(Test-Path -Path $ProjectDir)) {
    Write-Host "Ошибка: не удалось создать проект." -ForegroundColor Red
    Pause
    Exit
}

# Переход в директорию проекта
Set-Location -Path $ProjectDir

# Установка темы (по желанию, замените на вашу тему)
Write-Host "Установка темы для проекта..."
git init
git clone https://github.com/spech66/materialize-bp-hugo-theme.git themes/materialize-bp-hugo-theme
Add-Content -Path "hugo.toml" -Value 'theme = "materialize-bp-hugo-theme"'


# # Создание первой страницы
# Write-Host "Создание первой страницы..."
# hugo new posts/my-first-post.md

# Запуск сервера
Write-Host "Запуск сервера Hugo..."
# hugo server -D
hugo server -t materialize-bp-hugo-theme
# Пауза, чтобы окно не закрылось сразу после завершения
Pause
