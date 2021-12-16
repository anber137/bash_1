# Домашнее задание к занятию "4.2. Использование Python для решения типовых DevOps задач"

## Обязательные задания

1. Есть скрипт:
	```python
    #!/usr/bin/env python3
	a = 1
	b = '2'
	c = a + b
	```
	* Какое значение будет присвоено переменной c?
	* Как получить для переменной c значение 12?
	* Как получить для переменной c значение 3?

Ответ:
	- При присвоении значения переменной c произойдет ошибка: TypeError: unsupported operand type(s) for +: 'int' and 'str'
	- Можно так: c = int(str(a) + b)
	- c = a + int(b)

1. Мы устроились на работу в компанию, где раньше уже был DevOps Engineer. Он написал скрипт, позволяющий узнать, какие файлы модифицированы в репозитории, относительно локальных изменений. Этим скриптом недовольно начальство, потому что в его выводе есть не все изменённые файлы, а также непонятен полный путь к директории, где они находятся. Как можно доработать скрипт ниже, чтобы он исполнял требования вашего руководителя?

Решение:

Изменим скрипт совсем немного:

	```python
	#!/usr/bin/env python3.7
	import os
	
	bash_command = ["cd /home/devops/devops-netology/devops-netology", "git status"]
	result_os = os.popen(' && '.join(bash_command)).read()
	is_change = False
	# Добавим множество для вывода только уникальных значений
	prepare_result = set()
	for result in result_os.split('\n'):
    	if result.find('modified') != -1:
        	prepare_result.add(result.replace('\tmodified:   ', ''))
        	#break
	print('\n'.join(prepare_result))
	```

Немного изменим скрипт, что бы можно было выводить все файлы, а не только modified:

	```python
    	#!/usr/bin/env python3

	import git
	
	# from args
	select_change_type = ''
	path = '/home/devops/devops-netology/devops-netology/'
	# from args
	
	# select_change_type - (type string) from args cmd. May include one of the values 'A' 'C' 'D' 'R' 'M' 'T'
	# or '' - these are all values
	if (select_change_type == ''):
    		select_change_type = git.diff.DiffIndex.change_type
	
	# dict (change short name to a long one)
	iter_change_full_name = {'A': 'added','C': 'HBZ','D': 'deleted','R': 'renamed', 'M': 'modified','T': 'changed in the type'}
	
	repo = git.Repo(path)
	
	# add files "Changes to be committed"
	diff = repo.index.diff(repo.head.commit.tree)
	# add files "Changes not staged for commit"
	diff.extend(repo.index.diff(None))
	for item in diff:
    		if (item.change_type in select_change_type):
       			print(item.change_type + ": " + iter_change_full_name[item.change_type] + ":", item.a_path)
	```

1. Доработать скрипт выше так, чтобы он мог проверять не только локальный репозиторий в текущей директории, а также умел воспринимать путь к репозиторию, который мы передаём как входной параметр. Мы точно знаем, что начальство коварное и будет проверять работу этого скрипта в директориях, которые не являются локальными репозиториями.


Ответ:

Скрипт воспринимает в качестве первого входного параметра путь к респозиторию, вторым параметром можно передать типы выводимых файлов M или DM и т.д. Если первый параметр не задан, то используется полный путь к скрипту. Если второй параметр не задан, то выводятся все типы фйлов.


```python
#!/usr/bin/env python3.7

import git,sys,os

args = sys.argv
count_param = len(args)

# select_change_type - (type string) from args cmd. May include one of the values 'A' 'C' 'D' 'R' 'M' 'T'
# or '' - these are all values
#if (select_change_type == ''):
#    select_change_type = git.diff.DiffIndex.change_type
select_change_type = git.diff.DiffIndex.change_type

if (count_param == 2):
    path = args[1]
elif (count_param > 2):
    path = args[1]
    select_change_type = args[2]
else:
    path = os.getcwd()


# dict (change short name to a long one)
iter_change_full_name = {'A': 'added','C': 'HBZ','D': 'new file','R': 'renamed', 'M': 'modified','T': 'changed in the type'}

repo = git.Repo(path)

# add files "Changes to be committed"
diff = repo.index.diff(repo.head.commit.tree)
# add files "Changes not staged for commit"
diff.extend(repo.index.diff(None))
for item in diff:
    if (item.change_type in select_change_type):
        print(item.change_type + ": " + iter_change_full_name[item.change_type] + ":", item.a_path)

```

1. Наша команда разрабатывает несколько веб-сервисов, доступных по http. Мы точно знаем, что на их стенде нет никакой балансировки, кластеризации, за DNS прячется конкретный IP сервера, где установлен сервис. Проблема в том, что отдел, занимающийся нашей инфраструктурой очень часто меняет нам сервера, поэтому IP меняются примерно раз в неделю, при этом сервисы сохраняют за собой DNS имена. Это бы совсем никого не беспокоило, если бы несколько раз сервера не уезжали в такой сегмент сети нашей компании, который недоступен для разработчиков. Мы хотим написать скрипт, который опрашивает веб-сервисы, получает их IP, выводит информацию в стандартный вывод в виде: <URL сервиса> - <его IP>. Также, должна быть реализована возможность проверки текущего IP сервиса c его IP из предыдущей проверки. Если проверка будет провалена - оповестить об этом в стандартный вывод сообщением: [ERROR] <URL сервиса> IP mismatch: <старый IP> <Новый IP>. Будем считать, что наша разработка реализовала сервисы: drive.google.com, mail.google.com, google.com.

Ответ:

```python
#!/usr/bin/env python3.7

import socket, json, deepdiff

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
        dict_url_old = json.load(open('url_ip.txt'))
except:
        dict_url_old = dict_url_now


json.dump(dict_url_now, open('url_ip.txt','w'))

if (dict_url_now != dict_url_old):
        ch = deepdiff.DeepDiff(dict_url_now, dict_url_old)['values_changed']
        for c in ch:
                print('[ERROR]', '<' + c[6:][:-2] + '>', 'IP missmatch:', '<' + ch[c]["old_value"] + '>','<' + ch[c]["new_value"] + '>')

```
