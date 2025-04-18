# CLI-Commands

CLI-Commands &amp; helpful links

---
## Linux commands

### 3. Работа с Терминалом

| Command         | Description                       |
|-----------------|-----------------------------------|
| `man`           | - помощь                          |
| `man -k`        | - помощь по ключевым словам       |
| `info`          | - тоже помощь                     |
| `uptime`        | - время с последнего включения    |
| `lscpu`         | - данные процессора               |
| `uname -a`      | - информация об ОС                |
| `hostname`      | - имя хоста                       |
| `whatis`        | - показывает что делает команда   |
| `whereis`       | - показывает где файл             |
| `locate`        | - показывает где файл             |
| `ls`            | - показать что в этой директории  |
| `ls -a`         | - показать скрытые файлы          |
| `ls –la –R  /`  | - показать все на хосте           |
| Ctrl+Z          | - отправить процесс на background |
| Ctrl+C          | - прекратить процесс вообще       |
| Ctrl+Alt+F3 -F6 | - tty3-tty6                       |
| Ctrl+Alt+F2     | - выход из tty                    |

### 4. Навигация по файлам и директориям

| Command | Description                        |
|---------|------------------------------------|
| `cd`    | - сменить директорию               |
| `ls`    | - вывести содержимое директории    |
| `pwd`   | - вывести путь где мы сейчас       |
| `~`     | - сокращение нашей Home директории |
| `/`     | - коренная директория Linux        |
| `..`    | - директория которая выше          |
| `.`     | - директория где мы сейчас         |

### 5. Работа с Файлами

| Command | Description                                                           |
|---------|-----------------------------------------------------------------------|
| `cat`   | - вывод содержимого файла                                             |
| `more`  | - вывод содержимого файла по строкам                                  |
| `less`  | - вывод содержимого файла с возможностью просмотра и поиска (/[text]) |
| `q`     | - выход                                                               |
| `touch` | - создать файл или обновить время создания                            |
| `cp`    | - скопировать файл                                                    |
| `mv`    | - перенести файл или переименовать                                    |
| `rm`    | - стереть файл                                                        |

### 6. Работа с Директориями

| Command        | Description                                       |
|----------------|---------------------------------------------------|
| `mkdir`        | - создать директорию                              |
| `mkdir -p`     | - создать директорию в несуществующей директории  |
| `rmdir`        | - стереть пустую директорию                       |
| `cp`           | - копировать директорию                           |
| `mv`           | - переименовать или перенести директорию          |
| `rm –R`        | - стереть не пустую директорию со всем что внутри |
| `sudo rm –R /` | - замочить систему Linux                          |

### 7. Создание Линков

**Создание символичных линков и дубликатов**

| Command | Description                                                  |
|---------|--------------------------------------------------------------|
| `ln`    | - создать дубликат файла                                     |
| `ln –s` | - создать symbolic линк на файл или директорию типа Shortcut |

### 8. Команды: find, cut, sort, wc

| Command | Description                            |
|---------|----------------------------------------|
| `find`  | - найти файл                           |
| `wc`    | - вывести количество строк, слов, байт |
| `cut`   | - вывести определенное поле из текста  |
| `sort`  | - вывести отсортированный текст        |

### 9. Команда grep и Регулярные Выражения

`grep`        - поиск определенного слова в файле и вывод строк с этим словом

**Регулярные Выражения:**

| Command                 | Description                                   |
|-------------------------|-----------------------------------------------|
| [A-Z]*                  | - любое слово из больших букв                 |
| [0-9]*                  | - сколько угодно подряд стоящих цифр          |
| [A-Za-z]*@[A-Za-z]*.com | - простое выражение емайлов с окончанием .com |
| www.[a-z]*.com          | - любой вэб адрес  с окончанием .com          |

### 10. Перенаправление вывода ввода

