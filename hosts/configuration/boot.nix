{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, winvar, ...}: 
{
  boot = {
    loader = {
      timeout = 15;     
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
      }// lib.optionalAttrs (winvar == true && uservars.description == "id3v1669") {
        extraFiles = {
          "efi/Microsoft/Boot/bootmgfw.efi" = "${config.home.homeDirectory}/.winloader/Boot/bootmgfw.efi";
          "efi/Microsoft/Boot/bootmgr.efi" = "${config.home.homeDirectory}/.winloader/Boot/bootmgr.efi";
          "efi/Microsoft/Boot/memtest.efi" = "${config.home.homeDirectory}/.winloader/Boot/memtest.efi";
          "efi/Microsoft/Boot/BCD" = "${config.home.homeDirectory}/.winloader/Boot/BCD";
          "efi/Microsoft/Boot/BCD.LOG" = "${config.home.homeDirectory}/.winloader/Boot/BCD.LOG";
          "efi/Microsoft/Boot/BCD.LOG1" = "${config.home.homeDirectory}/.winloader/Boot/BCD.LOG1";
          "efi/Microsoft/Boot/BCD.LOG2" = "${config.home.homeDirectory}/.winloader/Boot/BCD.LOG2";
          "efi/Microsoft/Boot/boot.stl" = "${config.home.homeDirectory}/.winloader/Boot/boot.stl";
          "efi/Microsoft/Boot/BOOTSTAT.DAT" = "${config.home.homeDirectory}/.winloader/Boot/BOOTSTAT.DAT";
          "efi/Microsoft/Boot/kd_02_10df.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_10df.dll";
          "efi/Microsoft/Boot/kd_02_10ec.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_10ec.dll";
          "efi/Microsoft/Boot/kd_02_1137.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_1137.dll";
          "efi/Microsoft/Boot/kd_02_14e4.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_14e4.dll";
          "efi/Microsoft/Boot/kd_02_15b3.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_15b3.dll";
          "efi/Microsoft/Boot/kd_02_1969.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_1969.dll";
          "efi/Microsoft/Boot/kd_02_19a2.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_19a2.dll";
          "efi/Microsoft/Boot/kd_02_1af4.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_1af4.dll";
          "efi/Microsoft/Boot/kd_02_8086.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_8086.dll";
          "efi/Microsoft/Boot/kd_07_1415.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_07_1415.dll";
          "efi/Microsoft/Boot/kd_0C_8086.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_0C_8086.dll";
          "efi/Microsoft/Boot/kdstub.dll" = "${config.home.homeDirectory}/.winloader/Boot/kdstub.dll";
          "efi/Microsoft/Boot/kdnet_uart16550.dll" = "${config.home.homeDirectory}/.winloader/Boot/kdnet_uart16550.dll";
          "efi/Microsoft/Boot/winsipolicy.p7b" = "${config.home.homeDirectory}/.winloader/Boot/winsipolicy.p7b";
          "efi/Microsoft/Boot/en-US/bootmgr.efi.mui" = "${config.home.homeDirectory}/.winloader/Boot/en-US/bootmgr.efi.mui";
          "efi/Microsoft/Boot/en-US/bootmgfw.efi.mui" = "${config.home.homeDirectory}/.winloader/Boot/en-US/bootmgfw.efi.mui";
          "efi/Microsoft/Boot/en-US/memtest.efi.mui" = "${config.home.homeDirectory}/.winloader/Boot/en-US/memtest.efi.mui";
          "efi/Microsoft/Boot/Resources/bootres.dll" = "${config.home.homeDirectory}/.winloader/Boot/Resources/bootres.dll";
          "efi/Microsoft/Boot/Resources/en-US/bootres.dll.mui" = "${config.home.homeDirectory}/.winloader/Boot/Resources/en-US/bootres.dll.mui";
        };
      } // lib.optionalAttrs (winvar == true && uservars.description == "alexp") {
        extraFiles = {
          "efi/Microsoft/Boot/bootmgfw.efi" = "${config.home.homeDirectory}/.winloader/Boot/bootmgfw.efi";
          "efi/Microsoft/Boot/bootmgr.efi" = "${config.home.homeDirectory}/.winloader/Boot/bootmgr.efi";
          "efi/Microsoft/Boot/memtest.efi" = "${config.home.homeDirectory}/.winloader/Boot/memtest.efi";
          "efi/Microsoft/Boot/BCD" = "${config.home.homeDirectory}/.winloader/Boot/BCD";
          "efi/Microsoft/Boot/BCD.LOG" = "${config.home.homeDirectory}/.winloader/Boot/BCD.LOG";
          "efi/Microsoft/Boot/BCD.LOG1" = "${config.home.homeDirectory}/.winloader/Boot/BCD.LOG1";
          "efi/Microsoft/Boot/BCD.LOG2" = "${config.home.homeDirectory}/.winloader/Boot/BCD.LOG2";
          "efi/Microsoft/Boot/boot.stl" = "${config.home.homeDirectory}/.winloader/Boot/boot.stl";
          "efi/Microsoft/Boot/BOOTSTAT.DAT" = "${config.home.homeDirectory}/.winloader/Boot/BOOTSTAT.DAT";
          "efi/Microsoft/Boot/kd_02_10df.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_10df.dll";
          "efi/Microsoft/Boot/kd_02_10ec.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_10ec.dll";
          "efi/Microsoft/Boot/kd_02_1137.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_1137.dll";
          "efi/Microsoft/Boot/kd_02_14e4.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_14e4.dll";
          "efi/Microsoft/Boot/kd_02_15b3.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_15b3.dll";
          "efi/Microsoft/Boot/kd_02_1969.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_1969.dll";
          "efi/Microsoft/Boot/kd_02_19a2.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_19a2.dll";
          "efi/Microsoft/Boot/kd_02_1af4.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_1af4.dll";
          "efi/Microsoft/Boot/kd_02_8086.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_02_8086.dll";
          "efi/Microsoft/Boot/kd_07_1415.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_07_1415.dll";
          "efi/Microsoft/Boot/kd_0C_8086.dll" = "${config.home.homeDirectory}/.winloader/Boot/kd_0C_8086.dll";
          "efi/Microsoft/Boot/kdstub.dll" = "${config.home.homeDirectory}/.winloader/Boot/kdstub.dll";
          "efi/Microsoft/Boot/kdnet_uart16550.dll" = "${config.home.homeDirectory}/.winloader/Boot/kdnet_uart16550.dll";
          "efi/Microsoft/Boot/winsipolicy.p7b" = "${config.home.homeDirectory}/.winloader/Boot/winsipolicy.p7b";
          "efi/Microsoft/Boot/en-US/bootmgr.efi.mui" = "${config.home.homeDirectory}/.winloader/Boot/en-US/bootmgr.efi.mui";
          "efi/Microsoft/Boot/en-US/bootmgfw.efi.mui" = "${config.home.homeDirectory}/.winloader/Boot/en-US/bootmgfw.efi.mui";
          "efi/Microsoft/Boot/en-US/memtest.efi.mui" = "${config.home.homeDirectory}/.winloader/Boot/en-US/memtest.efi.mui";
          "efi/Microsoft/Boot/Resources/bootres.dll" = "${config.home.homeDirectory}/.winloader/Boot/Resources/bootres.dll";
          "efi/Microsoft/Boot/Resources/en-US/bootres.dll.mui" = "${config.home.homeDirectory}/.winloader/Boot/Resources/en-US/bootres.dll.mui";
          "efi/Microsoft/Boot/Resources/ru-RU/bootres.dll.mui" = "${config.home.homeDirectory}/.winloader/Boot/Resources/ru-RU/bootres.dll.mui";

        };
      };
    };
  };
}