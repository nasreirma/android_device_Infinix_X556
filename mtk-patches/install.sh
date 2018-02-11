echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="frameworks/av frameworks/base frameworks/native system/netd system/core system/bt packages/apps/Settings packages/apps/Snap"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/device/Infinix/X556/mtk-patches/$dir/*.patch
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
