Задание №1-2(testquest):

Структура проекта:

testquest/
├── docker-compose.yml
├── nginx/
│   └── default.conf
├── php/
│   ├── Dockerfile
│   ├── composer.json
│   └── src/
│       └── index.php
└── prometheus
    └── prometheus.yml

1. Запуск проекта:
sudo docker-compose up -d --build

2. Проверка:
После запуска приложение будет доступно: 
http://localhost:8080 - проверка 1 задания
http://localhost:9090/targets - prometheus
http://localhost:3000 - grafana

# Не удалось вывести информацию на дашборды графаны, но prometheus как data sourse доступен.

Задание №3(testquest2):

Структура проекта:

testquest2/
├──playbook.yml - сам playbook
└──inventory.ini - нужен для указания хостов

# Для проверки взял репозиторий с docker-compose.yml: https://github.com/nginx-proxy/nginx-proxy.git
# Если хотите протестировать, для начала вам нужно прокинуть ssh ключ на нужный вам хост, затем
# укажите IP/имя вашего управляемого хоста, имя пользователя и место хранения ключа в inventory.ini
# и только потом запускайте playbook

1) Запуск:
ansible-playbook -i inventory.ini playbook.yml --ask-become-pass

#--ask-become-pass - запрос sudo пароля

Задание №4(testquest3):

testquest2/
└──port_check.sh

Запуск скрипта: ./port_check.sh google.com 80

# Требует: nc (netcat). (может быть не предустановлено)
# Выводит информацию о доступности или недоступности порта определенного хоста в терминал.
# Записывает в лог файл(создается в той же директории) в случае недоступности порта определенного хоста.





