# Building Manual

## Installing Java and Tools

#### Add Java repository if no one is installed:
```
sudo apt-add-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk
```
#### Then install all other needed tools:
```
sudo apt-get update && sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-8-jre openjdk-8-jdk pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-multilib maven tmux screen w3m ncftp
```
## Downloading Source

#### Installing repo tools:
```
mkdir ~/bin
PATH=~/bin:$PATH
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```
#### Create source directory (it can be everything, we will use AOSP as example):
```
mkdir ~/AOSP
cd ~/AOSP
```
#### Configure GIT ):
```
git config --global user.email "aaa@bbbbbb.com" (Put your email) 
git config --global user.name "NAME" (Put your name)
```
#### Initialize Repo:
```
repo init -u (GitHub link to the preferred source manifest) -b (Branch to build) --depth=1 --groups=all,-notdefault,-device,-mips,-x86,-darwin,-exynos5
```
#### For example, if I want to build Reurrection Remix, I'll use:
```
repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b nougat --depth=1 --groups=all,-notdefault,-device,-mips,-x86,-darwin,-exynos5
```
#### Install local manifest for fix
```
curl --create-dirs -L -o .repo/local_manifests/manifest_X556.xml -O -L https://raw.githubusercontent.com/nasreirma/android_manifest_Infinix_X556/master/manifest_X556.xml
```
#### After Initialization, Sync (it may require some hours to download everything:
```
repo sync -c -f --force-sync --no-clone-bundle
``` 
## Building Source

#### Move to Repo folder (in our case, AOSP):
```
cd ~/AOSP
```

### Build (finally)

#### Building commands:
```
cd device/Infinix/X556/patches_mtk && . apply-patches.sh (if patch fails, do it manually or build won't work)
export USE_CCACHE=1
export ANDROID_JACK_VM_ARGS="-Xmx4096m -Xms512m -Dfile.encoding=UTF-8 -XX:+TieredCompilation"
./prebuilts/sdk/tools/jack-admin kill-server
./prebuilts/sdk/tools/jack-admin start-server
. build/envsetup.sh && brunch X556
```

