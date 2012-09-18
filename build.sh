#!/bin/bash
make distclean
# [[ `diff arch/arm/configs/tuna_defconfig .config ` ]] && \
#	{ echo "Unmatched defconfig!"; exit -1; } 
export CROSS_COMPILE=/opt/toolchains/arm-eabi-4.4.3/bin/arm-eabi-
export ARCH=arm

# sed -i s/CONFIG_LOCALVERSION=\".*\"/CONFIG_LOCALVERSION=\"-leanKernel-${1}\"/ .config
make msm8960_mmi_defconfig
make headers_install
make modules
make -j8 zImage 2>&1 | tee ~/logs/msm8960_mmi.txt
# cp arch/arm/boot/zImage mkboot/
#sed -i s/CONFIG_LOCALVERSION=\".*\"/CONFIG_LOCALVERSION=\"\"/ .config
# cp .config arch/arm/configs/tuna_defconfig


