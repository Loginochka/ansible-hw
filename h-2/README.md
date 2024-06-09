## Ansible Playbook для запуска Clickhouse + Vector

### Особоенности:
* Поддерживает CentOS7/9
* Установка и настройка тестовой конфигурации Clickhouse и Vector
* Готовый sql dump под syslog *nix 
* Гибкая настройка конфига Vector посредством Jinja template
---
### Требования к окружению
* ansible 2.16.5 
* jinja 3.1.3
* python 3.10.12
* GCC 11.4.0
---
## Первоначальная настройка 
Заполните инвентарный файл **[inventory/prod.yml](https://github.com/Loginochka/ansible-hw/blob/main/h-2/playbook/inventory/prod.yml)**
```YML
ansible_host: "IP_VM"
ansible_ssh_user: "USER"
ansible_ssh_private_key_file: "PRIVATE_KEY"
```

Укажите необходимую версию clickhouse **[clickhouse/vars.yml](https://github.com/Loginochka/ansible-hw/blob/main/h-2/playbook/group_vars/clickhouse/vars.yml)**, например "22.3.3.44"
```YML
clickhouse_version: 22.3.3.44
```
Укажите необходимую версию vector **[vector/vars.yml](https://github.com/Loginochka/ansible-hw/blob/main/h-2/playbook/group_vars/vector/vars.yml)**, например "0.38.0"
```YML
vector_version: 0.38.0
```

В файле **[vector/vars.yml](https://github.com/Loginochka/ansible-hw/blob/main/h-2/playbook/group_vars/vector/vars.yml)** укажите IP на котором будет запущен clickhouse, если сервис будет запущен на одной инстансе, то оставьте настройку как есть
```YML
endpoint: http://localhost:8123
```

## Play

#
    ansible-playbook site.yml -i inventory/prod.yml
**Note**: После выполнения playbook Vector сразу начнет писать лог в БД 

## Документация 

**[What Is ClickHouse](https://clickhouse.com/docs/en/intro)**

**[vector - A lightweight, ultra-fast tool for building observability pipelines](https://vector.dev/)**

## Лицензия 
This project is licensed under the [MIT License](https://github.com/Loginochka/ansible-hw/blob/main/LICENSE).


---
## Результат выполнения команд 5-8

![6](https://github.com/Loginochka/ansible-hw/blob/main/media/play_flag_check.png)

![7.1](https://github.com/Loginochka/ansible-hw/blob/main/media/play_flag_dif_p1.png)

![7.2](https://github.com/Loginochka/ansible-hw/blob/main/media/play_flag_dif_p2.png)

![8](https://github.com/Loginochka/ansible-hw/blob/main/media/play_flag_dif_again.png)