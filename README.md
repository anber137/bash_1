# 04-script-03-yaml
# Домашнее задание к занятию "4.3. Языки разметки JSON и YAML"

## 1. Мы выгрузили JSON, который получили через API запрос к нашему сервису:
Нужно найти и исправить все ошибки, которые допускает наш сервис

### Решение


	```json
    { "info" : "Sample JSON output from our service\t",
        "elements" :[
            { "name" : "first",
            "type" : "server",
            "ip" : "7175" 
            },
            { "name" : "second",
            "type" : "proxy",
            "ip" : "71.78.22.43"
            }
        ]
    }
	```
  
  ip" : 7175 - можно остаить как число, но ip адрес как v4 так и v6 это скорее строка, поэтому для единообразия лучше пометить на строку.
  
  
## 2. В прошлый рабочий день мы создавали скрипт, позволяющий опрашивать веб-сервисы и получать их IP. К уже реализованному функционалу нам нужно добавить возможность записи JSON и YAML файлов, описывающих наши сервисы. Формат записи JSON по одному сервису: { "имя сервиса" : "его IP"}. Формат записи YAML по одному сервису: - имя сервиса: его IP. Если в момент исполнения скрипта меняется IP у сервиса - он должен так же поменяться в yml и json файле.

### Решение

```python
#!/usr/bin/env python3.7

import socket, json, deepdiff, yaml

def save_data(dict_url_now):
       json.dump(dict_url_now, open('url_ip.json', 'w'))
       yaml.dump(dict_url_now, open('url_ip.yml', 'w'))

def check_url(url):
        try:
                ip = socket.gethostbyname(url)
        except:
                ip = ''
        return ip

urls = ('drive.google.com', 'mail.google.com', 'google.com')
dict_url_now = {}
for url in urls:
        dict_url_now[url] = check_url(url)
        print("<" + url + "> - <" + dict_url_now[url] + ">")

try:
        dict_url_old = json.load(open('url_ip.json'))
except:
        dict_url_old = dict_url_now
        save_data(dict_url_now)

if (dict_url_now != dict_url_old):
        ch = deepdiff.DeepDiff(dict_url_now, dict_url_old)['values_changed']
        for c in ch:
                print('[ERROR]', '<' + c[6:][:-2] + '>', 'IP missmatch:', '<' + ch[c]["old_value"] + '>','<' + ch[c]["new_value"] + '>')
        save_data(dict_url_now)

```

Пример вывода:
<drive.google.com> - <142.251.1.194>
<mail.google.com> - <142.251.1.19>
<google.com> - <74.125.131.113>
[ERROR] <mail.google.com> IP missmatch: <142.251.1.83> <142.251.1.19>
[ERROR] <google.com> IP missmatch: <74.125.131.100> <74.125.131.113>

Содержимое url_ip.json:
{"drive.google.com": "142.251.1.194", "mail.google.com": "142.251.1.19", "google.com": "74.125.131.113"}

Содержимое url_ip.yml:
drive.google.com: 142.251.1.194
google.com: 74.125.131.113
mail.google.com: 142.251.1.19

