# Домашнее задание к занятию 1 «Введение в Ansible» - Логинов Даниил

## Подготовка к выполнению

1. Установите Ansible версии 2.10 или выше.
2. Создайте свой публичный репозиторий на GitHub с произвольным именем.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.

## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.
2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.
3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.
4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.
5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.
6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.
7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.
8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.
9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.
10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.
11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.
12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.
13. Предоставьте скриншоты результатов запуска команд.

## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.
2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.
3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.
4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).
5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.
6. Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.

---

## Результат выполнения команд
Задание 1

![Задание 1](https://github.com/Loginochka/ansible-hw/blob/main/media/play_with_test.yml.png)

Задание 4

![Задание 4](https://github.com/Loginochka/ansible-hw/blob/main/media/play_via_docker.png)

Задание 6

![Задание 6](https://github.com/Loginochka/ansible-hw/blob/main/media/change_groups_vars.png)

Задание 7

![Задание 7](https://github.com/Loginochka/ansible-hw/blob/main/media/encrypt_vars.png)

Задание 8

![Задание 8](https://github.com/Loginochka/ansible-hw/blob/main/media/play_with_vault.png)

Задание 11

![Задание 11](https://github.com/Loginochka/ansible-hw/blob/main/media/play_with_localhost.png)

Задание 1*

![Задание 1*](https://github.com/Loginochka/ansible-hw/blob/main/media/decrypt_vars.png)

Задание 2*

![Задание 2*](https://github.com/Loginochka/ansible-hw/blob/main/media/decrypt_vars.png)

Задание 3*

![Задание 3*](https://github.com/Loginochka/ansible-hw/blob/main/media/play_with_encrypt_string.png)

Задание 4*

![Задание 4*](https://github.com/Loginochka/ansible-hw/blob/main/media/play_with_fedora.png)

Задание 5*
```bash
#!/bin/bash
# Автоматическое поднятие контейнеров, запуск playbook и остановка контейнеров - Логинов Д.А
docker rm -f $(docker ps -qa)
docker run -it -d --name fedora --privileged fedora:local /bin/bash
docker run -it -d --name ubuntu --privileged ubuntu:local /bin/bash
docker run -it -d --name centos7 --privileged centos:centos7 /bin/bash
cd ansible-hw/h-1/ 
ansible-playbook playbook/site.yml -i playbook/inventory/prod.yml --vault-password-file /home/danil/.pass.txt
docker stop $(docker ps -qa)
```
