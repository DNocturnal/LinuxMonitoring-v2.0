# Установка и настройка инструментов

## - https://jhooq.com/prometheous-grafan-setup/

# Grafana

## Если не получается установить графану из-за ограничений, можно этот вариант использовать 
- wget https://dl.grafana.com/oss/release/grafana_9.2.4_amd64.deb
- sudo dpkg -i grafana_9.2.4_amd64.deb && \ sudo systemctl enable grafana-server && sudo systemctl start grafana-server

# Немного про метрики 
### https://habr.com/ru/companies/tochka/articles/683608/
### https://habr.com/ru/companies/tochka/articles/685636/
### https://www.dmosk.ru/miniinstruktions.php?mini=prometheus-request

# Настройка дашборда
![07_00](../../misc/images/07_00.png)
## RAM
![07_01](../../misc/images/07_RAM01.png)
## I/O Operations
![07_02](../../misc/images/07_IO01.png)
![07_02](../../misc/images/07_IO02.png)
## Free space
![07_03](../../misc/images/07_FS01.png)
## CPU
![07_04](../../misc/images/07_CPU01.png)

# Нагрузка после выполенения команды stress(15:45-15:50)
![07_05](../../misc/images/07_stress.png)

# Нагрузка после выполнения part 1
![07_06](../../misc/images/07_part1.png)
