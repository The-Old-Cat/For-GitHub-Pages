# For-GitHub-Pages

## Выполните эти команды, чтобы создать сайт Hugo с темой `Ananke`

Данные инструкции взяты со страницы [Быстрый старт Hugo](https://gohugo.io/getting-started/quick-start/)

Создайте структуру каталогов для вашего проекта в `name_site` каталоге

```sh
hugo new site name_site
```

Переходим в каталог проекта

```sh
cd name_site
```

Инициализируйте пустой репозиторий Git в текущем каталоге.

```sh
git init
```

Клонируйте тему `Ananke` в каталог themes и добавьте её в свой проект в качестве подмодуля `Git`.
и добавьте строку в файл конфигурации сайта, указывающую текущую тему.

```sh
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
echo "theme = 'ananke'" >> hugo.toml
```

Запустите сервер разработки Hugo в режиме `livereload`, чтобы просмотреть сайт.

```sh
hugo server -D
```

## Настройка сайта

С помощью редактора откройте файл конфигурации сайта `hugo.toml` в корневом каталоге вашего проекта.
Добавление контента

```sh
hugo new content content/posts/example-post.md
```
