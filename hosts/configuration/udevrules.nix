{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, gpuvar, desk, ...}: 
{
  services.udev = {
    enable = true;
    extraRules = ''
#---------------------------------------------------------------#
#  OpenRGB udev rules - Git Commit: b5f46e3f                    #
#---------------------------------------------------------------#

#---------------------------------------------------------------#
#  User I2C/SMBus Access                                        #
#---------------------------------------------------------------#
KERNEL=="i2c-[0-99]*", TAG+="uaccess"

#---------------------------------------------------------------#
#  Super I/O Access                                             #
#---------------------------------------------------------------#
KERNEL=="port", TAG+="uaccess"

#---------------------------------------------------------------#
#  ASUS TUF Laptops (faustus)                                   #
#---------------------------------------------------------------#
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_blue"
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_flags"
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_green"
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_mode"
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_red"
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_set"
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_speed"

#---------------------------------------------------------------#
#  ASUS TUF Laptops (asus-wmi)                                  #
#---------------------------------------------------------------#
ACTION=="add", SUBSYSTEM=="leds", KERNEL=="asus::kbd_backlight", RUN+="/bin/chmod a+w /sys%p/kbd_rgb_mode"
ACTION=="add", SUBSYSTEM=="leds", KERNEL=="asus::kbd_backlight", RUN+="/bin/chmod a+w /sys%p/brightness"

#---------------------------------------------------------------#
# BloodyMouse - DetectA4TechMouseControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="37ea", TAG+="uaccess", TAG+="Bloody_W60_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="fa60", TAG+="uaccess", TAG+="Bloody_MP_50RS"
#---------------------------------------------------------------#
# AMD Wraith Prism - DetectAMDWraithPrismControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0051", TAG+="uaccess", TAG+="AMD_Wraith_Prism"
#---------------------------------------------------------------#
# AOC Keyboard - DetectAOCKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3938", ATTRS{idProduct}=="1178", TAG+="uaccess", TAG+="AOC_GK500"
#---------------------------------------------------------------#
# AOC Mouse - DetectAOCMouseControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3938", ATTRS{idProduct}=="1179", TAG+="uaccess", TAG+="AOC_GM500"
#---------------------------------------------------------------#
# AOC Mousemat - DetectAOCMousematControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3938", ATTRS{idProduct}=="1162", TAG+="uaccess", TAG+="AOC_AGON_AMM700"
#---------------------------------------------------------------#
# ASrock Polychrome USB - DetectPolychromeUSBControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="26ce", ATTRS{idProduct}=="01a2", TAG+="uaccess", TAG+="ASRock_Polychrome_USB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="26ce", ATTRS{idProduct}=="01a6", TAG+="uaccess", TAG+="ASRock_Deskmini_Addressable_LED_Strip"
#---------------------------------------------------------------#
# Alienware - DetectAlienwareControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="187c", ATTRS{idProduct}=="0550", TAG+="uaccess", TAG+="Dell_G_Series_LED_Controller"
#---------------------------------------------------------------#
# Alienware AW510 Keyboard - DetectAlienwareAW510KControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04f2", ATTRS{idProduct}=="1830", TAG+="uaccess", TAG+="Alienware_AW510K"
#---------------------------------------------------------------#
# Anne Pro 2 - DetectAnnePro2Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="8008", TAG+="uaccess", TAG+="Anne_Pro_2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="8009", TAG+="uaccess", TAG+="Anne_Pro_2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="a292", TAG+="uaccess", TAG+="Anne_Pro_2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="a293", TAG+="uaccess", TAG+="Anne_Pro_2"
#---------------------------------------------------------------#
# Asus AURA Core - DetectAsusAuraCoreControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1854", TAG+="uaccess", TAG+="ASUS_Aura_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1866", TAG+="uaccess", TAG+="ASUS_Aura_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1869", TAG+="uaccess", TAG+="ASUS_Aura_Core"
#---------------------------------------------------------------#
# AsusAuraCoreLaptop - DetectAsusAuraCoreLaptopControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="19b6", TAG+="uaccess", TAG+="ASUS_ROG_Strix_SCAR_15"
#---------------------------------------------------------------#
# Asus Aura Headset Stand - DetectAsusAuraUSBHeadsetStand
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18d9", TAG+="uaccess", TAG+="ASUS_ROG_Throne"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18c5", TAG+="uaccess", TAG+="ASUS_ROG_Throne_QI"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1994", TAG+="uaccess", TAG+="ASUS_ROG_Throne_QI_GUNDAM"
#---------------------------------------------------------------#
# Asus Aura Keyboard - DetectAsusAuraUSBKeyboards
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1875", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Flare"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18cf", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Flare_PNK_LTD"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18af", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Flare_CoD_Black_Ops_4_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18f8", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Scope"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1951", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Scope_RX"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="190c", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Scope_TKL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1a05", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Scope_RX_TKL_Wireless_Deluxe"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1954", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Scope_TKL_PNK_LTD"
#---------------------------------------------------------------#
# Asus Aura Monitor - DetectAsusAuraUSBMonitor
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="198c", TAG+="uaccess", TAG+="ASUS_ROG_Strix_XG27AQ"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="19bb", TAG+="uaccess", TAG+="ASUS_ROG_Strix_XG27AQM"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1919", TAG+="uaccess", TAG+="ASUS_ROG_Strix_XG279Q"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1933", TAG+="uaccess", TAG+="ASUS_ROG_Strix_XG27W"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="19b9", TAG+="uaccess", TAG+="ASUS_ROG_PG32UQ"
#---------------------------------------------------------------#
# Asus Aura Mouse - DetectAsusAuraUSBMice
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18dd", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1845", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1877", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II_Origin"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18cd", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II_Origin_PNK_LTD"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18b1", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II_Origin_COD"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="189e", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18a0", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="197b", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_III"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="197d", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_III_Wireless_USB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="197f", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_III_Wireless_24Ghz"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1981", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_III_Wireless_Bluetooth"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18e5", TAG+="uaccess", TAG+="ASUS_ROG_Chakram_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18e3", TAG+="uaccess", TAG+="Asus_ROG_Chakram_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1958", TAG+="uaccess", TAG+="Asus_ROG_Chakram_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1a18", TAG+="uaccess", TAG+="Asus_ROG_Chakram_X_USB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1a1a", TAG+="uaccess", TAG+="Asus_ROG_Chakram_X_24GHz"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1977", TAG+="uaccess", TAG+="Asus_ROG_Spatha_X_USB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1979", TAG+="uaccess", TAG+="Asus_ROG_Spatha_X_24GHz"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1846", TAG+="uaccess", TAG+="ASUS_ROG_Pugio"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1906", TAG+="uaccess", TAG+="ASUS_ROG_Pugio_II_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1908", TAG+="uaccess", TAG+="ASUS_ROG_Pugio_II_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1847", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18e1", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact_II"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="189e", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact_II_Gundam"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1956", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact_II_Electro_Punk"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="19d2", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact_II_Moonlight_White"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1947", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact_II_Wireless_USB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1949", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact_II_Wireless_24_Ghz"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="195c", TAG+="uaccess", TAG+="ASUS_ROG_Keris"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="195e", TAG+="uaccess", TAG+="ASUS_ROG_Keris_Wireless_USB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1960", TAG+="uaccess", TAG+="ASUS_ROG_Keris_Wireless_24Ghz"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1962", TAG+="uaccess", TAG+="ASUS_ROG_Keris_Wireless_Bluetooth"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1910", TAG+="uaccess", TAG+="ASUS_TUF_Gaming_M3"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1898", TAG+="uaccess", TAG+="ASUS_TUF_Gaming_M5"
#---------------------------------------------------------------#
# Asus Aura Mousemat - DetectAsusAuraUSBMousemats
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1891", TAG+="uaccess", TAG+="ASUS_ROG_Balteus"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1890", TAG+="uaccess", TAG+="ASUS_ROG_Balteus_Qi"
#---------------------------------------------------------------#
# Asus Aura Ryuo AIO  - DetectAsusAuraUSBMousemats
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1891", TAG+="uaccess", TAG+="ASUS_ROG_Balteus"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1890", TAG+="uaccess", TAG+="ASUS_ROG_Balteus_Qi"
#---------------------------------------------------------------#
# Asus Aura Strix Evolve - DetectAsusAuraUSBStrixEvolve
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="185b", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Evolve"
#---------------------------------------------------------------#
# Asus Aura TUF Keyboard - DetectAsusAuraTUFUSBKeyboard
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="184d", TAG+="uaccess", TAG+="ASUS_ROG_Claymore"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="193c", TAG+="uaccess", TAG+="ASUS_ROG_Falchion_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="193e", TAG+="uaccess", TAG+="ASUS_ROG_Falchion_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1945", TAG+="uaccess", TAG+="ASUS_TUF_Gaming_K1"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="194b", TAG+="uaccess", TAG+="ASUS_TUF_Gaming_K3"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1899", TAG+="uaccess", TAG+="ASUS_TUF_Gaming_K5"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18aa", TAG+="uaccess", TAG+="ASUS_TUF_Gaming_K7"
#---------------------------------------------------------------#
# Asus Aura USB - DetectAsusAuraUSBTerminal
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1889", TAG+="uaccess", TAG+="ASUS_ROG_AURA_Terminal"
#---------------------------------------------------------------#
# Asus Aura USB - DetectAsusAuraUSBAddressable
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1867", TAG+="uaccess", TAG+="ASUS_Aura_Addressable"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1872", TAG+="uaccess", TAG+="ASUS_Aura_Addressable"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18a3", TAG+="uaccess", TAG+="ASUS_Aura_Addressable"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18a5", TAG+="uaccess", TAG+="ASUS_Aura_Addressable"
#---------------------------------------------------------------#
# Asus Aura USB - DetectAsusAuraUSBMotherboards
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18f3", TAG+="uaccess", TAG+="ASUS_Aura_Motherboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1939", TAG+="uaccess", TAG+="ASUS_Aura_Motherboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="19af", TAG+="uaccess", TAG+="ASUS_Aura_Motherboard"
#---------------------------------------------------------------#
# Asus ROG Ally - DetectAsusROGAlly
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1abe", TAG+="uaccess", TAG+="ASUS_ROG_Ally"
#---------------------------------------------------------------#
# Asus ROG Strix Liquid Cooler - DetectAsusAuraUSBROGStrixLC
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="879e", TAG+="uaccess", TAG+="ASUS_ROG_Strix_LC"
#---------------------------------------------------------------#
# Asus Cerberus Mech Keyboard - DetectAsusCerberusMech
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="195d", ATTRS{idProduct}=="2047", TAG+="uaccess", TAG+="ASUS_Cerberus_Mech"
#---------------------------------------------------------------#
# Asus Strix Claw - DetectAsusStrixClaw
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="195d", ATTRS{idProduct}=="1016", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Claw"
#---------------------------------------------------------------#
# Blinky Tape - DetectBlinkyTapeControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="serial|hidraw", ATTRS{idVendor}=="306f", ATTRS{idProduct}=="1234", TAG+="uaccess", TAG+="JSAUX_RGB_Docking_Station"
#---------------------------------------------------------------#
# Cherry Keyboard - DetectCherryKeyboards
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="0077", TAG+="uaccess", TAG+="Cherry_Keyboard_MX_BOARD_30S_FL_NBL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="0079", TAG+="uaccess", TAG+="Cherry_Keyboard_MX_BOARD_30S_FL_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="0083", TAG+="uaccess", TAG+="Cherry_Keyboard_MX_BOARD_30S_FL_RGB_KOREAN"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00ab", TAG+="uaccess", TAG+="Cherry_Keyboard_MX_10_FL_BL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00ac", TAG+="uaccess", TAG+="Cherry_Keyboard_MX_BOARD_10_TKL_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00b7", TAG+="uaccess", TAG+="Cherry_Keyboard_MX_BOARD_80_TKL_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00bb", TAG+="uaccess", TAG+="Cherry_Keyboard_MX_BOARD_100_FL_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00c3", TAG+="uaccess", TAG+="Cherry_Keyboard_G803000_TKL_NBL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00c4", TAG+="uaccess", TAG+="Cherry_Keyboard_MX_BOARD_20S_FL_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00c5", TAG+="uaccess", TAG+="Cherry_Keyboard_G803000_TKL_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00c7", TAG+="uaccess", TAG+="Cherry_Keyboard_MV_BOARD_30_FL_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00c9", TAG+="uaccess", TAG+="Cherry_Keyboard_CCF_MX_80_TKL_BL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00ca", TAG+="uaccess", TAG+="Cherry_Keyboard_CCF_MX_10_TKL_BL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00cb", TAG+="uaccess", TAG+="Cherry_Keyboard_CCF_MX_10_TKL_NBL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00cd", TAG+="uaccess", TAG+="Cherry_Keyboard_G803000_TKL_NBL_KOREAN"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00ce", TAG+="uaccess", TAG+="Cherry_Keyboard_MX_BOARD_20S_FL_NBL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00d2", TAG+="uaccess", TAG+="Cherry_Keyboard_MX_10_FL_NBL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00d3", TAG+="uaccess", TAG+="Cherry_Keyboard_MX_10_FL_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00dd", TAG+="uaccess", TAG+="Cherry_Keyboard_G803000N_TKL_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00de", TAG+="uaccess", TAG+="Cherry_Keyboard_G803000N_FL_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="00df", TAG+="uaccess", TAG+="Cherry_Keyboard_MX_BOARD_100N_FL_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046a", ATTRS{idProduct}=="01a6", TAG+="uaccess", TAG+="Cherry_Keyboard_MX_BOARD_20S_FL_RGB_DE"
#---------------------------------------------------------------#
# Coolermaster ARGB - DetectCoolerMasterARGB
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="1011", TAG+="uaccess", TAG+="Cooler_Master_ARGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0173", TAG+="uaccess", TAG+="Cooler_Master_ARGB_Gen_2_A1"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="01c9", TAG+="uaccess", TAG+="Cooler_Master_ARGB_Gen_2_A1_V2"
#---------------------------------------------------------------#
# Coolermaster ARGB A1 - DetectCoolerMasterARGBGen2A1
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0173", TAG+="uaccess", TAG+="Cooler_Master_ARGB_Gen_2_A1"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="01c9", TAG+="uaccess", TAG+="Cooler_Master_ARGB_Gen_2_A1_V2"
#---------------------------------------------------------------#
# Coolermaster Masterkeys Keyboards - DetectCoolerMasterKeyboards
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="003b", TAG+="uaccess", TAG+="Cooler_Master_MasterKeys_Pro_L"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0047", TAG+="uaccess", TAG+="Cooler_Master_MasterKeys_Pro_L_White"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="003c", TAG+="uaccess", TAG+="Cooler_Master_MasterKeys_Pro_S"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0067", TAG+="uaccess", TAG+="Cooler_Master_MK750"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0089", TAG+="uaccess", TAG+="Cooler_Master_SK630"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="008d", TAG+="uaccess", TAG+="Cooler_Master_SK650"
#---------------------------------------------------------------#
# Coolermaster Master Mouse - DetectCoolerMasterMouse
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0065", TAG+="uaccess", TAG+="Cooler_Master_MM530"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0101", TAG+="uaccess", TAG+="Cooler_Master_MM711"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0141", TAG+="uaccess", TAG+="Cooler_Master_MM720"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0165", TAG+="uaccess", TAG+="Cooler_Master_MM730"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0109", TAG+="uaccess", TAG+="Cooler_Master_MP750_XL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0107", TAG+="uaccess", TAG+="Cooler_Master_MP750_Large"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0105", TAG+="uaccess", TAG+="Cooler_Master_MP750_Medium"
#---------------------------------------------------------------#
# Coolermaster Master Mouse - DetectCoolerMasterMouse
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0065", TAG+="uaccess", TAG+="Cooler_Master_MM530"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0101", TAG+="uaccess", TAG+="Cooler_Master_MM711"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0141", TAG+="uaccess", TAG+="Cooler_Master_MM720"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0165", TAG+="uaccess", TAG+="Cooler_Master_MM730"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0109", TAG+="uaccess", TAG+="Cooler_Master_MP750_XL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0107", TAG+="uaccess", TAG+="Cooler_Master_MP750_Large"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0105", TAG+="uaccess", TAG+="Cooler_Master_MP750_Medium"
#---------------------------------------------------------------#
# Coolermaster Mouse Pad - DetectCoolerMasterMousemats
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0109", TAG+="uaccess", TAG+="Cooler_Master_MP750_XL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0107", TAG+="uaccess", TAG+="Cooler_Master_MP750_Large"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0105", TAG+="uaccess", TAG+="Cooler_Master_MP750_Medium"
#---------------------------------------------------------------#
# AMD Radeon 6000 - DetectCoolerMasterGPU
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="014d", TAG+="uaccess", TAG+="Cooler_Master_Radeon_6000_GPU"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="015b", TAG+="uaccess", TAG+="Cooler_Master_Radeon_6900_GPU"
#---------------------------------------------------------------#
# Coolermaster RGB - DetectCoolerMasterRGB
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="004f", TAG+="uaccess", TAG+="Cooler_Master_RGB"
#---------------------------------------------------------------#
# Coolermaster Small ARGB - DetectCoolerMasterSmallARGB
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="1000", TAG+="uaccess", TAG+="Cooler_Master_Small_ARGB"
#---------------------------------------------------------------#
# Corsair Commander Core - DetectCorsairCapellixHIDControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c1c", TAG+="uaccess", TAG+="Corsair_Commander_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c32", TAG+="uaccess", TAG+="Corsair_Commander_Core"
#---------------------------------------------------------------#
# Corsair Hydro Series H100i v2 AIO - DetectCorsairHydro2Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c09", TAG+="uaccess", TAG+="Corsair_H100i_v2"
#---------------------------------------------------------------#
# Corsair Hydro - DetectCorsairHydroControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="x0c12", TAG+="uaccess", TAG+="Corsair_Hydro_Series"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="x0c13", TAG+="uaccess", TAG+="Corsair_Hydro_Series"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="x0c15", TAG+="uaccess", TAG+="Corsair_Hydro_Series"
#---------------------------------------------------------------#
# Corsair Hydro Platinum - DetectCorsairHydroPlatinumControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c18", TAG+="uaccess", TAG+="Corsair_Hydro_H100i_Platinum"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c19", TAG+="uaccess", TAG+="Corsair_Hydro_H100i_Platinum_SE"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c17", TAG+="uaccess", TAG+="Corsair_Hydro_H115i_Platinum"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c29", TAG+="uaccess", TAG+="Corsair_Hydro_H60i_Pro_XT"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c20", TAG+="uaccess", TAG+="Corsair_Hydro_H100i_Pro_XT"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c2d", TAG+="uaccess", TAG+="Corsair_Hydro_H100i_Pro_XT_v2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c21", TAG+="uaccess", TAG+="Corsair_Hydro_H115i_Pro_XT"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c22", TAG+="uaccess", TAG+="Corsair_Hydro_H150i_Pro_XT"
#---------------------------------------------------------------#
# Corsair Lighting Node - DetectCorsairLightingNodeControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c1a", TAG+="uaccess", TAG+="Corsair_Lighting_Node_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c0b", TAG+="uaccess", TAG+="Corsair_Lighting_Node_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c10", TAG+="uaccess", TAG+="Corsair_Commander_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c1e", TAG+="uaccess", TAG+="Corsair_LS100_Lighting_Kit"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1d00", TAG+="uaccess", TAG+="Corsair_1000D_Obsidian"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1d04", TAG+="uaccess", TAG+="Corsair_SPEC_OMEGA_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c23", TAG+="uaccess", TAG+="Corsair_LT100"
#---------------------------------------------------------------#
# Corsair K100 Keyboard - DetectCorsairK100Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b7c", TAG+="uaccess", TAG+="Corsair_K100"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b7d", TAG+="uaccess", TAG+="Corsair_K100"
#---------------------------------------------------------------#
# Corsair K55 RGB Pro XT - DetectCorsairK55RGBPROXTControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1ba1", TAG+="uaccess", TAG+="Corsair_K55_RGB_PRO_XT"
#---------------------------------------------------------------#
# Corsair K65 Mini - DetectCorsairK65MiniControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1baf", TAG+="uaccess", TAG+="Corsair_K65_Mini"
#---------------------------------------------------------------#
# Corsair K95 Platinum XT Keyboard - DetectCorsairK95PlatinumXTControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b89", TAG+="uaccess", TAG+="Corsair_K95_RGB_PLATINUM_XT"
#---------------------------------------------------------------#
# Corsair Peripheral - DetectCorsairPeripheralControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b3d", TAG+="uaccess", TAG+="Corsair_K55_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b17", TAG+="uaccess", TAG+="Corsair_K65_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b37", TAG+="uaccess", TAG+="Corsair_K65_LUX_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b39", TAG+="uaccess", TAG+="Corsair_K65_RGB_RAPIDFIRE"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b4f", TAG+="uaccess", TAG+="Corsair_K68_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b13", TAG+="uaccess", TAG+="Corsair_K70_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b36", TAG+="uaccess", TAG+="Corsair_K70_LUX"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b33", TAG+="uaccess", TAG+="Corsair_K70_LUX_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b38", TAG+="uaccess", TAG+="Corsair_K70_RGB_RAPIDFIRE"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b49", TAG+="uaccess", TAG+="Corsair_K70_RGB_MK2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b6b", TAG+="uaccess", TAG+="Corsair_K70_RGB_MK2_SE"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b55", TAG+="uaccess", TAG+="Corsair_K70_RGB_MK2_Low_Profile"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b11", TAG+="uaccess", TAG+="Corsair_K95_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b2d", TAG+="uaccess", TAG+="Corsair_K95_RGB_PLATINUM"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b20", TAG+="uaccess", TAG+="Corsair_Strafe"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b44", TAG+="uaccess", TAG+="Corsair_Strafe_Red"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b48", TAG+="uaccess", TAG+="Corsair_Strafe_MK2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b34", TAG+="uaccess", TAG+="Corsair_Glaive_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b74", TAG+="uaccess", TAG+="Corsair_Glaive_RGB_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b3c", TAG+="uaccess", TAG+="Corsair_Harpoon_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b75", TAG+="uaccess", TAG+="Corsair_Harpoon_RGB_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b5d", TAG+="uaccess", TAG+="Corsair_Ironclaw_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b12", TAG+="uaccess", TAG+="Corsair_M65"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b2e", TAG+="uaccess", TAG+="Corsair_M65_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b5a", TAG+="uaccess", TAG+="Corsair_M65_RGB_Elite"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b5c", TAG+="uaccess", TAG+="Corsair_Nightsword"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b1e", TAG+="uaccess", TAG+="Corsair_Scimitar_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b3e", TAG+="uaccess", TAG+="Corsair_Scimitar_PRO_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b8b", TAG+="uaccess", TAG+="Corsair_Scimitar_Elite_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b2f", TAG+="uaccess", TAG+="Corsair_Sabre_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b3b", TAG+="uaccess", TAG+="Corsair_MM800_RGB_Polaris"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0a34", TAG+="uaccess", TAG+="Corsair_ST100_RGB"
#---------------------------------------------------------------#
# Corsair Peripherals V2 Hardware - DetectCorsairV2HardwareControllers
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Corsair Peripherals V2 Software - DetectCorsairV2SoftwareControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1ba4", TAG+="uaccess", TAG+="Corsair_K55_RGB_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1ba0", TAG+="uaccess", TAG+="Corsair_K60_RGB_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1bad", TAG+="uaccess", TAG+="Corsair_K60_RGB_PRO_Low_Profile"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1ba6", TAG+="uaccess", TAG+="Corsair_Ironclaw_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b4c", TAG+="uaccess", TAG+="Corsair_Ironclaw_Wireless_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b70", TAG+="uaccess", TAG+="Corsair_M55_RGB_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b9b", TAG+="uaccess", TAG+="Corsair_MM700"
#---------------------------------------------------------------#
# Corsair Wireless Peripheral - DetectCorsairWirelessControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b6e", TAG+="uaccess", TAG+="Corsair_K57_RGB_Wired"
#---------------------------------------------------------------#
# Cougar 700K Evo Keyboard - DetectCougar700kEvo
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="060b", ATTRS{idProduct}=="7010", TAG+="uaccess", TAG+="Cougar_700K_EVO_Gaming_Keyboard"
#---------------------------------------------------------------#
# Cougar Revenger ST - DetectCougarRevengerSTControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="12cf", ATTRS{idProduct}=="0412", TAG+="uaccess", TAG+="Cougar_Revenger_ST"
#---------------------------------------------------------------#
# Creative Sound BlasterX G6 - DetectCreativeDevice
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="041e", ATTRS{idProduct}=="3256", TAG+="uaccess", TAG+="Creative_SoundBlasterX_G6"
#---------------------------------------------------------------#
# Cryorig H7 Quad Lumi - DetectCryorigH7QuadLumi
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="1712", TAG+="uaccess", TAG+="CRYORIG_H7_Quad_Lumi"
#---------------------------------------------------------------#
# DMX Devices - DetectDMXControllers
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Dark Project Keyboard - DetectDarkProjectKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="195d", ATTRS{idProduct}=="2061", TAG+="uaccess", TAG+="Dark_Project_KD3B_V2"
#---------------------------------------------------------------#
# Das Keyboard - DetectDasKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="24f0", ATTRS{idProduct}=="2020", TAG+="uaccess", TAG+="Das_Keyboard_Q5_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="24f0", ATTRS{idProduct}=="209a", TAG+="uaccess", TAG+="Das_Keyboard_Q5S_RGB"
#---------------------------------------------------------------#
# Das Keyboard - DetectDas4QKeyboard
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="24f0", ATTRS{idProduct}=="2037", TAG+="uaccess", TAG+="Das_Keyboard_Q4_RGB"
#---------------------------------------------------------------#
# Ducky Keyboard - DetectDuckyKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="0348", TAG+="uaccess", TAG+="Ducky_Shine_7Ducky_One_2_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="0356", TAG+="uaccess", TAG+="Ducky_One_2_RGB_TKL"
#---------------------------------------------------------------#
# Dygma Raise Keyboard - DetectDygmaRaiseControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="serial|hidraw", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="2201", TAG+="uaccess", TAG+="Dygma_Raise"
#---------------------------------------------------------------#
# EK Loop Connect - DetectEKControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5750", TAG+="uaccess", TAG+="EK_Loop_Connect"
#---------------------------------------------------------------#
# EVGA USB Keyboard - DetectEVGAKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3842", ATTRS{idProduct}=="260e", TAG+="uaccess", TAG+="EVGA_Z15_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3842", ATTRS{idProduct}=="2608", TAG+="uaccess", TAG+="EVGA_Z15_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3842", ATTRS{idProduct}=="260a", TAG+="uaccess", TAG+="EVGA_Z20_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3842", ATTRS{idProduct}=="2610", TAG+="uaccess", TAG+="EVGA_Z20_Keyboard"
#---------------------------------------------------------------#
# EVGA USB X20 Mouse - DetectWiredEVGAMouse
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3842", ATTRS{idProduct}=="2420", TAG+="uaccess", TAG+="EVGA_X20_Gaming_Mouse"
#---------------------------------------------------------------#
# EVGA USB X20 Mouse - DetectWirelessEVGAMouse
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3842", ATTRS{idProduct}=="2402", TAG+="uaccess", TAG+="EVGA_X20_USB_Receiver"
#---------------------------------------------------------------#
# EVision Keyboard - DetectEVisionKeyboards
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="5204", TAG+="uaccess", TAG+="EVision_Keyboard_0C455204"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="5104", TAG+="uaccess", TAG+="EVision_Keyboard_0C455104"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="320f", ATTRS{idProduct}=="5000", TAG+="uaccess", TAG+="EVision_Keyboard_320F5000"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="5004", TAG+="uaccess", TAG+="EVision_Keyboard_0C455004"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="652f", TAG+="uaccess", TAG+="EVision_Keyboard_0C45652F"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="8520", TAG+="uaccess", TAG+="EVision_Keyboard_0C458520"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="320f", ATTRS{idProduct}=="502a", TAG+="uaccess", TAG+="EVision_Keyboard_320F502A"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="7698", TAG+="uaccess", TAG+="EVision_Keyboard_0C457698"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="320f", ATTRS{idProduct}=="5064", TAG+="uaccess", TAG+="EVision_Keyboard_320F5064"
#---------------------------------------------------------------#
# Epomaker TH80 Pro - EpomakerControllerDetect
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# FanBus - DetectFanBusControllers
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# GaiZhongGai Keyboard/Controller - DetectGaiZhongGaiKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4700", TAG+="uaccess", TAG+="GaiZhongGai_684_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4701", TAG+="uaccess", TAG+="GaiZhongGai_42_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4720", TAG+="uaccess", TAG+="GaiZhongGai_Dial"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4710", TAG+="uaccess", TAG+="GaiZhongGai_LightBoard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4711", TAG+="uaccess", TAG+="GaiZhongGai_RGB_HUB_Green"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4712", TAG+="uaccess", TAG+="GaiZhongGai_RGB_HUB_Blue"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4770", TAG+="uaccess", TAG+="GaiZhongGai_174Touch_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4771", TAG+="uaccess", TAG+="GaiZhongGai_17_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4772", TAG+="uaccess", TAG+="GaiZhongGai_20_PRO"
#---------------------------------------------------------------#
# Aorus ATC800 - DetectGigabyteAorusCPUCoolerControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1044", ATTRS{idProduct}=="7a42", TAG+="uaccess", TAG+="Aorus_CPU_Coolers"
#---------------------------------------------------------------#
# Gigabyte Aorus mouse - DetectGigabyteAorusMouseControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1044", ATTRS{idProduct}=="7a40", TAG+="uaccess", TAG+="Gigabyte_Aorus_M2"
#---------------------------------------------------------------#
# Gigabyte RGB Fusion 2 USB - DetectGigabyteRGBFusion2USBControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="8297", TAG+="uaccess", TAG+="Gigabyte_RGB_Fusion_2_USB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="5702", TAG+="uaccess", TAG+="Gigabyte_RGB_Fusion_2_USB"
#---------------------------------------------------------------#
# HP Omen 30L - DetectHPOmen30LController
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="103c", ATTRS{idProduct}=="84fd", TAG+="uaccess", TAG+="HP_Omen_30L"
#---------------------------------------------------------------#
# Holtek A070 - DetectHoltekControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="a070", TAG+="uaccess", TAG+="Holtek_USB_Gaming_Mouse"
#---------------------------------------------------------------#
# Holtek A1FA - DetectHoltekMousemats
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="a1fa", TAG+="uaccess", TAG+="Holtek_Mousemat"
#---------------------------------------------------------------#
# HyperX Alloy Elite - DetectHyperXAlloyElite
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16be", TAG+="uaccess", TAG+="HyperX_Alloy_Elite_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="1711", TAG+="uaccess", TAG+="HyperX_Alloy_Elite_2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="058f", TAG+="uaccess", TAG+="HyperX_Alloy_Elite_2_HP"
#---------------------------------------------------------------#
# HyperX Alloy Elite 2 - DetectHyperXAlloyElite2
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="1711", TAG+="uaccess", TAG+="HyperX_Alloy_Elite_2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="058f", TAG+="uaccess", TAG+="HyperX_Alloy_Elite_2_HP"
#---------------------------------------------------------------#
# HyperX Alloy FPS - DetectHyperXAlloyFPS
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16dc", TAG+="uaccess", TAG+="HyperX_Alloy_FPS_RGB"
#---------------------------------------------------------------#
# HyperX Alloy Origins - DetectHyperXAlloyOrigins
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16e6", TAG+="uaccess", TAG+="HyperX_Alloy_Origins_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="098f", TAG+="uaccess", TAG+="HyperX_Alloy_Origins_Core_HP"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16e5", TAG+="uaccess", TAG+="HyperX_Alloy_Origins"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="1734", TAG+="uaccess", TAG+="HyperX_Alloy_Origins_60"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="0591", TAG+="uaccess", TAG+="HyperX_Alloy_Origins_HP"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="0c8e", TAG+="uaccess", TAG+="HyperX_Alloy_Origins_60_HP"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="038f", TAG+="uaccess", TAG+="HyperX_Alloy_Origins_65_HP"
#---------------------------------------------------------------#
# HyperX Alloy Origins 60 and 65 - DetectHyperXAlloyOrigins60and65
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="1734", TAG+="uaccess", TAG+="HyperX_Alloy_Origins_60"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="0c8e", TAG+="uaccess", TAG+="HyperX_Alloy_Origins_60_HP"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="038f", TAG+="uaccess", TAG+="HyperX_Alloy_Origins_65_HP"
#---------------------------------------------------------------#
# HyperX Alloy Origins Core - DetectHyperXAlloyOriginsCore
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16e6", TAG+="uaccess", TAG+="HyperX_Alloy_Origins_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="098f", TAG+="uaccess", TAG+="HyperX_Alloy_Origins_Core_HP"
#---------------------------------------------------------------#
# HyperX Quadcast S - DetectHyperXMicrophoneControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="171f", TAG+="uaccess", TAG+="HyperX_Quadcast_S"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="0f8b", TAG+="uaccess", TAG+="HyperX_Quadcast_S"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="068c", TAG+="uaccess", TAG+="HyperX_Quadcast_S"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="0294", TAG+="uaccess", TAG+="HyperX_Quadcast_S"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="028c", TAG+="uaccess", TAG+="HyperX_Quadcast_S"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="098c", TAG+="uaccess", TAG+="HyperX_DuoCast"
#---------------------------------------------------------------#
# HyperX Pulsefire Dart - DetectHyperXPulsefireDartControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16e1", TAG+="uaccess", TAG+="HyperX_Pulsefire_Dart_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="068e", TAG+="uaccess", TAG+="HyperX_Pulsefire_Dart_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16e2", TAG+="uaccess", TAG+="HyperX_Pulsefire_Dart_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="088e", TAG+="uaccess", TAG+="HyperX_Pulsefire_Dart_Wired"
#---------------------------------------------------------------#
# HyperX Pulsefire FPS - DetectHyperXPulsefireFPSProControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16d7", TAG+="uaccess", TAG+="HyperX_Pulsefire_FPS_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16de", TAG+="uaccess", TAG+="HyperX_Pulsefire_Core"
#---------------------------------------------------------------#
# HyperX Pulsefire Haste - DetectHyperXPulsefireHasteControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="0f8f", TAG+="uaccess", TAG+="HyperX_Pulsefire_Haste"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="0f8f", TAG+="uaccess", TAG+="HyperX_Pulsefire_Haste"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="1727", TAG+="uaccess", TAG+="HyperX_Pulsefire_Haste"
#---------------------------------------------------------------#
# HyperX Pulsefire Raid - DetectHyperXPulsefireRaidControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16e4", TAG+="uaccess", TAG+="HyperX_Pulsefire_Raid"
#---------------------------------------------------------------#
# HyperX Pulsefire Surge - DetectHyperXPulsefireSurgeControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16d3", TAG+="uaccess", TAG+="HyperX_Pulsefire_Surge"
#---------------------------------------------------------------#
# HyperX Mousemat - DetectHyperXMousematControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="1705", TAG+="uaccess", TAG+="HyperX_Fury_Ultra"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="0f8d", TAG+="uaccess", TAG+="HyperX_Pulsefire_Mat"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="1741", TAG+="uaccess", TAG+="HyperX_Pulsefire_Mat_RGB_Mouse_Pad_XL"
#---------------------------------------------------------------#
# Intel Arc A770 Limited Edition - DetectIntelArcA770LEControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="01b5", TAG+="uaccess", TAG+="Intel_Arc_A770_Limited_Edition"
#---------------------------------------------------------------#
# Ionico-II 17 - DetectIonicoControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="6005", TAG+="uaccess", TAG+="Ionico_Light_Bar"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="ce00", TAG+="uaccess", TAG+="Ionico_Keyboard"
#---------------------------------------------------------------#
# Kasa Smart Bulbs - DetectKasaSmartControllers
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Keychron Keyboard - DetectKeychronKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="024f", TAG+="uaccess", TAG+="Keychron_Gaming_Keyboard_1"
#---------------------------------------------------------------#
# Serial LED Strip - DetectLEDStripControllers
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# LIFX Globes - DetectLIFXControllers
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Lego Dimensions Toypad Base - DetectLegoDimensionsToypadBaseControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0e6f", ATTRS{idProduct}=="0241", TAG+="uaccess", TAG+="Lego_Dimensions_Toypad_Base"
#---------------------------------------------------------------#
# Lenovo USB - DetectLenovoLegionUSBControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="c935", TAG+="uaccess", TAG+="Lenovo_Legion_Y740"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="c956", TAG+="uaccess", TAG+="Lenovo_Legion_7_gen_5"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="c957", TAG+="uaccess", TAG+="Lenovo_Legion_7S_gen_5"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="c968", TAG+="uaccess", TAG+="Lenovo_Legion_7_gen_6"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="c967", TAG+="uaccess", TAG+="Lenovo_Legion_7S_gen_6"
#---------------------------------------------------------------#
# LenovoMotherboard mouse - DetectLenovoMotherboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="17ef", ATTRS{idProduct}=="c955", TAG+="uaccess", TAG+="Lenovo"
#---------------------------------------------------------------#
# Lexip Mouse - DetectLexipMouseControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="fd0a", TAG+="uaccess", TAG+="Np93_ALPHA__Gaming_Mouse"
#---------------------------------------------------------------#
# Lian Li Uni Hub - DetectLianLiUniHub
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="a101", TAG+="uaccess", TAG+="Lian_Li_Uni_Hub__AL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="a103", TAG+="uaccess", TAG+="Lian_Li_Uni_Hub__SL_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="a105", TAG+="uaccess", TAG+="Lian_Li_Uni_Hub__SL_V2_v05"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="7750", TAG+="uaccess", TAG+="Lian_Li_Uni_Hub"
#---------------------------------------------------------------#
# Lian Li Uni Hub AL - DetectLianLiUniHubAL
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="a101", TAG+="uaccess", TAG+="Lian_Li_Uni_Hub__AL"
#---------------------------------------------------------------#
# Lian Li Uni Hub SLV2 - DetectLianLiUniHubSLV2
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="a103", TAG+="uaccess", TAG+="Lian_Li_Uni_Hub__SL_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="a105", TAG+="uaccess", TAG+="Lian_Li_Uni_Hub__SL_V2_v05"
#---------------------------------------------------------------#
# Lian Li Uni Hub - DetectLianLiUniHub
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="a101", TAG+="uaccess", TAG+="Lian_Li_Uni_Hub__AL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="a103", TAG+="uaccess", TAG+="Lian_Li_Uni_Hub__SL_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="a105", TAG+="uaccess", TAG+="Lian_Li_Uni_Hub__SL_V2_v05"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="7750", TAG+="uaccess", TAG+="Lian_Li_Uni_Hub"
#---------------------------------------------------------------#
# Lian Li Strimer L Connect - DetectStrimerControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="a200", TAG+="uaccess", TAG+="Strimer_L_Connect"
#---------------------------------------------------------------#
# Logitech G203L - DetectLogitechMouseG203L
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c092", TAG+="uaccess", TAG+="Logitech_G203_Lightsync"
#---------------------------------------------------------------#
# Logitech G213 - DetectLogitechKeyboardG213
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c336", TAG+="uaccess", TAG+="Logitech_G213"
#---------------------------------------------------------------#
# Logitech G560 - DetectLogitechG560
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="0a78", TAG+="uaccess", TAG+="Logitech_G560_Lightsync_Speaker"
#---------------------------------------------------------------#
# Logitech G810 - DetectLogitechKeyboardG810
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c342", TAG+="uaccess", TAG+="Logitech_G512"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c33c", TAG+="uaccess", TAG+="Logitech_G512_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c333", TAG+="uaccess", TAG+="Logitech_G610_Orion"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c338", TAG+="uaccess", TAG+="Logitech_G610_Orion"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c331", TAG+="uaccess", TAG+="Logitech_G810_Orion_Spectrum"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c337", TAG+="uaccess", TAG+="Logitech_G810_Orion_Spectrum"
#---------------------------------------------------------------#
# Logitech G815 - DetectLogitechKeyboardG815
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c232", TAG+="uaccess", TAG+="Logitech_G813_RGB_Mechanical_Gaming_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c33f", TAG+="uaccess", TAG+="Logitech_G815_RGB_Mechanical_Gaming_Keyboard"
#---------------------------------------------------------------#
# Logitech G910 - DetectLogitechKeyboardG910
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c32b", TAG+="uaccess", TAG+="Logitech_G910_Orion_Spark"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c335", TAG+="uaccess", TAG+="Logitech_G910_Orion_Spectrum"
#---------------------------------------------------------------#
# Logitech G915 - DetectLogitechKeyboardG915
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c541", TAG+="uaccess", TAG+="Logitech_G915_Wireless_RGB_Mechanical_Gaming_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c547", TAG+="uaccess", TAG+="Logitech_G915_Wireless_RGB_Mechanical_Gaming_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c33e", TAG+="uaccess", TAG+="Logitech_G915_Wireless_RGB_Mechanical_Gaming_Keyboard_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c545", TAG+="uaccess", TAG+="Logitech_G915TKL_Wireless_RGB_Mechanical_Gaming_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c343", TAG+="uaccess", TAG+="Logitech_G915TKL_Wireless_RGB_Mechanical_Gaming_Keyboard_Wired"
#---------------------------------------------------------------#
# Logitech G915 - DetectLogitechKeyboardG915Wired
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c33e", TAG+="uaccess", TAG+="Logitech_G915_Wireless_RGB_Mechanical_Gaming_Keyboard_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c343", TAG+="uaccess", TAG+="Logitech_G915TKL_Wireless_RGB_Mechanical_Gaming_Keyboard_Wired"
#---------------------------------------------------------------#
# Logitech G933 - DetectLogitechG933
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="0a5b", TAG+="uaccess", TAG+="Logitech_G933_Lightsync_Headset"
#---------------------------------------------------------------#
# Logitech Lightsync Mouse - DetectLogitechMouseG303
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c080", TAG+="uaccess", TAG+="Logitech_G303_Daedalus_Apex"
#---------------------------------------------------------------#
# Logitech Lightsync Mouse - DetectLogitechMouseG403
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c08f", TAG+="uaccess", TAG+="Logitech_G403_Hero"
#---------------------------------------------------------------#
# Logitech Lightsync Mouse (1 Zone) - DetectLogitechMouseG203
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c084", TAG+="uaccess", TAG+="Logitech_G203_Prodigy"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c092", TAG+="uaccess", TAG+="Logitech_G203_Lightsync"
#---------------------------------------------------------------#
# Logitech Lightsync Mouse (1 Zone) - DetectLogitechMouseGPRO
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c085", TAG+="uaccess", TAG+="Logitech_G_Pro_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c08c", TAG+="uaccess", TAG+="Logitech_G_Pro_HERO_Gaming_Mouse"
#---------------------------------------------------------------#
# Logitech Powerplay Mat - 
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Logitech G Pro - DetectLogitechKeyboardGPro
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c339", TAG+="uaccess", TAG+="Logitech_G_Pro_RGB_Mechanical_Gaming_Keyboard"
#---------------------------------------------------------------#
# Logitech Lightspeed - DetectLogitechWireless
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="405d", TAG+="uaccess", TAG+="Logitech_G403_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="407f", TAG+="uaccess", TAG+="Logitech_G502_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="4070", TAG+="uaccess", TAG+="Logitech_G703_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="4086", TAG+="uaccess", TAG+="Logitech_G703_Hero_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="4053", TAG+="uaccess", TAG+="Logitech_G900_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="4067", TAG+="uaccess", TAG+="Logitech_G903_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="4087", TAG+="uaccess", TAG+="Logitech_G903_Hero_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="4079", TAG+="uaccess", TAG+="Logitech_G_Pro_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="405f", TAG+="uaccess", TAG+="Logitech_Powerplay_Mat"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c539", TAG+="uaccess", TAG+="Logitech_G_Lightspeed_Receiver"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c53a", TAG+="uaccess", TAG+="Logitech_Powerplay_Mat_Receiver"
#---------------------------------------------------------------#
# Logitech Lightspeed - DetectLogitechWired
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c332", TAG+="uaccess", TAG+="Logitech_G502_Proteus_Spectrum_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c08b", TAG+="uaccess", TAG+="Logitech_G502_Hero_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c083", TAG+="uaccess", TAG+="Logitech_G403_Prodigy_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c082", TAG+="uaccess", TAG+="Logitech_G403_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c08d", TAG+="uaccess", TAG+="Logitech_G502_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c087", TAG+="uaccess", TAG+="Logitech_G703_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c090", TAG+="uaccess", TAG+="Logitech_G703_Hero_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c081", TAG+="uaccess", TAG+="Logitech_G900_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c086", TAG+="uaccess", TAG+="Logitech_G903_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c091", TAG+="uaccess", TAG+="Logitech_G903_Hero_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c088", TAG+="uaccess", TAG+="Logitech_G_Pro_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="0x0a5c", TAG+="uaccess", TAG+="Logitech_G633_Gaming_Headset"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="0ab5", TAG+="uaccess", TAG+="Logitech_G733_Gaming_Headset"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="0a87", TAG+="uaccess", TAG+="Logitech_G935_Gaming_Headset"
#---------------------------------------------------------------#
# Logitech X56 - DetectLogitechX56
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0738", ATTRS{idProduct}=="2221", TAG+="uaccess", TAG+="Logitech_X56_Rhino_Hotas_Joystick"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0738", ATTRS{idProduct}=="a221", TAG+="uaccess", TAG+="Logitech_X56_Rhino_Hotas_Throttle"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0738", ATTRS{idProduct}=="2221", TAG+="uaccess", TAG+="Logitech_X56_Rhino_Hotas_Joystick"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0738", ATTRS{idProduct}=="a221", TAG+="uaccess", TAG+="Logitech_X56_Rhino_Hotas_Throttle"
#---------------------------------------------------------------#
# MSI 3 Zone Keyboard - DetectMSI3ZoneControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1770", ATTRS{idProduct}=="ff00", TAG+="uaccess", TAG+="MSI_3Zone_Laptop"
#---------------------------------------------------------------#
# MSI Mystic Light (112 Byte) - DetectMSIMysticLightControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="1720", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS1720"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b12", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B12"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b16", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B16"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b17", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B17"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b18", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B18"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b50", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B50"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b85", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B85"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b93", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B93"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c34", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C34"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c35", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C35"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c36", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C36"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c37", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C37"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c56", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C56"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c59", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C59"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c60", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C60"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c67", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C67"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c71", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C71"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c73", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C73"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c75", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C75"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c76", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C76"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c77", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C77"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c79", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C79"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c80", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C80"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c81", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C81"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c82", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C82"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c83", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C83"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c84", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C84"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c86", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C86"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c87", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C87"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c90", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C90"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c91", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C91"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c92", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C92"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c94", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C94"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c95", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C95"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c98", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C98"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d03", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D03"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d06", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D06"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d07", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D07"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d08", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D08"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d09", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D09"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d13", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D13"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d15", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D15"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d17", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D17"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d18", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D18"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d19", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D19"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d20", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D20"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d25", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D25"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d27", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D27"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d28", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D28"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d29", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D29"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d30", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D30"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d31", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D31"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d32", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D32"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d36", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D36"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d38", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D38"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d41", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D41"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d42", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D42"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d43", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D43"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d46", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D46"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d50", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D50"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d51", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D51"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d52", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D52"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d53", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D53"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d54", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D54"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d59", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D59"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d67", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D67"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d69", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D69"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d70", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D70"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d73", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D73"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d75", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D75"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d76", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D76"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d77", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D77"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d78", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D78"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d86", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D86"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d89", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D89"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d91", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D91"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7e01", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7E01"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7e06", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7E06"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7e07", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7E07"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="b926", TAG+="uaccess", TAG+="MSI_Mystic_Light_MSB926"
#---------------------------------------------------------------#
# MSI Mystic Light (162 Byte) - DetectMSIMysticLightControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="1720", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS1720"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b12", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B12"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b16", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B16"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b17", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B17"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b18", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B18"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b50", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B50"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b85", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B85"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b93", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B93"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c34", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C34"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c35", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C35"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c36", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C36"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c37", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C37"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c56", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C56"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c59", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C59"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c60", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C60"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c67", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C67"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c71", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C71"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c73", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C73"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c75", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C75"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c76", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C76"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c77", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C77"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c79", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C79"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c80", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C80"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c81", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C81"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c82", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C82"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c83", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C83"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c84", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C84"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c86", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C86"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c87", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C87"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c90", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C90"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c91", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C91"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c92", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C92"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c94", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C94"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c95", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C95"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c98", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C98"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d03", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D03"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d06", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D06"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d07", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D07"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d08", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D08"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d09", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D09"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d13", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D13"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d15", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D15"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d17", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D17"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d18", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D18"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d19", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D19"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d20", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D20"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d25", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D25"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d27", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D27"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d28", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D28"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d29", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D29"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d30", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D30"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d31", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D31"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d32", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D32"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d36", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D36"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d38", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D38"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d41", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D41"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d42", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D42"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d43", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D43"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d46", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D46"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d50", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D50"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d51", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D51"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d52", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D52"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d53", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D53"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d54", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D54"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d59", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D59"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d67", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D67"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d69", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D69"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d70", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D70"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d73", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D73"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d75", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D75"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d76", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D76"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d77", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D77"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d78", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D78"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d86", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D86"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d89", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D89"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d91", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D91"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7e01", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7E01"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7e06", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7E06"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7e07", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7E07"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="b926", TAG+="uaccess", TAG+="MSI_Mystic_Light_MSB926"
#---------------------------------------------------------------#
# MSI Mystic Light (185 Byte) - DetectMSIMysticLightControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="1720", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS1720"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b12", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B12"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b16", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B16"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b17", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B17"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b18", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B18"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b50", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B50"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b85", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B85"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b93", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B93"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c34", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C34"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c35", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C35"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c36", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C36"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c37", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C37"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c56", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C56"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c59", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C59"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c60", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C60"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c67", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C67"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c71", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C71"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c73", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C73"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c75", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C75"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c76", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C76"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c77", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C77"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c79", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C79"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c80", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C80"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c81", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C81"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c82", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C82"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c83", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C83"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c84", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C84"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c86", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C86"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c87", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C87"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c90", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C90"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c91", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C91"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c92", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C92"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c94", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C94"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c95", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C95"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c98", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C98"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d03", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D03"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d06", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D06"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d07", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D07"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d08", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D08"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d09", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D09"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d13", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D13"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d15", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D15"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d17", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D17"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d18", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D18"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d19", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D19"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d20", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D20"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d25", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D25"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d27", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D27"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d28", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D28"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d29", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D29"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d30", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D30"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d31", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D31"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d32", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D32"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d36", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D36"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d38", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D38"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d41", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D41"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d42", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D42"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d43", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D43"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d46", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D46"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d50", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D50"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d51", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D51"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d52", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D52"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d53", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D53"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d54", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D54"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d59", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D59"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d67", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D67"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d69", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D69"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d70", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D70"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d73", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D73"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d75", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D75"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d76", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D76"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d77", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D77"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d78", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D78"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d86", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D86"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d89", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D89"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d91", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D91"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7e01", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7E01"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7e06", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7E06"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7e07", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7E07"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="b926", TAG+="uaccess", TAG+="MSI_Mystic_Light_MSB926"
#---------------------------------------------------------------#
# MSI GL66 Mystic Light Keyboard (64 Byte) - DetectMSIMysticLight64Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="1562", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS1562"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="1563", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS1563"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="1564", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS1564"
#---------------------------------------------------------------#
# MSI Optix - DetectMSIOptixControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="3fa4", TAG+="uaccess", TAG+="MSI_Optix_controller"
#---------------------------------------------------------------#
# MSI Vigor GK30 - DetectMSIVigorGK30Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0db0", ATTRS{idProduct}=="0b30", TAG+="uaccess", TAG+="MSI_Vigor_GK30_controller"
#---------------------------------------------------------------#
# Mountain Keyboard - DetectMountainKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3282", ATTRS{idProduct}=="0001", TAG+="uaccess", TAG+="Mountain_Everest"
#---------------------------------------------------------------#
# N5312A mouse - DetectN5312AControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="4e53", ATTRS{idProduct}=="5406", TAG+="uaccess", TAG+="N5312A_USB_Optical_Mouse"
#---------------------------------------------------------------#
# NZXT Hue 1 - DetectNZXTHue1Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="1714", TAG+="uaccess", TAG+="NZXT_Smart_Device_V1"
#---------------------------------------------------------------#
# NZXT Hue2 - DetectNZXTHue2
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2001", TAG+="uaccess", TAG+="NZXT_Hue_2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2002", TAG+="uaccess", TAG+="NZXT_Hue_2_Ambient"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2005", TAG+="uaccess", TAG+="NZXT_Hue_2_Motherboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="200b", TAG+="uaccess", TAG+="NZXT_Hue_2_Motherboard"
#---------------------------------------------------------------#
# NZXT Hue2 - DetectNZXTHue2Ambient
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2002", TAG+="uaccess", TAG+="NZXT_Hue_2_Ambient"
#---------------------------------------------------------------#
# NZXT Hue2 - DetectNZXTHue2Motherboard
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2005", TAG+="uaccess", TAG+="NZXT_Hue_2_Motherboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="200b", TAG+="uaccess", TAG+="NZXT_Hue_2_Motherboard"
#---------------------------------------------------------------#
# NZXT Hue2 - DetectNZXTSmartDeviceV2
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2006", TAG+="uaccess", TAG+="NZXT_Smart_Device_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="200d", TAG+="uaccess", TAG+="NZXT_Smart_Device_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="200f", TAG+="uaccess", TAG+="NZXT_Smart_Device_V2"
#---------------------------------------------------------------#
# NZXT Hue2 - DetectNZXTKrakenX3
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2007", TAG+="uaccess", TAG+="NZXT_Kraken_X3_Series"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2014", TAG+="uaccess", TAG+="NZXT_Kraken_X3_Series_RGB"
#---------------------------------------------------------------#
# NZXT Hue2 - DetectNZXTFanController
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2009", TAG+="uaccess", TAG+="NZXT_RGB__Fan_Controller"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2010", TAG+="uaccess", TAG+="NZXT_RGB__Fan_Controller"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="200e", TAG+="uaccess", TAG+="NZXT_RGB__Fan_Controller"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2011", TAG+="uaccess", TAG+="NZXT_RGB__Fan_Controller"
#---------------------------------------------------------------#
# NZXT Hue+ - DetectNZXTHuePlusControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="serial|hidraw", ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="00df", TAG+="uaccess", TAG+="NZXT_Hue"
#---------------------------------------------------------------#
# NZXT Kraken - DetectNZXTKrakenControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="170e", TAG+="uaccess", TAG+="NZXT_Kraken_X2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="1715", TAG+="uaccess", TAG+="NZXT_Kraken_M2"
#---------------------------------------------------------------#
# Nollie Controller - DetectNollieControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4714", TAG+="uaccess", TAG+="Nollie_32CH"
#---------------------------------------------------------------#
# NVidia ESA - DetectNvidiaESAControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0955", ATTRS{idProduct}=="000a", TAG+="uaccess", TAG+="Nvidia_ESA__Dell_XPS_730x"
#---------------------------------------------------------------#
# Openrazer - DetectOpenRazerControllers
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Openrazer Windows - DetectOpenRazerControllers
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Quantum Mechanical Keyboard (QMK) - 
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Razer - DetectRazerControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0241", TAG+="uaccess", TAG+="Razer_Blackwidow_2019"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0203", TAG+="uaccess", TAG+="Razer_Blackwidow_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0209", TAG+="uaccess", TAG+="Razer_Blackwidow_Chroma_Tournament_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0221", TAG+="uaccess", TAG+="Razer_Blackwidow_Chroma_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0228", TAG+="uaccess", TAG+="Razer_Blackwidow_Elite"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0211", TAG+="uaccess", TAG+="Razer_Blackwidow_Overwatch"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="024e", TAG+="uaccess", TAG+="Razer_Blackwidow_V3"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="025a", TAG+="uaccess", TAG+="Razer_Blackwidow_V3_Pro_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="025c", TAG+="uaccess", TAG+="Razer_Blackwidow_V3_Pro_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0a24", TAG+="uaccess", TAG+="Razer_Blackwidow_V3_TKL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0258", TAG+="uaccess", TAG+="Razer_Blackwidow_V3_Mini_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0271", TAG+="uaccess", TAG+="Razer_Blackwidow_V3_Mini_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0216", TAG+="uaccess", TAG+="Razer_Blackwidow_X_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="021a", TAG+="uaccess", TAG+="Razer_Blackwidow_X_Chroma_Tournament_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="022a", TAG+="uaccess", TAG+="Razer_Cynosa_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="025e", TAG+="uaccess", TAG+="Razer_Cynosa_Chroma_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="023f", TAG+="uaccess", TAG+="Razer_Cynosa_Lite"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0204", TAG+="uaccess", TAG+="Razer_Deathstalker_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0295", TAG+="uaccess", TAG+="Razer_Deathstalker_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0292", TAG+="uaccess", TAG+="Razer_Deathstalker_V2_Pro_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0290", TAG+="uaccess", TAG+="Razer_Deathstalker_V2_Pro_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0227", TAG+="uaccess", TAG+="Razer_Huntsman"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0226", TAG+="uaccess", TAG+="Razer_Huntsman_Elite"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0257", TAG+="uaccess", TAG+="Razer_Huntsman_Mini"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0243", TAG+="uaccess", TAG+="Razer_Huntsman_Tournament_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0266", TAG+="uaccess", TAG+="Razer_Huntsman_V2_Analog"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="026b", TAG+="uaccess", TAG+="Razer_Huntsman_V2_TKL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="026c", TAG+="uaccess", TAG+="Razer_Huntsman_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="021e", TAG+="uaccess", TAG+="Razer_Ornata_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="025d", TAG+="uaccess", TAG+="Razer_Ornata_Chroma_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="028f", TAG+="uaccess", TAG+="Razer_Ornata_V3"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="02a1", TAG+="uaccess", TAG+="Razer_Ornata_V3_Rev2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0294", TAG+="uaccess", TAG+="Razer_Ornata_V3_X"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="020f", TAG+="uaccess", TAG+="Razer_Blade_2016"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0224", TAG+="uaccess", TAG+="Razer_Blade_Late_2016"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0270", TAG+="uaccess", TAG+="Razer_Blade_14_2021"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="028c", TAG+="uaccess", TAG+="Razer_Blade_14_2022"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="028a", TAG+="uaccess", TAG+="Razer_Blade_15_2022"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0233", TAG+="uaccess", TAG+="Razer_Blade_15_2018_Advanced"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="023b", TAG+="uaccess", TAG+="Razer_Blade_15_2018_Base"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0240", TAG+="uaccess", TAG+="Razer_Blade_15_2018_Mercury"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="023a", TAG+="uaccess", TAG+="Razer_Blade_15_2019_Advanced"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0246", TAG+="uaccess", TAG+="Razer_Blade_15_2019_Base"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0245", TAG+="uaccess", TAG+="Razer_Blade_15_2019_Mercury"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="024d", TAG+="uaccess", TAG+="Razer_Blade_15_2019_Studio"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0253", TAG+="uaccess", TAG+="Razer_Blade_15_2020_Advanced"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0255", TAG+="uaccess", TAG+="Razer_Blade_15_2020_Base"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0268", TAG+="uaccess", TAG+="Razer_Blade_15_Late_2020"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="026d", TAG+="uaccess", TAG+="Razer_Blade_15_2021_Advanced"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0276", TAG+="uaccess", TAG+="Razer_Blade_15_Late_2021_Advanced"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="026f", TAG+="uaccess", TAG+="Razer_Blade_15_2021_Base"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="027a", TAG+="uaccess", TAG+="Razer_Blade_15_2021_Base"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0210", TAG+="uaccess", TAG+="Razer_Blade_Pro_2016"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0225", TAG+="uaccess", TAG+="Razer_Blade_Pro_2017"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="022f", TAG+="uaccess", TAG+="Razer_Blade_Pro_2017_FullHD"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0234", TAG+="uaccess", TAG+="Razer_Blade_Pro_2019"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="024c", TAG+="uaccess", TAG+="Razer_Blade_Pro_Late_2019"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0256", TAG+="uaccess", TAG+="Razer_Blade_Pro_17_2020"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0279", TAG+="uaccess", TAG+="Razer_Blade_Pro_17_2021"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0205", TAG+="uaccess", TAG+="Razer_Blade_Stealth_2016"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0220", TAG+="uaccess", TAG+="Razer_Blade_Stealth_Late_2016"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="022d", TAG+="uaccess", TAG+="Razer_Blade_Stealth_2017"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0232", TAG+="uaccess", TAG+="Razer_Blade_Stealth_Late_2017"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0239", TAG+="uaccess", TAG+="Razer_Blade_Stealth_2019"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="024a", TAG+="uaccess", TAG+="Razer_Blade_Stealth_Late_2019"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0252", TAG+="uaccess", TAG+="Razer_Blade_Stealth_2020"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0259", TAG+="uaccess", TAG+="Razer_Blade_Stealth_Late_2020"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="026a", TAG+="uaccess", TAG+="Razer_Book_13_2020"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="006a", TAG+="uaccess", TAG+="Razer_Abyssus_Elite_DVa_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="006b", TAG+="uaccess", TAG+="Razer_Abyssus_Essential"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0064", TAG+="uaccess", TAG+="Razer_Basilisk"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0065", TAG+="uaccess", TAG+="Razer_Basilisk_Essential"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0086", TAG+="uaccess", TAG+="Razer_Basilisk_Ultimate_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0088", TAG+="uaccess", TAG+="Razer_Basilisk_Ultimate_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0085", TAG+="uaccess", TAG+="Razer_Basilisk_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0099", TAG+="uaccess", TAG+="Razer_Basilisk_V3"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="00aa", TAG+="uaccess", TAG+="Razer_Basilisk_V3_Pro_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="00ab", TAG+="uaccess", TAG+="Razer_Basilisk_V3_Pro_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0043", TAG+="uaccess", TAG+="Razer_Deathadder_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="005c", TAG+="uaccess", TAG+="Razer_Deathadder_Elite"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="006e", TAG+="uaccess", TAG+="Razer_Deathadder_Essential"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0098", TAG+="uaccess", TAG+="Razer_Deathadder_Essential_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0071", TAG+="uaccess", TAG+="Razer_Deathadder_Essential_White_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0084", TAG+="uaccess", TAG+="Razer_Deathadder_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="008c", TAG+="uaccess", TAG+="Razer_Deathadder_V2_Mini"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="007c", TAG+="uaccess", TAG+="Razer_Deathadder_V2_Pro_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="007d", TAG+="uaccess", TAG+="Razer_Deathadder_V2_Pro_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="004c", TAG+="uaccess", TAG+="Razer_Diamondback"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0059", TAG+="uaccess", TAG+="Razer_Lancehead_2017_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="005a", TAG+="uaccess", TAG+="Razer_Lancehead_2017_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0070", TAG+="uaccess", TAG+="Razer_Lancehead_2019_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="006f", TAG+="uaccess", TAG+="Razer_Lancehead_2019_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0060", TAG+="uaccess", TAG+="Razer_Lancehead_Tournament_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0024", TAG+="uaccess", TAG+="Razer_Mamba_2012_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0025", TAG+="uaccess", TAG+="Razer_Mamba_2012_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0044", TAG+="uaccess", TAG+="Razer_Mamba_2015_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0045", TAG+="uaccess", TAG+="Razer_Mamba_2015_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0073", TAG+="uaccess", TAG+="Razer_Mamba_2018_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0072", TAG+="uaccess", TAG+="Razer_Mamba_2018_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="006c", TAG+="uaccess", TAG+="Razer_Mamba_Elite"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0046", TAG+="uaccess", TAG+="Razer_Mamba_Tournament_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0053", TAG+="uaccess", TAG+="Razer_Naga_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0093", TAG+="uaccess", TAG+="Razer_Naga_Classic"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="003e", TAG+="uaccess", TAG+="Razer_Naga_Epic_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="008d", TAG+="uaccess", TAG+="Razer_Naga_Left_Handed"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0050", TAG+="uaccess", TAG+="Razer_Naga_Hex_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0067", TAG+="uaccess", TAG+="Razer_Naga_Trinity"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="008f", TAG+="uaccess", TAG+="Razer_Naga_Pro_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0090", TAG+="uaccess", TAG+="Razer_Naga_Pro_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0078", TAG+="uaccess", TAG+="Razer_Viper"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0091", TAG+="uaccess", TAG+="Razer_Viper_8kHz"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="008a", TAG+="uaccess", TAG+="Razer_Viper_Mini"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="007a", TAG+="uaccess", TAG+="Razer_Viper_Ultimate_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="007b", TAG+="uaccess", TAG+="Razer_Viper_Ultimate_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0207", TAG+="uaccess", TAG+="Razer_Orbweaver_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0208", TAG+="uaccess", TAG+="Razer_Tartarus_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0244", TAG+="uaccess", TAG+="Razer_Tartarus_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="022b", TAG+="uaccess", TAG+="Razer_Tartarus_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f19", TAG+="uaccess", TAG+="Razer_Kraken_Kitty_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f21", TAG+="uaccess", TAG+="Razer_Kraken_Kitty_Black_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f03", TAG+="uaccess", TAG+="Razer_Tiamat_71_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0c00", TAG+="uaccess", TAG+="Razer_Firefly"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0c04", TAG+="uaccess", TAG+="Razer_Firefly_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0068", TAG+="uaccess", TAG+="Razer_Firefly_Hyperflux"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0c01", TAG+="uaccess", TAG+="Razer_Goliathus"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0c02", TAG+="uaccess", TAG+="Razer_Goliathus_Extended"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0c05", TAG+="uaccess", TAG+="Razer_Strider_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f08", TAG+="uaccess", TAG+="Razer_Base_Station_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f20", TAG+="uaccess", TAG+="Razer_Base_Station_V2_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f26", TAG+="uaccess", TAG+="Razer_Charging_Pad_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f09", TAG+="uaccess", TAG+="Razer_Chroma_HDK"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f07", TAG+="uaccess", TAG+="Razer_Chroma_Mug_Holder"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f0e", TAG+="uaccess", TAG+="Razer_Chroma_PC_Case_Lighting_Kit"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0215", TAG+="uaccess", TAG+="Razer_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f1a", TAG+="uaccess", TAG+="Razer_Core_X"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f0d", TAG+="uaccess", TAG+="Razer_Laptop_Stand_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f2b", TAG+="uaccess", TAG+="Razer_Laptop_Stand_Chroma_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="054a", TAG+="uaccess", TAG+="Razer_Leviathan_V2_X"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f1d", TAG+="uaccess", TAG+="Razer_Mouse_Bungee_V3_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="007e", TAG+="uaccess", TAG+="Razer_Mouse_Dock_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="00a4", TAG+="uaccess", TAG+="Razer_Mouse_Dock_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f13", TAG+="uaccess", TAG+="Lian_Li_O11_Dynamic__Razer_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f1b", TAG+="uaccess", TAG+="Razer_Seiren_Emote"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f21", TAG+="uaccess", TAG+="Razer_Thunderbolt_4_Dock_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0517", TAG+="uaccess", TAG+="Razer_Nommo_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0518", TAG+="uaccess", TAG+="Razer_Nommo_Pro"
#---------------------------------------------------------------#
# Razer ARGB - DetectRazerARGBControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f1f", TAG+="uaccess", TAG+="Razer_Chroma_Addressable_RGB_Controller"
#---------------------------------------------------------------#
# Razer Kraken - DetectRazerKrakenControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0501", TAG+="uaccess", TAG+="Razer_Kraken_71"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0506", TAG+="uaccess", TAG+="Razer_Kraken_71"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0504", TAG+="uaccess", TAG+="Razer_Kraken_71_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0510", TAG+="uaccess", TAG+="Razer_Kraken_71_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0527", TAG+="uaccess", TAG+="Razer_Kraken_Ultimate"
#---------------------------------------------------------------#
# Keyrox - DetectRedSquareKeyroxTKLClassic
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0416", ATTRS{idProduct}=="c345", TAG+="uaccess", TAG+="Red_Square_Keyrox_TKL_Classic"
#---------------------------------------------------------------#
# Redragon Mice - DetectRedragonMice
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="fc30", TAG+="uaccess", TAG+="Redragon_M711_Cobra"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="fc39", TAG+="uaccess", TAG+="Redragon_M715_Dagger"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="fc3a", TAG+="uaccess", TAG+="Redragon_M716_Inquisitor"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="fc4d", TAG+="uaccess", TAG+="Redragon_M908_Impact"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="fc38", TAG+="uaccess", TAG+="Redragon_M602_Griffin"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="fc5f", TAG+="uaccess", TAG+="Redragon_M808_Storm"
#---------------------------------------------------------------#
# Roccat Burst Mouse - DetectRoccatBurstCoreControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="2de6", TAG+="uaccess", TAG+="Roccat_Burst_Core"
#---------------------------------------------------------------#
# Roccat Burst Mouse - DetectRoccatBurstProControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="2de1", TAG+="uaccess", TAG+="Roccat_Burst_Pro"
#---------------------------------------------------------------#
# Roccat Elo 7.1 - DetectRoccatEloControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="3a34", TAG+="uaccess", TAG+="Roccat_Elo_71"
#---------------------------------------------------------------#
# Roccat Horde Aimo - DetectRoccatHordeAimoKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="303e", TAG+="uaccess", TAG+="Roccat_Horde_Aimo"
#---------------------------------------------------------------#
# Roccat Kone Aimo - DetectRoccatMouseControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="2e27", TAG+="uaccess", TAG+="Roccat_Kone_Aimo"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="2e2c", TAG+="uaccess", TAG+="Roccat_Kone_Aimo_16K"
#---------------------------------------------------------------#
# Roccat Kova - RoccatControllerDetect
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Roccat Vulcan Aimo - DetectRoccatVulcanAimoControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="3098", TAG+="uaccess", TAG+="Roccat_Vulcan_120Series_Aimo"
#---------------------------------------------------------------#
# SRGBmods LED Controller V1 - DetectSRGBmodsControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="1123", TAG+="uaccess", TAG+="SRGBmods_Pico_LED_Controller"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="1205", TAG+="uaccess", TAG+="SRGBMods_LED_Controller_v1"
#---------------------------------------------------------------#
# SRGBmods Raspberry Pi Pico LED Controller - DetectSRGBmodsControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="1123", TAG+="uaccess", TAG+="SRGBmods_Pico_LED_Controller"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="1205", TAG+="uaccess", TAG+="SRGBMods_LED_Controller_v1"
#---------------------------------------------------------------#
# Sinowealth Mice - DetectSinowealthMouse
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0036", TAG+="uaccess", TAG+="Glorious_Model_O__O"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0033", TAG+="uaccess", TAG+="Glorious_Model_D__D"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0029", TAG+="uaccess", TAG+="Everest_GT100_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="1007", TAG+="uaccess", TAG+="ZET_Fury_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2022", TAG+="uaccess", TAG+="Glorious_Model_O__O_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2011", TAG+="uaccess", TAG+="Glorious_Model_O__O_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2023", TAG+="uaccess", TAG+="Glorious_Model_D__D_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2012", TAG+="uaccess", TAG+="Glorious_Model_D__D_Wireless"
#---------------------------------------------------------------#
# Sinowealth 1007 Mouse - DetectSinowealthMouse
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0036", TAG+="uaccess", TAG+="Glorious_Model_O__O"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0033", TAG+="uaccess", TAG+="Glorious_Model_D__D"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0029", TAG+="uaccess", TAG+="Everest_GT100_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="1007", TAG+="uaccess", TAG+="ZET_Fury_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2022", TAG+="uaccess", TAG+="Glorious_Model_O__O_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2011", TAG+="uaccess", TAG+="Glorious_Model_O__O_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2023", TAG+="uaccess", TAG+="Glorious_Model_D__D_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2012", TAG+="uaccess", TAG+="Glorious_Model_D__D_Wireless"
#---------------------------------------------------------------#
# Sinowealth Glorious Model O Wireless - DetectSinowealthMouse
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0036", TAG+="uaccess", TAG+="Glorious_Model_O__O"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0033", TAG+="uaccess", TAG+="Glorious_Model_D__D"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0029", TAG+="uaccess", TAG+="Everest_GT100_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="1007", TAG+="uaccess", TAG+="ZET_Fury_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2022", TAG+="uaccess", TAG+="Glorious_Model_O__O_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2011", TAG+="uaccess", TAG+="Glorious_Model_O__O_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2023", TAG+="uaccess", TAG+="Glorious_Model_D__D_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2012", TAG+="uaccess", TAG+="Glorious_Model_D__D_Wireless"
#---------------------------------------------------------------#
# Sinowealth Keyboard - DetectSinowealthKeyboard
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Sinowealth Keyboard 16 - DetectSinowealthKeyboard
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Genesis Thor 300 - DetectSinowealthGenesisKeyboard
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0090", TAG+="uaccess", TAG+="Genesis_Thor_300"
#---------------------------------------------------------------#
# Sony Dual Shock 4 controller - DetectSonyDS4Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="05c4", TAG+="uaccess", TAG+="Sony_DualShock_4"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="09cc", TAG+="uaccess", TAG+="Sony_DualShock_4"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ba0", TAG+="uaccess", TAG+="Sony_DualShock_4"
#---------------------------------------------------------------#
# Sony Dual Sense controller - DetectSonyDualSenseControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", TAG+="uaccess", TAG+="Sony_DualSense"
#---------------------------------------------------------------#
# Steel Series APEX - DetectSteelSeriesApex
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="161a", TAG+="uaccess", TAG+="SteelSeries_Apex_3"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1622", TAG+="uaccess", TAG+="SteelSeries_Apex_3_TKL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="161c", TAG+="uaccess", TAG+="SteelSeries_Apex_5"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1612", TAG+="uaccess", TAG+="SteelSeries_Apex_7"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1618", TAG+="uaccess", TAG+="SteelSeries_Apex_7_TKL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1610", TAG+="uaccess", TAG+="SteelSeries_Apex_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1614", TAG+="uaccess", TAG+="SteelSeries_Apex_Pro_TKL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="0616", TAG+="uaccess", TAG+="SteelSeries_Apex_M750"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1202", TAG+="uaccess", TAG+="SteelSeries_Apex_OGApex_Fnatic"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1206", TAG+="uaccess", TAG+="SteelSeries_Apex_350"
#---------------------------------------------------------------#
# Steel Series APEX - DetectSteelSeriesApexM
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="0616", TAG+="uaccess", TAG+="SteelSeries_Apex_M750"
#---------------------------------------------------------------#
# Steel Series Apex Tri Zone Keyboards - DetectSteelSeriesApexTZone
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Steelseries Arctis 5 - DetectSteelSeriesArctis5
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="12aa", TAG+="uaccess", TAG+="SteelSeries_Arctis_5"
#---------------------------------------------------------------#
# Steel Series Apex (Old) - DetectSteelSeriesApexOld
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1202", TAG+="uaccess", TAG+="SteelSeries_Apex_OGApex_Fnatic"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1206", TAG+="uaccess", TAG+="SteelSeries_Apex_350"
#---------------------------------------------------------------#
# Steel Series QCK Mat - DetectSteelSeriesMousemat
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="150a", TAG+="uaccess", TAG+="SteelSeries_QCK_Prism_Cloth_Medium"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="150d", TAG+="uaccess", TAG+="SteelSeries_QCK_Prism_Cloth_XL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="151e", TAG+="uaccess", TAG+="SteelSeries_QCK_Prism_Cloth_XL_Destiny_Ed"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1514", TAG+="uaccess", TAG+="SteelSeries_QCK_Prism_Cloth_XL_CSGO_Neon_Rider_Ed"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1516", TAG+="uaccess", TAG+="SteelSeries_QCK_Prism_Cloth_3XL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1518", TAG+="uaccess", TAG+="SteelSeries_QCK_Prism_Cloth_4XL"
#---------------------------------------------------------------#
# Steel Series Rival - DetectSteelSeriesRival100
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1702", TAG+="uaccess", TAG+="SteelSeries_Rival_100"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="170c", TAG+="uaccess", TAG+="SteelSeries_Rival_100_DotA_2_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1814", TAG+="uaccess", TAG+="SteelSeries_Rival_105"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1816", TAG+="uaccess", TAG+="SteelSeries_Rival_106"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1729", TAG+="uaccess", TAG+="SteelSeries_Rival_110"
#---------------------------------------------------------------#
# Steel Series Rival - DetectSteelSeriesRival300
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1710", TAG+="uaccess", TAG+="SteelSeries_Rival_300"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1714", TAG+="uaccess", TAG+="Acer_Predator_Gaming_Mouse_Rival_300"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1394", TAG+="uaccess", TAG+="SteelSeries_Rival_300_CSGO_Fade_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1716", TAG+="uaccess", TAG+="SteelSeries_Rival_300_CSGO_Fade_Edition_stm32"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="171a", TAG+="uaccess", TAG+="SteelSeries_Rival_300_CSGO_Hyperbeast_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1392", TAG+="uaccess", TAG+="SteelSeries_Rival_300_Dota_2_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1718", TAG+="uaccess", TAG+="SteelSeries_Rival_300_HP_Omen_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1710", TAG+="uaccess", TAG+="SteelSeries_Rival_300_Black_Ops_Edition"
#---------------------------------------------------------------#
# Steel Series Rival - DetectSteelSeriesRival600
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1724", TAG+="uaccess", TAG+="SteelSeries_Rival_600"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="172e", TAG+="uaccess", TAG+="SteelSeries_Rival_600_Dota_2_Edition"
#---------------------------------------------------------------#
# Steel Series Rival - DetectSteelSeriesRival650
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="172b", TAG+="uaccess", TAG+="SteelSeries_Rival_650"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1726", TAG+="uaccess", TAG+="SteelSeries_Rival_650_Wireless"
#---------------------------------------------------------------#
# Steel Series Rival - DetectSteelSeriesRival700
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1700", TAG+="uaccess", TAG+="SteelSeries_Rival_700"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1730", TAG+="uaccess", TAG+="SteelSeries_Rival_710"
#---------------------------------------------------------------#
# Steel Series Rival 3 - DetectSteelSeriesRival3
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1710", TAG+="uaccess", TAG+="SteelSeries_Rival_300"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1714", TAG+="uaccess", TAG+="Acer_Predator_Gaming_Mouse_Rival_300"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1394", TAG+="uaccess", TAG+="SteelSeries_Rival_300_CSGO_Fade_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1716", TAG+="uaccess", TAG+="SteelSeries_Rival_300_CSGO_Fade_Edition_stm32"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="171a", TAG+="uaccess", TAG+="SteelSeries_Rival_300_CSGO_Hyperbeast_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1392", TAG+="uaccess", TAG+="SteelSeries_Rival_300_Dota_2_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1718", TAG+="uaccess", TAG+="SteelSeries_Rival_300_HP_Omen_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1710", TAG+="uaccess", TAG+="SteelSeries_Rival_300_Black_Ops_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1824", TAG+="uaccess", TAG+="SteelSeries_Rival_3_Old_Firmware"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="184c", TAG+="uaccess", TAG+="SteelSeries_Rival_3"
#---------------------------------------------------------------#
# Steel Series Sensei - DetectSteelSeriesSensei
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1720", TAG+="uaccess", TAG+="SteelSeries_Rival_310"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="171e", TAG+="uaccess", TAG+="SteelSeries_Rival_310_CSGO_Howl_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1736", TAG+="uaccess", TAG+="SteelSeries_Rival_310_PUBG_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1832", TAG+="uaccess", TAG+="SteelSeries_Sensei_TEN"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1834", TAG+="uaccess", TAG+="SteelSeries_Sensei_TEN_CSGO_Neon_Rider_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1722", TAG+="uaccess", TAG+="SteelSeries_Sensei_310"
#---------------------------------------------------------------#
# Steel Series Siberia - DetectSteelSeriesHeadset
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1229", TAG+="uaccess", TAG+="SteelSeries_Siberia_350"
#---------------------------------------------------------------#
# Tecknet Mouse - DetectTecknetControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="fc05", TAG+="uaccess", TAG+="Tecknet_M008"
#---------------------------------------------------------------#
# Thermaltake PoseidonZ - DetectPoseidonZRGBControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="3006", TAG+="uaccess", TAG+="Thermaltake_Poseidon_Z_RGB"
#---------------------------------------------------------------#
# Thermaltake Riing - DetectThermaltakeRiingControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fa5", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FA5"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fa6", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FA6"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fa7", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FA7"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fa8", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FA8"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fa9", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FA9"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1faa", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FAA"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fab", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FAB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fac", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FAC"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fad", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FAD"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fae", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FAE"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1faf", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FAF"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fb0", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FB0"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fb1", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FB1"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fb2", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FB2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fb3", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FB3"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fb4", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FB4"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fb5", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FB5"
#---------------------------------------------------------------#
# Thermaltake Riing Quad - DetectThermaltakeRiingQuadControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2260", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2260"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2261", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2261"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2262", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2262"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2263", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2263"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2264", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2264"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2265", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2265"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2266", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2266"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2267", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2267"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2268", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2268"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2269", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2269"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="226a", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x226A"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="226b", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x226B"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="226c", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x226C"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="226d", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x226D"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="226e", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x226E"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="226f", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x226F"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2270", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2270"
#---------------------------------------------------------------#
# ThingM Blink - DetectThingMBlink
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="27b8", ATTRS{idProduct}=="01ed", TAG+="uaccess", TAG+="ThingM_blink1_mk2"
#---------------------------------------------------------------#
# Trust GXT 114 - DetectTrustGXT114Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="145f", ATTRS{idProduct}=="026d", TAG+="uaccess", TAG+="Trust_GXT_114"
#---------------------------------------------------------------#
# Trust GXT 180 - DetectTrustGXT180Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="145f", ATTRS{idProduct}=="0248", TAG+="uaccess", TAG+="Trust_GXT_180"
#---------------------------------------------------------------#
# Viewsonic Monitor - DetectViewSonic
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0416", ATTRS{idProduct}=="5020", TAG+="uaccess", TAG+="ViewSonic_Monitor_XG270QG"
#---------------------------------------------------------------#
# Wooting Keyboards - DetectWootingOneKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess", TAG+="Wooting_One_Legacy"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess", TAG+="Wooting_Two_Legacy"
#---------------------------------------------------------------#
# Wooting Keyboards - DetectWootingTwoKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1100", TAG+="uaccess", TAG+="Wooting_One_Xbox"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1101", TAG+="uaccess", TAG+="Wooting_One_Classic"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1102", TAG+="uaccess", TAG+="Wooting_One_None"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1200", TAG+="uaccess", TAG+="Wooting_Two_Xbox"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1201", TAG+="uaccess", TAG+="Wooting_Two_Classic"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1202", TAG+="uaccess", TAG+="Wooting_Two_None"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1210", TAG+="uaccess", TAG+="Wooting_Two_LE_Xbox"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1211", TAG+="uaccess", TAG+="Wooting_Two_LE_Classic"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1212", TAG+="uaccess", TAG+="Wooting_Two_LE_None"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1220", TAG+="uaccess", TAG+="Wooting_Two_HE_Xbox"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1221", TAG+="uaccess", TAG+="Wooting_Two_HE_Classic"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1222", TAG+="uaccess", TAG+="Wooting_Two_HE_None"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1230", TAG+="uaccess", TAG+="Wooting_Two_HE_ARM_Xbox"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1231", TAG+="uaccess", TAG+="Wooting_Two_HE_ARM_Classic"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1232", TAG+="uaccess", TAG+="Wooting_Two_HE_ARM_None"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1300", TAG+="uaccess", TAG+="Wooting_Two_60HE_Xbox"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1301", TAG+="uaccess", TAG+="Wooting_Two_60HE_Classic"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1302", TAG+="uaccess", TAG+="Wooting_Two_60HE_None"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1310", TAG+="uaccess", TAG+="Wooting_Two_60HE_ARM_Xbox"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1311", TAG+="uaccess", TAG+="Wooting_Two_60HE_ARM_Classic"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1312", TAG+="uaccess", TAG+="Wooting_Two_60HE_ARM_None"
#---------------------------------------------------------------#
# ZET Edge Air Pro - DetectZETGAMINGEdgeAirProControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="25a7", ATTRS{idProduct}=="fa3f", TAG+="uaccess", TAG+="ZET_GAMING_Edge_Air_Pro_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="25a7", ATTRS{idProduct}=="fa40", TAG+="uaccess", TAG+="ZET_GAMING_Edge_Air_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="25a7", ATTRS{idProduct}=="fa48", TAG+="uaccess", TAG+="ZET_GAMING_Edge_Air_Elit_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="25a7", ATTRS{idProduct}=="fa49", TAG+="uaccess", TAG+="ZET_GAMING_Edge_Air_Elit"
#---------------------------------------------------------------#
# Zet Blade Optical - DetectZETBladeOptical
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2ea8", ATTRS{idProduct}=="2125", TAG+="uaccess", TAG+="ZET_Blade_Optical"
#---------------------------------------------------------------#
# Zalmna Z Sync - DetectZalmanZSyncControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1c57", ATTRS{idProduct}=="7ed0", TAG+="uaccess", TAG+="Zalman_Z_Sync"
      '';
  };
}