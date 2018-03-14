# Инструкция по запуску компиляции 

## Установка JAVA

#### Устанавливаем "java" командой:
```
sudo apt-add-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk
```
#### Добавляем пакеты для "java" командой:
```
sudo apt-get update && sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-8-jre openjdk-8-jdk pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-multilib maven tmux screen w3m ncftp
```
## Установка Репозитория

#### Создаем папку "bin" командой:
```
mkdir ~/bin
```
#### Патчим папку "bin" командой:
```
PATH=~/bin:$PATH
```
#### Добавляем "repo" командой:
```
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
```
#### Делаем разрешение для "repo" командой:
```
chmod a+x ~/bin/repo
```
## Загрузка исходников и настройка

#### Создаем папку "BLADE" и в ней запускаем командную строку:
```
mkdir ~/BLADE
cd ~/BLADE
```
#### Логинимся в "git" (если учетки нету, вам сюда "https://github.com/" ):
```
git config --global user.email "aaa@bbbbbb.com" (емейл на который была зарегистрирована учетка гитхаба) 
git config --global user.name "NAME" (Логин на гитхабе)
```
#### Скачиваем исходники при помощи команды:
```
repo init -u (дальше вставляeм ссылку на исходники, котрые хотите скачать)
```
#### Например, для скачивание исходников Resurrection Remix 5.8.x команда выглядит следующим образом:
```
repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b nougat
```
#### Cинховать исходники при помощи команды:
```
repo sync -f --force-sync --no-clone-bundle
``` 
## Настройка "Дерева" и "Вендора" устройства

### Дерево

#### Заходим в папку "BLADE" командой:
```
cd ~/BLADE
```
#### Заходим в папку "device" командой:
```
cd device
```
#### Создаем папку "zte" командой:
```
mkdir zte
```
#### Заходим в папку "zte командой":
```
cd zte
```
#### Скачиваем "Дерево" командой:
```
git clone https://github.com/mosya234/android_device_zte_blade_a610.git a610
```
### Вендор

#### Заходим в папку "BLADE" командой:
```
cd ~/BLADE
```
#### Заходим в папку "vendor" командой:
```
cd vendor
```
#### Создаем папку "zte" командой:
```
mkdir zte
```
#### Скачиваем "Вендор" командой:
```
git clone https://github.com/mosya234/android_vendor_zte_blade_a610.git a610
```
## Патчим исходники

#### Патчим командой:
```
cd ~/BLADE/device/zte/a610/patches_mtk && . apply-patches.sh
```
## КЕШ

### Устанавливаем "КЕШ" при сборке (Я делаю в ручную потому что так надежнее)

#### Заходим через диспетчер файлов свою домашнюю папку (HOME), Нажимаем "Ctrl+H", Открываем файл ".bashrc" и в самый низ вставляем:
```
export USE_CCACHE=1
export ANDROID_JACK_VM_ARGS="-Xmx4096m -Xms512m -Dfile.encoding=UTF-8 -XX:+TieredCompilation"
```
#### (Где "Xmx4096m" - это количество оперативной памяти)

## Джек-сервер

#### Пишем команду в корне папки "BLADE":
```
./prebuilts/sdk/tools/jack-admin kill-server
```
##### (Эта команда удаляет процесс рабочего сервера "ДЖЭK", если он вдруг сейчас работает) Нормальный ответ (означает что процесса не было):
```
/android/system$ ./prebuilts/sdk/tools/jack-admin kill-server
Writing local settings in /home/hard/.jack
Killing background server
ERROR: No Jack server to kill
```
#### Запускаем сервер командой из папки "BLADE":
```
./prebuilts/sdk/tools/jack-admin start-server
```
## Сборка

#### Заходим в папку "BLADE" командой:
```
cd ~/BLADE
```
#### Вводим команду:
```
. build/envsetup.sh && brunch a610
```

## НАЧИНАЕТСЯ СБОРКА!!!

#### ошибки лечим по мере их возникновения

## УСПЕХОВ В СБОРКЕ!!!

