/usr/bin/vboxmanage modifyvm "macOSHighSierra" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff

/usr/bin/vboxmanage setextradata "macOSHighSierra" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"

/usr/bin/vboxmanage setextradata "macOSHighSierra" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"

/usr/bin/vboxmanage setextradata "macOSHighSierra" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"

/usr/bin/vboxmanage setextradata "macOSHighSierra" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"

/usr/bin/vboxmanage setextradata "macOSHighSierra" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