| Command                                      | Description                                                                                                                                                                                                            |
|----------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| /dev/null                                    | - устройство находящиеся в ж#$е                                                                                                                                                                                        |
| `sort names.txt`                             | - сортировка текста внутри файла по имени                                                                                                                                                                              |
| `sort names.txt > sort_names.txt`            | - сортировка имен внутри файла и создание нового файла с отсортированными именами                                                                                                                                      |
| `sort -n numbers.txt > sort_names.txt`       | - сортирует номера в файле с номерами и перезапишет это в файл сорт_нэймс.тхт с удалением имеющейся в конечном файле информации.                                                                                       |
| `sort names.txt >> sort_names.txt`           | - добавить текст без уничтожения текста из конечного файла.                                                                                                                                                            |
| `sort names.txt > names.txt`                 | - система сначала создаст новый файл names.txt (или пересоздаст его с нулевым объемом), а затем уже начнет выполнять с ним какие-то функции. Поэтому данная команда просто уничтожит все данные в файле до сортировки. |
| `grep denis /etc/*`                          | - выдает все ответы, в каких файлах встречается слово denis в подкаталогах каталога etc.                                                                                                                               |
| `grep denis /etc/* 2> errors.txt`            | - плохие ответы permission denied и т.д. - неправильный поток с ошибками - уходит либо в никуда (если нет файла) либо в файл errors.txt                                                                                |
| `grep denis /etc/* 2> /dev/null` `           | - перенаправил плохие ответы в никуда                                                                                                                                                                                  |
| `grep denis /etc/* > good.txt 2> errors.txt` | - выданные хорошие ответы без ошибок будут записаны в файл good.txt, а второсортные (плохие) ответы - в errors.txt                                                                                                     |
| `grep denis /etc/* > good.txt`               | - в good.txt сохранятся только хорошие ответы                                                                                                                                                                          |
| `grep denis /etc/* &> results.txt`           | - записывает в results.txt и плохие и хорошие ответы                                                                                                                                                                   |

### 11. Архивирование и Сжатие tar, gzip, bzip2, xz, zip

| Command                        | Description                    |
|--------------------------------|--------------------------------|
| `tar cf mytar.tar Folder1`     | - заархивировать Folder1       |
| `tar xf mytar.tar`             | - разархивировать архив        |
| `gzip` / `bzip2` / `xz`        | - скомпрессировать файл        |
| `gunzip` / `bunzip2` / `unxz`  | - раскомпрессировать файл      |
| `tar cvzf myBZIP2.bz2 Folder1` | - сжать Folder1                |
| `tar xvf  myBZIP2.bz2`         | - распаковать архив            |
| `tar tf myBZIP2.bz2`           | - посмотреть что внутри архива |
| `zip –r myZIP.zip Folder1`     | - запаковать Folder1 в ZIP     |
| `unzip myZIP.zip`              | - распаковать файл myZIP.zip   |

### 12. Процессы и Память

| Command               | Description                                     |
|-----------------------|-------------------------------------------------|
| `top`                 | - как Task Manager в Windows                    |
| `free`                | - показать состояние памяти в байтах            |
| `free –h`             | - показать состояние памяти в MB, GB            |
| `df`                  | - состояние дисков                              |
| `du`                  | - размер файлов                                 |
| `ps`                  | - показать мои процессы                         |
| `ps aux`              | - показать все процессы от всех пользователей   |
| `ps aux \| grep bash` | - найти все процессы bash от всех пользователей |
| `var/log`             | - все логи                                      |
| `dmesg`               | - текущий лог в оперативке                      |

### 13. Редактирование Файлов

| Command        | Description                                                                 |
|----------------|-----------------------------------------------------------------------------|
| `vi` или `vim` | - самый старый и дурацкий редактор                                          |
| `pico`         | - новый редактор                                                            |
| `nano`         | - самый новый редактор                                                      |
| `gedit`        | - как и Notepad в Windows, работает только  если есть графический интерфейс |

### 14. Типы аккаунтов и важные файлы

| Command     | Description                                         |
|-------------|-----------------------------------------------------|
| `sudo`      | - запустить команду используя Super User права      |
| `su`        | - сменить текущего пользователя                     |
| `whoami`    | - показать имя текущего пользователя                |
| `id`        | - показать к каким группам принадлежит пользователь |
| `who`       | - показать кто сейчас в системе                     |
| `w`         | - показать кто сейчас в системе и что делает        |
| `last`      | - показать последние логины                         |
|             |                                                     |
| /etc/passwd | - тут хранятся все аккаунты                         |
| /etc/shadow | - тут хранятся все пароли аккаунтов                 |
| /etc/group  | - тут хранятся все группы                           |

### 15. Пользователи и Группы

| Command                         | Description                                       |
|---------------------------------|---------------------------------------------------|
| `useradd -m vasya`              | - создать юзера vasya с домашней  директорией     |
| `userdel -r vasya`              | - стереть юзера vasya с его домашней  директорией |
| /etc/skel                       | - это шаблон домашней директории                  |
| `passwd vasya`                  | - изменить пароль для юзера vasya                 |
|                                 |                                                   |
| `groupadd Programmers`          | - создать группу Programmers                      |
| `groupdel Programmers`          | - стереть группу Programmers                      |
|                                 |                                                   |
| `usermod –aG Programmers vasya` | - добавить юзера vasya в группу Programmers       |
| `deluser vasya Programmers`     | - удалить юзера vasya  из групы Programmers       |

### 16. Права Доступа и владения файлами и директориями

| Command                                                                         | Description                                             |
|---------------------------------------------------------------------------------|---------------------------------------------------------|
| `chown`                                                                         | – изменить владельца файла / директории                 |
| `chgrp`                                                                         | – изменить группу файла / директории                    |
| `сhmod`                                                                         | – изменить права доступа на файл / директорию           |
|                                                                                 |                                                         |
| `chmod  ugo+x  myfile.txt`                                                      | - добавить X всем                                       |
| `сhmod  g-rw   myfile.txt`                                                      | - убрать RW у группы                                    |
| `chmod  o=rw   myfile.txt`<br/>u = user<br/>g = group<br/>o = other<br/>a = ugo | - установить RW всем остальным                          |
|                                                                                 |                                                         |
| `chmod  777   myfile.txt`                                                       | - установить RWX всем                                   |
| `chmod  741   myfile.txt`<br/>r = 4<br/>w = 2<br/>x = 1                         | - установить: RWX владельцу, R группе, X всем остальным |
|                                                                                 |                                                         |
| `chmod 1777 myDir`                                                              | - включить StickyBit                                    |
| `chmod 0777 myDir`                                                              | - выключить StickyBit                                   |

### 17. Сетевые команды

| Command        | Description                             |
|----------------|-----------------------------------------|
| `ifconfig`     | - показать мой IP адрес                 |
| `ip addr show` | - показать мой IP адрес                 |
| `route`        | - показать адрес роутера Gateway        |
| `ping`         | - протестировать коннекшен к адресу     |
| `host`         | - дать IP адрес вэб сайта               |
| `dig`          | - дать IP адрес вэб сайта               |
| `netstat`      | – выдать сетевые подключения компьютера |

### 18. Скачивание и Установка программ

| Command                            | Description                          |
|------------------------------------|--------------------------------------|
| `wget`                             | - скачать файл из интернета          |
|                                    |                                      |
| **Ubuntu/Debian/Kali/Mint Linux:** |                                      |
| `apt-get install`                  | - скачать и установить программу     |
| `apt-get remove`                   | - удалить программу                  |
| `dpkg –i`                          | - установить программу из файла .deb |
| `dpkg –r`                          | - удалить программу                  |
| **RedHat/CentOS/Amazon Linux:**    |                                      |
| `yum install`                      | - скачать и установить программу     |
| `yum remove`                       | - удалить программу                  |
| `rpm –i`                           | - установить программу из файла .rpm |
| `rpm –e`                           | - удалить программу                  |

### 19. Скрипты Linux Bash

`./myscript.sh  Vasya  Petya  Kolya`

$0 при этом равен  ./myscript.sh
$1 при этом равен Vasya
$2 при этом равен Petya
$3 при этом равен Kolya

| Command                                   | Description                                                                                                                                                                 |
|-------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| myOS=\`uname –a\`                         | - запускает uname –a и сохраняет  результат в переменную myOS                                                                                                               |
| `read –p “Please enter your name: “ name` | - сохранить ввод пользователя в переменную name                                                                                                                             |
| `bash set`                                |                                                                                                                                                                             |
| `set -e`                                  | - в скриптах, завершит выполнение скрипта как только случится ошибка, без этого флага ошибка останется незамеченной и скрипт продолжит выполнение                           |
| `set -x`                                  | - печатать команды в терминал, полезно для отладочных целей                                                                                                                 |
| `set -u`                                  | - если произойдет обращение к переменной, которая не была объявлена в скрипте, то скрипт упадет. В противном случае, отсутствующая переменная будет интерпретирована как "" |
| `set -o pipefail`                         | - по умолчанию из пайпа возвращается код последней команды, с этим флагом если посередине исполнения образуется ненулевой код, то он и будет возвращен                      |
| `export VAR='Lost'`                       | - добавить переменную                                                                                                                                                       |

**Отладка скрипта bash при помощи команды trap**

```
#!/bin/bash

trap 'echo "# $BASH_COMMAND";read' DEBUG

echo line1
echo line2
echo line3
```
Перед выполнением каждой строки скрипта будет выводиться значение $BASH_COMMAND (которая будет сейчас выполняться) и будет запрошен ввод для продолжения

Стресс-тесты на проц:
```
#!/bin/bash
md5sum /dev/urandom - Single thread CPU test
stress --cpu 4 --timeout 600s - Multi threadCPU test
cat /dev/zero | bzip2 -c > /dev/null - CPU Stress Test
```

---
## Global Linux Commands

| Command                                                             | Description                                                                                                                                                        |
|---------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `sed 's/old_string/new_string/' filename.txt`                       | - используется для замены текста                                                                                                                                   |
| `sudo visudo`                                                       | - правка файла sudo                                                                                                                                                |
|                                                                     |                                                                                                                                                                    |
| `scp SourceFile user@host:/directory/TargetFile`                    | - команда копирования локального SourceFile на удалённый хост                                                                                                      |
| `scp user@host:/directory/SourceFile TargetFile`                    | - команда копирования SourceFile с удалённого хоста                                                                                                                |
| `scp -P port user@host:/directory/SourceFile /directory/TargetFile` | - если ssh работает на другом порту, то тогда указывается                                                                                                          |
| `scp -r user@host:/directory/SourceFolder TargetFolder`             | - копирование SourceFolder с удалённого хоста внутрь локального TargetFolder (на локальном хосте получится, что SourceFolder будет находиться внутри TargetFolder) |
|                                                                     |                                                                                                                                                                    |
| `cat /etc/ssh/sshd_config\| grep \# -v`                             | - вывод всех незакомментированных строк                                                                                                                            |
| `sudo netstat -anp\| grep "9000"`                                   | - сортировка по порту                                                                                                                                              |
|                                                                     |                                                                                                                                                                    |
| `swapoff -a`                                                        | - отключение файла подкачки до перезагрузки                                                                                                                        |
| `sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab`                     | - отключение файла подкачки насовсем                                                                                                                               |
|                                                                     |                                                                                                                                                                    |
| `sudo shutdown -r now`                                              | - ребут хоста                                                                                                                                                      |
| `last -x reboot shutdown`                                           | - список событий вкл\выкл хоста                                                                                                                                    |
| `journalctl --list-boots`                                           | - список событий загрузок хоста                                                                                                                                    |
| /etc/ssh/sshd_config   #PermitRootLogin yes                         | - включить root подключение через SSH                                                                                                                              |

---
## Basic resolving Linux commands

| Command                                                      | Description                                                                                  |
|--------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| **---------HDD--------**                                     |                                                                                              |
| `df -h`                                                      | - human read                                                                                 |
| `df -hTi`                                                    | - процент занятых inode                                                                      |
| `du -sh /tmp`                                                | - место, занимаемое папкой на диске                                                          |
| `smartctl -a /dev/sda***`                                    | - smart диска                                                                                |
| `cat /proc/mdstat`                                           | - информация о RAID массивах                                                                 |
| `iostat`                                                     | - сколько данных пишется и читается с диска                                                  |
| `iotop`                                                      | - какие процессы пишут и читают с диска                                                      |
| `yum autoremove`                                             | - удалить неиспользуемые пакеты и старые ядра                                                |
| `lsblk --output NAME,TYPE,SIZE,FSTYPE,MOUNTPOINT,UUID,LABEL` | - выводит информацию обо всех доступных или указанных блочных устройствах                    |
| `fdisk -l`                                                   | - утилита командной строки для разбиения диска на разделы                                    |
| **---------CPU--------**                                     |                                                                                              |
| `top`                                                        | - диспетчер процессов                                                                        |
| *us                                                          | - юзер процессы                                                                              |
| *sy                                                          | - система и ядро                                                                             |
| *ny                                                          | - операции с измененным приоритетом                                                          |
| *id                                                          | - простой процессора                                                                         |
| *wa                                                          | - ожидание операций ввода\вывода на диск и сеть                                              |
| *hi                                                          | - аппаратные прерывания                                                                      |
| *si                                                          | - программные прерывания                                                                     |
| *st                                                          | - ресурсы, украденные у VM                                                                   |
| `top -o %CPU`                                                | - сортировка по полю                                                                         |
| `htop`                                                       | - тоже диспетчер процессов                                                                   |
| `iotop -n 1 -b`                                              | - определить какие процессы создают наибольшую нагрузку на систему ввода/вывода              |
| **---------RAM--------**                                     |                                                                                              |
| `vmstat`                                                     | - оперативная память                                                                         |
| `free -m`                                                    | - то же                                                                                      |
| `cat /proc/meminfo`                                          | - избыточная инфа о памяти                                                                   |
| **---------PROC-------**                                     |                                                                                              |
| `ps aux`                                                     | - о процессах                                                                                |
| `systemctl ststus *`                                         | - о процессах, запущенных от systemd                                                         |
| `strace -p<PID>`                                             | - утилита для глубокой отладки процесса (need to install)                                    |
| `sysdig`                                                     | - универсальное средство устранения неполадок в работе системы и процессов (need to install) |
| **---------NET--------**                                     |                                                                                              |
| `curl`                                                       | - отправка запросов к различным эндпоинтам                                                   |
| `curl -v telnet://***:**`                                    | - проверить доступность порта                                                                |
| `iptables`                                                   | - управление входящими и исходящими пакетами данных (firewall, правила, логирование)         |
| `netstat -tulpn`                                             | - процессы, которые слушают порты                                                            |
| `ss -lntup`                                                  | - примерно то же самое                                                                       |
| `ip a`                                                       | - показывает сетевые интерфейсы                                                              |
| `ifconfig`                                                   | - показывает сетевые интерфейсы (install net-tools)                                          |
| `ifconfig -a`                                                | - список установленных сетевых интерфейсов (install net-tools)                               |
| `ip link show`                                               | – то же                                                                                      |
| `netstat -rn`                                                | - информация о маршрутах                                                                     |
| `ip r`                                                       | - примерно то же самое                                                                       |
| `traceroute -n -T -p 22 <IP>`                                | - путь пакетов до IP. The argument -T -p 22 -n performs a TCP-based trace on port 22.        |
| `mtr`                                                        | - трассировка в живом режиме                                                                 |
| `dig`                                                        | - запросы к dns серверам    -t - тип записи                                                  |
| `nslookup`                                                   | - то же                                                                                      |
| `tcpdump -i any port 9100-nn`                                | - показывает, какие пакеты ходят через какие интерфейсы                                      |
| `nc [IP] [port]`                                             | - проверить, открыт ли порт на удаленном хосте                                               |
| `telnet [IP] [port]`                                         | - то же, но интерактивно                                                                     |
| `mtr -n -c 200 <instance/host> --report`                     | - ICMP-based MTR  requests time out                                                          |
| `mtr -n -T -c 200 <instance/host> --report`                  | - TCP-based MTR  requests time out                                                           |
| **---------LOGS--------**                                    |                                                                                              |
| `tail -f -n50 /var/log/syslog`                               | - показать последние 50 строк в файле с обновлением                                          |
| /var/log/auth.log                                            | - логи авторизации                                                                           |
| /var/log/kern.log                                            | - логи ядра системы                                                                          |
| `dmesg -T`                                                   | - то же, но удобнее                                                                          |
| `journalctl -xeu ***`                                        | - логи сервиса                                                                               |
| `truncate <OPTION> <FILE>`                                   | - подрезать файл                                                                             |

---
## Useful links

[Создание swap-файла](https://www.altlinux.org/Swap)  
[Установка k8s на ubuntu](https://www.heyvaldemar.net/ustanovka-kubernetes-na-ubuntu-server-22-04-lts/)  
[Как копировать файлы между модулями Kubernetes и вашей машиной](https://ru.linux-console.net/?p=7675)  
[Включение файла подкачки](https://losst.pro/fajl-podkachki-linux)  
[Поиск больших файлов и директорий в Linux](https://pingvinus.ru/note/find-big-files#:~:text=%D0%9A%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D0%B0%20du%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D1%83%D0%B5%D1%82%D1%81%D1%8F%20%D0%B4%D0%BB%D1%8F%20%D0%B2%D1%8B%D0%B2%D0%BE%D0%B4%D0%B0,%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%20%D0%B2%D1%81%D0%B5%D0%B3%D0%BE%20%D0%BC%D0%B5%D1%81%D1%82%D0%B0%20%D0%BD%D0%B0%20%D0%B4%D0%B8%D1%81%D0%BA%D0%B5)  
```
du -ahx . | sort -rh | head -5  
du -cksh *  
find . -mount -type f -size +512M -print 2>/dev/null | xargs -r -d '\n' ls -lh | sort -k5,5 -h -r  
```
[GitHib ShamrockOo4tune](https://github.com/ShamrockOo4tune/interview)  
[CentOS-WSL](https://github.com/mishamosher/CentOS-WSL)  
[Уменьшение размера логов journald](https://flazy.ru/clean-journald/)  

