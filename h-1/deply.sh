#!/bin/bash
# Автоматическое поднятие контейнеров, запуск playbook и остановка контейнеров
docker rm -f $(docker ps -qa)
docker run -it -d --name fedora --privileged fedora:local /bin/bash
docker run -it -d --name ubuntu --privileged ubuntu:local /bin/bash
docker run -it -d --name centos7 --privileged centos:centos7 /bin/bash
cd ansible-hw/h-1/ 
ansible-playbook playbook/site.yml -i playbook/inventory/prod.yml --vault-password-file /home/danil/.pass.txt
docker stop $(docker ps -qa)
