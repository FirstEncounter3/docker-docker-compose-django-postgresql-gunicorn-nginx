### Установка и запуск

1. Склонируйте репозиторий к себе: git clone https://github.com/FirstEncounter3/docker-docker-compose-django-postgresql-gunicorn-nginx.git
2. Откройте каталог, в который был склонирован репозиторий
3. Запустите в этом каталоге docker-compose -f docker-compose.prod.yaml up -d --build для создания образов и поднятия контейнеров с вебсервером gunicorn, postgresql, django и nginx.


### Использование
1. В адресной строке браузера введите localhost и нажмите enter (порт используется стандартный - 80)
2. Вас сразу же перебросит в админку Django. Для авторизации используйте логин:admin и пароль:admin