# Docker
---
## Useful links

[Шпаргалка по docker](https://habr.com/ru/companies/flant/articles/336654/)  
[Configure remote access for Docker daemon](https://docs.docker.com/config/daemon/remote-access/)  
[Как работают и создаются тома с bind и mount в Docker](https://fixmypc.ru/post/sozdaem-volume-v-docker-ispolzuia-bind-i-mount/)  
[Таймер для очистки докера](https://gist.github.com/sirkonst/413475ee055a588c58661363c461122e)  

## Basic commands

| Command                                                                                                                                       | Description                                                                                                                                                 |
|-----------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `docker --help`                                                                                                                               | - список доступных команд                                                                                                                                   |
| `docker <command> --help`                                                                                                                     | - информация по команде                                                                                                                                     |
| `docker --version`                                                                                                                            | - версия Docker                                                                                                                                             |
| `docker info`                                                                                                                                 | - общая информация о системе                                                                                                                                |
| **Работа с образами**                                                                                                                         |                                                                                                                                                             |
| `docker search debian`                                                                                                                        | - поиск образов по ключевому слову debi                                                                                                                     |
| `docker pull ubuntu`                                                                                                                          | - скачивание последней версии (тег по умолчанию latest) официального образа ubuntu (издатель не указывается) из репозитория по умолчанию docker.io/library  |
| `docker pull prom/prometheus`                                                                                                                 | - скачивание последней версии (latest) образа prometheus от издателя prom из репозитория docker.io/prom                                                     |
| `docker pull docker.io/library/ubuntu:18.04`                                                                                                  | - скачивание из репозитория docker.io официального образа ubuntu с тегом 18.04                                                                              |
|                                                                                                                                               |                                                                                                                                                             |
| `docker images`                                                                                                                               | - просмотр локальных образов                                                                                                                                |
|                                                                                                                                               |                                                                                                                                                             |
| `docker rmi <image_name>:<tag>`                                                                                                               | - удаление образа. Вместо <image_name>:<tag> можно указать <image_id>. Для удаления образа все контейнеры на его основе должны быть как минимум остановлены |
| `docker rmi $(docker images -aq)`                                                                                                             | - удаление всех образов                                                                                                                                     |
| **Работа с контейнерами**                                                                                                                     |                                                                                                                                                             |
| `docker run hello-world`                                                                                                                      | - Hello, world! в мире контейнеров                                                                                                                          |
| `docker run -it ubuntu bash`                                                                                                                  | - запуск контейнера ubuntu и выполнение команды bash в интерактивном режиме                                                                                 |
| `docker run --name docker-getting-started --publish 8080:80 docker/getting-started`                                                           | - запуск контейнера getting-started с отображением (маппингом) порта 8080 хоста на порт 80 внутрь контейнера                                                |
| `docker run --detach --name mongodb docker.io/library/mongo:4.4.10`                                                                           | - запуск контейнера mongodb с именем mongodb в фоновом режиме. Данные будут удалены при удалении контейнера!                                                |
|                                                                                                                                               |                                                                                                                                                             |
| `docker ps`                                                                                                                                   | - просмотр запущенных контейнеров                                                                                                                           |
| `docker ps -a`                                                                                                                                | - просмотр всех контейнеров (в том числе остановленных)                                                                                                     |
| `docker stats --no-stream`                                                                                                                    | - просмотр статистики                                                                                                                                       |
|                                                                                                                                               |                                                                                                                                                             |
| `docker start alpine`                                                                                                                         | - создание контейнера из образа alpine                                                                                                                      |
|                                                                                                                                               |                                                                                                                                                             |
| `docker start <container_name>`                                                                                                               | - запуск созданного контейнера. Вместо <container_name> можно указать <container_id>                                                                        |
| `docker start $(docker ps -a -q)`                                                                                                             | - запуск всех созданных контейнеров                                                                                                                         |
|                                                                                                                                               |                                                                                                                                                             |
| `docker stop <container_name>`                                                                                                                | - остановка контейнера. Вместо <container_name> можно указать <container_id>                                                                                |
| `docker stop $(docker ps -a -q)`                                                                                                              | - остановка всех контейнеров                                                                                                                                |
|                                                                                                                                               |                                                                                                                                                             |
| `docker rm <container_name>`                                                                                                                  | - удаление контейнера. Вместо <container_name> можно указать <container_id>                                                                                 |
| `docker rm $(docker ps -a -q)`                                                                                                                | - удаление всех контейнеров                                                                                                                                 |
| **Система**                                                                                                                                   |                                                                                                                                                             |
| `docker system info`                                                                                                                          | - общая информация о системе (соответствует docker info)                                                                                                    |
| `docker system df`                                                                                                                            | - общее потребление                                                                                                                                         |
| `docker system prune -af`                                                                                                                     | - удаление неиспользуемых данных и очистка диска                                                                                                            |
| **Полезное**                                                                                                                                  |                                                                                                                                                             |
| `docker network create -d bridge my_bridge`                                                                                                   | - создать bridge network                                                                                                                                    |
| `docker rename 345df9ed5b47 new_name`                                                                                                         | - переименовать контейнер                                                                                                                                   |
| `docker logs -f 0d026fa99f0e`                                                                                                                 | - логи контейнера                                                                                                                                           |
| `docker exec -it ab108ca1d8e9 env`                                                                                                            | - выод переменных контейнера                                                                                                                                |
| `docker exec -it ab108ca1d8e9 printenv UVICORN__HOST`                                                                                         | - вывод значения одной переменной                                                                                                                           |
| `docker cp postgres:/var/lib/postgresql/data/postgresql.conf /home/devops/postgresql`                                                         | - скопировать файл из контейнера                                                                                                                            |
| `docker plugin ls`                                                                                                                            | - список плагинов                                                                                                                                           |
| `systemctl restart docker`                                                                                                                    | - рестарт докера                                                                                                                                            |
| `sudo journalctl -xeu docker.service`<br/>`sudo journalctl -eu docker`                                                                        | - журналы докера                                                                                                                                            |
| `sudo systemctl edit --full docker`                                                                                                           | - сервис                                                                                                                                                    |
| `docker ps -q \| xargs -n 1 docker inspect --format '{{ .Name }} {{range .NetworkSettings.Networks}} {{.IPAddress}}{{end}}' \| sed 's#^/##';` | - вывод имен контейнеров с IP                                                                                                                               |
| `sudo vi /etc/docker/daemon.json`                                                                                                             | - конфиг докер-демона                                                                                                                                       |

**Запуск контейнера с параметрами**
`docker run --name promtail -d -v /home/d.safronov/grafana/:/mnt/config -v /var/log:/var/log --link loki-devops -it --net insurance grafana/promtail:2.9.1 -config.file=/mnt/config/promtail-config.yaml`

# Loki
---

**Обновление и перезапуск Loki**
```
docker plugin ls
docker plugin disable loki --force
docker plugin upgrade loki grafana/loki-docker-driver:2.9.1 --grant-all-permissions
docker plugin enable loki
systemctl restart docker
```
**Проверка доступности**
```
curl http://172.18.0.1:3100/ready
curl http://172.18.0.1:3100/loki/api/v1/labels
```

# GitLab runner
---

/etc/gitlab-runner/config.toml				- конфиги раннеров  

`gitlab-runner uninstall`   - stops and uninstalls GitLab Runner from being run as an service  
`gitlab-runner start`       - starts the GitLab Runner service  
`gitlab-runner stop`        - stops the GitLab Runner service  
`gitlab-runner restart`     - stops and then starts the GitLab Runner service  
`gitlab-runner status`      - prints the status of the GitLab Runner service. The exit code is zero when the service is running and non-zero when the service is not running  

# Nginx
---

`nginx -s <сигнал>`  
Где сигнал может быть одним из нижеследующих:  

`stop`    - быстрое завершение  
`quit`    - плавное завершение  
`reload`  - перезагрузка конфигурационного файла  
`reopen`  - переоткрытие лог-файлов  

`docker run -p 127.0.0.1:8080:80 nginx`   - запуск контейнера nginx  

# Kubernetes
---

[Установка k8s на ubuntu](https://www.heyvaldemar.net/ustanovka-kubernetes-na-ubuntu-server-22-04-lts/)  
[Как копировать файлы между модулями Kubernetes и вашей машиной](https://ru.linux-console.net/?p=7675)  

`sudo hostnamectl set-hostname <NAME>`	- присвоение имени хосту  

| Command                                                                                                                                                                                                          | Description                                                                                                                                                                                              |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Get-команды с основном выводом**                                                                                                                                                                               |                                                                                                                                                                                                          |
| `kubectl get services`                                                                                                                                                                                           | - вывести все сервисы в пространстве имён                                                                                                                                                                |
| `kubectl get pods --all-namespaces`                                                                                                                                                                              | - вывести все поды во всех пространств имён                                                                                                                                                              |
| `kubectl get pods -o wide`                                                                                                                                                                                       | - вывести все поды в текущем пространстве имён с подробностями                                                                                                                                           |
| `kubectl get deployment my-dep`                                                                                                                                                                                  | - вывести определённое развёртывание                                                                                                                                                                     |
| `kubectl get pods`                                                                                                                                                                                               | - вывести все поды в пространстве имён                                                                                                                                                                   |
| `kubectl get pod my-pod -o yaml`                                                                                                                                                                                 | - получить информацию по поду в формате YAML                                                                                                                                                             |
| `kubectl describe nodes my-node`<br/>`kubectl describe pods my-pod`                                                                                                                                              | - описание нод и подов                                                                                                                                                                                   |
| `kubectl get services --sort-by=.metadata.name`                                                                                                                                                                  | - вывести сервисы, отсортированные по имени                                                                                                                                                              |
| `kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'`                                                                                                                                         | - вывести поды, отсортированные по количеству перезагрузок                                                                                                                                               |
| `kubectl get pv --sort-by=.spec.capacity.storage`                                                                                                                                                                | - вывести постоянные тома (PersistentVolumes), отсортированные по емкости                                                                                                                                |
| `kubectl get pods --selector=app=cassandra -o jsonpath='{.items[*].metadata.labels.version}'`                                                                                                                    | - получить метку версии всех подов с меткой app=cassandra                                                                                                                                                |
| `kubectl get node --selector='!node-role.kubernetes.io/master'`                                                                                                                                                  | - получить все рабочие узлы                                                                                                                                                                              |
| `kubectl get pods --field-selector=status.phase=Running`                                                                                                                                                         | - получить все запущенные поды в пространстве имён                                                                                                                                                       |
| `kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="ExternalIP")].address}'`                                                                                                                  | - получить внешние IP-адреса (ExternalIP) всех узлов                                                                                                                                                     |
| `sel=${$(kubectl get rc my-rc --output=json \| jq -j '.spec.selector \| to_entries \| .[] \| "\(.key)=\(.value),"')%?}`<br/>`echo $(kubectl get pods --selector=$sel --output=jsonpath={.items..metadata.name})` | - вывести имена подов, принадлежащие к определённому RC                                                                                                                                                  |
| `kubectl get pods --show-labels`                                                                                                                                                                                 | - показать метки всех подов (или любого другого объекта Kubernetes, которым можно прикреплять метки)                                                                                                     |
| `JSONPATH='{range .items[]}{@.metadata.name}:{range @.status.conditions[]}{@.type}={@.status};{end}{end}' \`<br/>`&& kubectl get nodes -o jsonpath="$JSONPATH" \| grep "Ready=True"`                             | - получить готовые узлы                                                                                                                                                                                  |
| `kubectl get secret my-secret -o go-template='{{range $k,$v := .data}}{{"### "}}{{$k}}{{"\n"}}{{$v \| base64decode}}{{"\n\n"}}{{end}}'`                                                                          | - вывод декодированных секретов без внешних инструментов                                                                                                                                                 |
| `kubectl get pods -o json \| jq '.items[].spec.containers[].env[]?.valueFrom.secretKeyRef.name'\| grep -v null \| sort \| uniq`                                                                                  | - вывести все секреты, используемые сейчас в поде                                                                                                                                                        |
| `kubectl get pods --all-namespaces -o jsonpath='{range .items[].status.initContainerStatuses[]}{.containerID}{"\n"}{end}' \| cut -d/ -f3`                                                                        | - вывести все идентификаторы (containerID) контейнеров инициализации (initContainers) во всех подах.<br/>Это полезно при очистке остановленных контейнеров, не удаляя при этом контейнеры инициализации. |
| `kubectl get events --sort-by=.metadata.creationTimestamp`                                                                                                                                                       | - вывести события, отсортированные по временной метке                                                                                                                                                    |
| `kubectl diff -f ./my-manifest.yaml`                                                                                                                                                                             | - сравнить текущее состояние кластера с состоянием, в котором находился бы кластер в случае применения манифеста                                                                                         |
| `kubectl get all -n argocd`                                                                                                                                                                                      | - вывести все ресурсы в неймспейсе                                                                                                                                                                       |
| `kubectl get all -A`                                                                                                                                                                                             | - вывести все ресурсы во всех неймспейсах                                                                                                                                                                |
| **Информация о кластере**                                                                                                                                                                                        |                                                                                                                                                                                                          |
| `kubectl version`                                                                                                                                                                                                | - вывод информации о версии клиента и сервера                                                                                                                                                            |
| `kubectl api-resources`                                                                                                                                                                                          | - вывод поддерживаемых ресурсов API на сервере                                                                                                                                                           |
| `kubectl api-versions`                                                                                                                                                                                           | - вывод поддерживаемых версий API на сервере, в виде «group/version»                                                                                                                                     |
| `kubectl cluster-info`                                                                                                                                                                                           | - получение информации о кластере                                                                                                                                                                        |
| `kubectl get nodes`                                                                                                                                                                                              | - получение списка узлов в кластере                                                                                                                                                                      |
| `kubectl get nodes master -o wide`                                                                                                                                                                               | - получение информации о главном узле                                                                                                                                                                    |
| `kubectl describe nodes master`                                                                                                                                                                                  | - получение подробной информации о главных узлах                                                                                                                                                         |
| **Информация о конфигурации**                                                                                                                                                                                    |                                                                                                                                                                                                          |
| `kubectl config view`                                                                                                                                                                                            | - отображать всех настроек kubeconfig                                                                                                                                                                    |
| `kubectl config current-context`                                                                                                                                                                                 | - просмотр текущего контекста                                                                                                                                                                            |
| `kubectl config get-clusters`                                                                                                                                                                                    | - показать кластеры, определенные в kubeconfig                                                                                                                                                           |
| `kubectl config get-contexts`                                                                                                                                                                                    | - описать один или много контекстов                                                                                                                                                                      |
| `kubectl config use-contexts`                                                                                                                                                                                    | - выбрать контекст                                                                                                                                                                                       |
| **Пространства имен**                                                                                                                                                                                            |                                                                                                                                                                                                          |
| `kubectl get namespaces`                                                                                                                                                                                         | - получить все пространства имен                                                                                                                                                                         |
| `kubectl get namespaces -o yaml`                                                                                                                                                                                 | - получить информацию о пространстве имен в формате yaml                                                                                                                                                 |
| `kubectl describe namespace default`                                                                                                                                                                             | - описать пространство имен по умолчанию                                                                                                                                                                 |
| `kubectl create namespace my-namespace`                                                                                                                                                                          | - создать новое пространство имен                                                                                                                                                                        |
| `kubectl delete namespace my-namespace`                                                                                                                                                                          | - удалить пространство имен                                                                                                                                                                              |
| **Модули**                                                                                                                                                                                                       |                                                                                                                                                                                                          |
| `kubectl get pods --namespace=my-namespace`                                                                                                                                                                      | - получить pods из указанного пространства имен                                                                                                                                                          |
| `kubectl run my-pod-1 --image=nginx:latest --dry-run`                                                                                                                                                            | - создать модуль                                                                                                                                                                                         |
| `kubectl run my-pod-1 --image=nginx:latest --dry-run=client`                                                                                                                                                     | - посмотреть, как будет обрабатываться pod                                                                                                                                                               |
| `kubectl run my-pod-2 --image=nginx:latest --namespace=my-namespace`                                                                                                                                             | - создать pod в указанном пространстве имен                                                                                                                                                              |
| `kubectl run nginx --image=nginx -l --labels=app=test`                                                                                                                                                           | - создать pod с меткой к нему                                                                                                                                                                            |
| `kubectl get pods --show-labels`                                                                                                                                                                                 | - получить все pod с выводом меток                                                                                                                                                                       |
| `kubectl get pods -o wide`                                                                                                                                                                                       | - получить поды с расширенным/широким выводом                                                                                                                                                            |
| `kubectl get pods --sort-by=.metadata.name`                                                                                                                                                                      | - перечислить капсулы в отсортированном порядке                                                                                                                                                          |
| `kubectl logs my-pod-1`                                                                                                                                                                                          | - получение журналов пода                                                                                                                                                                                |
| `kubectl get pods my-pod-2 --namespace=my-namespace -o wide`                                                                                                                                                     | - получение подов в указанном пространстве имен с расширенным/широким выводом                                                                                                                            |
| `kubectl logs my-pod-2 --namespace=my-namespace`                                                                                                                                                                 | - получить журналы pod в указанном пространстве имен                                                                                                                                                     |
| `kubectl describe pod my-pod-1`                                                                                                                                                                                  | - описать pod                                                                                                                                                                                            |
| `kubectl describe pods my-pod-1 --namespace=my-namespace`                                                                                                                                                        | - описать pod в указанном пространстве имен                                                                                                                                                              |
| `kubectl delete pod my-pod-1`                                                                                                                                                                                    | - удалить pod из текущего пространства имен                                                                                                                                                              |
| `kubectl delete pods my-pod-1 --namespace=my-namespace`                                                                                                                                                          | - удалить pod из указанного пространства имен                                                                                                                                                            |
| **Развертывания**                                                                                                                                                                                                |                                                                                                                                                                                                          |
| `kubectl get deployments`                                                                                                                                                                                        | - получение списка развертываний из текущего пространства имен                                                                                                                                           |
| `kubectl get deployments --namespace=my-namespace`                                                                                                                                                               | - получение списка развертываний из указанного пространства имен                                                                                                                                         |
| `kubectl create deployment my-deployment-1 --image=nginx`                                                                                                                                                        | - создать развертывание                                                                                                                                                                                  |
| `kubectl get deployment my-deployment-1`                                                                                                                                                                         | - получить указанное развертывание                                                                                                                                                                       |
| `kubectl get deployment my-deployment-1 --show-labels`                                                                                                                                                           | - получить указанное развертывание с его метками                                                                                                                                                         |
| `kubectl describe deployments my-deployment-1`                                                                                                                                                                   | - описать указанное развертывание                                                                                                                                                                        |
| `kubectl get deployment my-deployment-1 -o yaml`                                                                                                                                                                 | - получить подробную информацию о развертывании в формате yaml                                                                                                                                           |
| `kubectl set image deployment my-deployment-1 nginx=nginx:1.16.1`                                                                                                                                                | - измените образ в существующем развертывании                                                                                                                                                            |
| `kubectl rollout history deployment my-deployment-1`                                                                                                                                                             | - просмотр истории развертывания                                                                                                                                                                         |
| `kubectl rollout undo deployment my-deployment-1`                                                                                                                                                                | - отмена предыдущего развертывания                                                                                                                                                                       |
| `kubectl rollout undo deployment my-deployment-1 --to-revision=2`                                                                                                                                                | - возврат к определенной версии истории развертывания                                                                                                                                                    |
| `kubectl rollout status deployment my-deployment-1`                                                                                                                                                              | - показать статус развертывания                                                                                                                                                                          |
| `kubectl rollout restart deployment my-deployment-1`                                                                                                                                                             | - перезапустить ресурс                                                                                                                                                                                   |
| `kubectl scale --replicas=3 deployment my-deployment-1`                                                                                                                                                          | - масштабировать развертывание до 3                                                                                                                                                                      |
| `kubectl scale --current-replicas=3 --replicas=5 deployment my-deployment-1`                                                                                                                                     | - масштабировать с текущего количества до нужного                                                                                                                                                        |
| `kubectl autoscale deployment my-deployment-1 --min=2 --max=10`                                                                                                                                                  | - создать HPA (Horizontal Pod Aotuscaler)                                                                                                                                                                |
| **Services**                                                                                                                                                                                                     |                                                                                                                                                                                                          |
| `kubectl run my-pod --image=nginx --labels=app=myapp`                                                                                                                                                            | - создать pod с меткой                                                                                                                                                                                   |
| `kubectl expose pod my-pod --port=80 --name nginx-service --type=NodePort --dry-run=client -o yaml`                                                                                                              | - создаем сервис типа NodePort, который будет использовать метки pod для селектора, но нам нужно указать тип, поэтому сначала создайте файл определения, а затем создайте сервис                         |
| `kubectl create service nodeport nginx --tcp=80:80 --node-port=30080 --dry-run=client -o yaml`                                                                                                                   | - создать сервис, который будет иметь тип NodePort, но у него не будет селектора как у my-app                                                                                                            |
| `kubectl get service`                                                                                                                                                                                            | - получить службы из текущего контекста                                                                                                                                                                  |
| `kubectl get service -o wide`                                                                                                                                                                                    | - получить подробную информацию о службах                                                                                                                                                                |
| `kubectl get service --show-labels`                                                                                                                                                                              | - получить службы с метками на них                                                                                                                                                                       |
| `kubectl get services --all-namespaces`                                                                                                                                                                          | - получить сервисы из всех пространств имен                                                                                                                                                              |
| `kubectl describe service nginx-service`                                                                                                                                                                         | - описать сервис, чтобы узнать о нем больше                                                                                                                                                              |
| `kubectl get service nginx-service`                                                                                                                                                                              | - получить конкретный сервис                                                                                                                                                                             |
| `kubectl delete service nginx-service`                                                                                                                                                                           | - удалить сервис                                                                                                                                                                                         |
| `kubectl run mypod --image=nginx --dry-run=client -o yaml > my-pod.yml`                                                                                                                                          | - создать файл определения для pod                                                                                                                                                                       |
| `kubectl run -it --rm --image=curlimages/curl -n argocd curly -- /bin/sh`                                                                                                                                        | - запуск тестового пода с курлом                                                                                                                                                                         |
| `kubectl create -f my-pod.yml`                                                                                                                                                                                   | - создать объект                                                                                                                                                                                         |
| `kubectl delete -f my-pod.yml`                                                                                                                                                                                   | - удалить объект                                                                                                                                                                                         |

`alias k=‘kubectl’`
`alias kgp=‘kubectl get pods’`
`alias kgs=‘kubectl get service’`
`alias kd=‘kubectl delete’`
`alias kcf=‘kubectl create -f’`
`alias kaf=‘kubectl apply -f’`
`alias kgpa=‘kubectl get pods --all-namespaces’`

`vi ~/.vimrc`
`set number`
`set tabstop=2`
`set expandtab`
`set shiftwidth=2`
`set cursorline`

`kubectl run nginx --image=nginx --labels="tier=db"`
`kubectl run nginx --image=nginx --dry-run=client -o yaml --port=80 --expose=true`
`kubectl create deployment --image=nginx nginx`
`kubectl create deployment --image=nginx nginx --dry-run=client -o yaml`
`kubectl create deployment nginx --image=nginx --replicas=4`
`kubectl scale deployment nginx --replicas=4`
`kubectl create deployment nginx --image=nginx --dry-run=client -o yaml > nginx-deployment.yaml`
`kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yaml`
`kubectl create service clusterip redis --tcp=6379:6379 --dry-run=client -o yaml`
`kubectl expose pod nginx --type=NodePort --port=80 --name=nginx-service --dry-run=client -o yaml`
`kubectl create service nodeport nginx --tcp=80:80 --node-port=30080 --dry-run=client -o yaml`
`k replace --force -f nginx.yaml`
`kubectl get pod webapp -o yaml > my-new-pod.yaml`
`k get pods --selector bu=finance,env=prod,tier=frontend`
`k get pods --selector env=dev --no-headers | wc -l`
`k get all --selector env=prod`
`k taint node node01 spray=mortein:NoSchedule`
`k taint node node01 spray=mortein:NoSchedule-`
`k label node node01 color=blue`
`kubectl get serviceaccount -n kube-system`
`kubectl get clusterrolebinding`
`ps -ef | grep kube-apiserver | grep admission-plugins`
`k get all`
`k set image deploy frontend simple-webapp=kodekloud/webapp-color:v2`
`kubectl autoscale deployment nginx-deployment --max=3 --cpu-percent=80`
`kubectl drain node01 --ignore-daemonsets`
`kubeadm upgrade plan`
`alias k=kubectl`
`ETCDCTL_API=3 etcdctl snapshot save --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key --endpoints=https://127.0.0.1:2379 /opt/snapshot-pre-boot.db`
`ETCDCTL_API=3 etcdctl member list --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key --endpoints=https://127.0.0.1:2379 /opt/snapshot-pre-boot.db`

`ETCDCTL_API=3 etcdctl  --data-dir /var/lib/etcd-from-backup \
snapshot restore /opt/snapshot-pre-boot.db`
`etcdctl snapshot status snapshot --write-out=table`
`watch "crictl ps | grep etcd"`
`kubectl config get-clusters`
`ssh cluster2-controlplane ps -ef | grep --color=auto etcd`
`vim /etc/systemd/system/etcd.service
chown -R etcd:etcd /var/lib/etcd-data-new
ls -ld /var/lib/etcd-data-new/
systemctl daemon-reload
systemctl restart etcd`
`openssl x509 -in file-path.crt -text -noout`
`crictl ps -a
crictl logs container-id`
`kubectl config view`
`k get role`
`kubectl describe rolebinding kube-proxy -n kube-system`
`kubectl create role developer --namespace=default --verb=list,create,delete --resource=pods`
`kubectl auth can-i list storageclasses --as michelle`
`kubectl set serviceaccount deploy/web-dashboard dashboard-sa`
`k create secret docker-registry  <name> --docker-username= --docker-password= --docker-server= --docker-email=`
`kubectl exec ubuntu-sleeper -- whoami`
`ip -n red addr add 192.168.1.10/24 dev veth-red`
`ip a` `ip a | grep 192.168.227.191 -B2`
`ip address show type bridge`
`ip link` `ip link show cni0`
`ip route show default`
`netstat -nplt`
`netstat -anp | grep etcd`
`ps -aux | grep kubelet | grep --color container-runtime-endpoint`
`ls /opt/cni/bin`
`ls /etc/cni/net.d/`
`cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep cluster-ip-range`
`journalctl -u kubelet`

`kubectl -n admin2406 get deployment -o custom-columns=DEPLOYMENT:.metadata.name,CONTAINER_IMAGE:.spec.template.spec.containers[].image,READY_REPLICAS:.status.readyReplicas,NAMESPACE:.metadata.namespace --sort-by=.metadata.name > /opt/admin2406_data`
`kubectl set image deployment nginx-deploy nginx=nginx:1.17`
`kubectl annotate deployment nginx-deploy kubernetes.io/change-cause="Updated nginx image to 1.17"`

`helm ls -A`
`helm repo ls`
`helm repo update -n kk-ns kk-mock1`
`helm search repo kk-mock1/nginx -n kk-ns -l | head -n30`
`helm upgrade kk-mock1 kk-mock1/nginx -n kk-ns --version=18.1.15`

`kubectl get deploy -n atlanta-page-04 atlanta-page-apd -o json | jq -r '.spec.template.spec.containers[].image'`
`kubectl get node -o jsonpath='{.items[0].spec.podCIDR}'`
or
`kubectl get node -o json | jq -r '.items[0].spec.podCIDR'`
`k describe resourcequotas cpu-mem-quota`
`k run busybox --image=jrecord/nettools --rm -it --restart Never -- curl 172.17.181.135`
`netstat -tulpn | grep apiserver`

`vim ~/.vimrc
set expandtab
set tabstop=2
set shiftwidth=2`

Log locations to check:
`/var/log/pods
/var/log/containers
crictl ps + crictl logs
docker ps + docker logs (in case when Docker is used)
kubelet logs: /var/log/syslog or journalctl`

`k get events -A --sort-by='{.metadata.creationTimestamp}'`
`k auth can-i list deployments --as system:serviceaccount:ns1:pipeline -n ns1`
`k auth can-i get deploy --as system:serviceaccount:default:group1-sa`
`kubectl top pods -A --sort-by=cpu --no-headers | head -1`
`controlplane:~$ kubectl top pod --all-namespaces --no-headers | sort -k3 -rh | head -n 1 | awk '{print $2 "," $1}' > high_cpu_pod.txt
controlplane:~$ cat high_cpu_pod.txt 
kube-apiserver-controlplane,kube-system`

`# list unit files with systemctl and grep for 'kube'
sudo systemctl list-unit-files --type service --all | grep kube > services.csv`
`cat /etc/kubernetes/kubelet.conf > kubelet-config.txt`
`# view the certificate using openssl. Get the certificate file location from the 'kubelet.conf' file above.
openssl x509 -in /var/lib/kubelet/pki/kubelet-client-current.pem -text -noout`
`# get a shell to the pod and output the token (if mounted)
kubectl exec secure-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/token`
`kubeadm upgrade node phase kubelet-config`
`k run netshoot --image nicolaka/netshoot --rm -it -- sh
wget -O- apache-svc`
`k -n project-c13 describe pod | less -p Requests
k -n project-c13 describe pod | grep -A 3 -E 'Requests|^Name:'
k -n project-c13 get pod -o jsonpath="{range .items[*]} {.metadata.name}{.spec.containers[*].resources}{'\n'}"
k get pods -n project-c13 -o jsonpath="{range .items[*]}{.metadata.name} {.status.qosClass}{'\n'}"`
`➜ / # TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
➜ / # curl -k https://kubernetes.default/api/v1/secrets -H "Authorization: Bearer ${TOKEN}"`
`- matches:
        - path:
            type: PathPrefix
            value: /auto
          headers:
          - type: Exact
            name: user-agent
            value: mobile
      backendRefs:
        - name: web-mobile
          port: 80`


# Minikube
---

| Command                                | Description                                |
|----------------------------------------|--------------------------------------------|
| `minikube start`                       | - старт миникуба (должен быть заинсталлен) |
| `minikube node add`                    | - добавить ноду                            |
| `minikube start --nodes 3 -p demo-dev` | - старт кластера с 3 нодами и именем       |
| `minikube node delete demo-prod-m02`   | - удалить ноду в кластере                  |
| `minikube stop -p demo-dev`            | - остановить кластер                       |
| `minikube delete -p demo-dev`          | - удалить кластер                          |



# AWS CLI Command Reference
---

https://docs.aws.amazon.com/cli/latest/
___
| Command                                                                                                         | Description                                                                  |
|-----------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| **[s3 buckets](https://docs.aws.amazon.com/cli/latest/reference/s3/)**                                          |                                                                              |
| `aws s3 ls`                                                                                                     | - показать все бакеты                                                        |
| `aws s3api list-buckets`                                                                                        | - показать все бакеты с доп инфой                                            |
| `aws s3 mb s3://mynewbucket`                                                                                    | - создать бакет                                                              |
| `aws s3 mb s3://mynewbucketinwestusa  --region=us-west-1`                                                       | - создать бакет в регионе s-west-1                                           |
| `aws s3 rb s3://mynewbucket`                                                                                    | - удалить бакет                                                              |
| `aws s3 cp  c:\hlam  s3://destinationbucketname`                                                                | - скопировать объект в бакет                                                 |
| `aws s3 sync s3://mynewbucket  c:\MyFolder`                                                                     | - синхронизировать каталог с бакетом (только добавленные и измененные файлы) |
| `aws s3 rm --recursive s3://mynewbucket`                                                                        | - удалить все из бакета                                                      |
| **[s3 Lambda](https://docs.aws.amazon.com/cli/latest/reference/lambda/)**                                       |                                                                              |
| `aws lambda invoke --function-name=LambdaListS3Buckets --region=us-east-1 output.txt`                           | - запустить лямбда-функцию с выводом в файл                                  |
| **AIM**                                                                                                         |                                                                              |
| `aws iam create-instance-profile`                                                                               | - создать инстанс профайл                                                    |
| `aws iam add-role-to-instance-profile`                                                                          | - добавить роль в инстанс профайл                                            |
| `aws iam get-user`                                                                                              | - показывает текущего юзера                                                  |
| `aws sts assume-role --role-arn "arn:aws:iam::127214159695:user/CLI-User" --role-session "Something"`           | - применить роль, выданную другим акакаунтом                                 |
| **EC2**                                                                                                         |                                                                              |
| `aws ec2 describe-instances`                                                                                    | - развернуто текущие инстансы                                                |
| **Simple Security Manager SSM**                                                                                 |                                                                              |
| `aws ssm get-parameters --name DBEndpoint --region eu-central-1`                                                | - получить полный вывод параметра                                            |
| `aws ssm get-parameters --name DBEndpoint \<br/>--region eu-central-1 --output text --query Parameters[].Value` | -получить вывод значения, --with-decryption - с раскодированием              |

# Terraform
[Basic CLI Features](https://developer.hashicorp.com/terraform/cli/commands)
[Terraform AWS modules](https://registry.terraform.io/search/modules?namespace=terraform-aws-modules&provider=aws)
---
Environment Variables:
`AWS_ACCESS_KEY=`
`AWS_SECRET_KEY=`
`AWS_DEFAULT_REGION=`
___
## **Variable Definition Precedence**

* Environment variables
* The `terraform.tfvars` file, if present.
* The `terraform.tfvars.json` file, if present.
* Any `*.auto.tfvars` or `*.auto.tfvars.json` files, processed in lexical order of their filenames.
* Any `-var` and `-var-file` options on the command line, in the order they are provided. (This includes variables set by an HCP Terraform workspace.)
___

| Command                                            | Description                                                  |
|----------------------------------------------------|--------------------------------------------------------------|
| `terraform init`                                   | - инициализировать конфигурацию                              |
| `terraform plan`                                   | - протестировать                                             |
| `terraform apply --auto-approve`                   | - применить без подтверждения                                |
| `terraform destroy [options]`                      | - удаляет объекты конфигурации                               |
| `terraform apply -destroy`                         | - то же, но с опциями apply                                  |
| `terraform plan -destroy`                          | - моделирует удаление                                        |
| `terrafotm console`                                | - попробовать функцию через консоль                          |
| `terraform show`                                   | - показывает аттрибуты запущенных сущностей                  |
| `terraform state show`                             | - показывает аттрибуты определенной сущности                 |
| `terraform state list`                             | - показать текущие ресурсы                                   |
| `terraform state pull`                             | - выводит на экран весь remote state                         |
| `terraform state rm`                               | - удаляет ресурс из remote state                             |
| `terraform state push`                             | - перезаписывает стейт                                       |
| `terraform state mv`                               | - изменяет(перемещает) ресурс в стейте без пересоздания      |
| `terraform taint`                                  | - пометить ресурс для пересоздания                           |
| `terraform apply -replace="aws_instance.example"`  | - пометить ресурс для пересоздания - с версии v0.15.2        |
| `terraform workspace show`                         | - показать, в каком воркспейсе сейчас работаем               |
| `terraform workspace list`                         | - показать, какие есть воркспейсы                            |
| `terraform workspace new`                          | - создать новый воркспейс                                    |
| `terraform workspace select`                       | - перейти в воркспейс                                        |
| `terraform workspace delete`                       | - удалить воркспейс                                          |
| `terraform plan -generate-config-out=generated.tf` | - импорт ресурсов в state                                    |
| `terraform refresh`                                | - обновить стейт в соответствии с реальностью                |
| `terraform fmt`                                    | - форматировать конфигурацию                                 |
| `terraform validate`                               | - валидировать (проверить) конфигурацию                      |
| `terraform login`                                  | - Log in to HCP Terraform from the CLI                       |
| `terraform plan -target="module.s3_bucket"`        | - Terraform will plan to replace only the targeted resource. |
| `terraform plan -out=FILENAME`                     | - сохранить план в файл                                      |

                                                 

`for i in $(terraform state list); do terraform state mv -state-out="ter
raform.tfstate" $i $i;done` - переместить весь вывод листа в файл

Log levels:

TRACE , DEBUG , INFO , WARN , ERROR and FATAL

Set environment variable (e.g in Unix)
`export TF_LOG=<LOG_LEVEL>`
Run Terraform
`terraform <abc>`

# Helm
---
---
| Command                   | Description                  |
|---------------------------|------------------------------|
| `helm search repo argocd` | - поиск репо с именем argocd |

# Python
---
---
`pip freeze > reqirements.txt`

# DB
---
| Command                                                     | Description                     |
|-------------------------------------------------------------|---------------------------------|
| **MySQL**                                                   |                                 |
| `mysql -u dimmm -p -h <ENDPOINT>`                           | - подключиться к DB             |
| `show databases;`                                           | - показать DB                   |
| `create database <NAME>;`                                   | - создать DB                    |
| `use <DB>`                                                  | - выбрать DB                    |
| `show tables;`                                              | - показать таблицы              |
| `create table employee(name char(20), position char(30));`  | - создать таблицу с колонками   |
| `INSERT INTO employee VALUES ('DIMMM', 'DevOps Engineer');` | - добавить строки со значениями |
| `select * from employee;`                                   | - показать все строки в таблице |

ENV in PowerShell:
`$env:TF_VAR_region = "us-east-1"`

`TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/iam/security-credentials/`
или
`$token = Invoke-RestMethod -Uri http://169.254.169.254/latest/api/token -Method PUT -Headers @{"X-aws-ec2-metadata-token-ttl-seconds"="21600"}
Invoke-RestMethod -Uri http://169.254.169.254/latest/meta-data/iam/security-credentials/ -Method GET -Headers @{"X-aws-ec2-metadata-token"=$token}`


