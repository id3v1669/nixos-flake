{lib, config, pkgs, curversion, deflocale, uservars, hostname, envir, cpuvar, winvar, ...}: 
{
  boot = {
    loader = {
      timeout = 15;     
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        
        #extraEntries = { 
        #  "shindovs.conf" = ''
        #    title shindovs
        #    efi /EFI/Microsoft/Boot/bootmgfw.efi
        #  ''; 
        #};
        #configurationLimit = 10; #disabled for now due to unfinished dotfiles
      }// lib.optionalAttrs (winvar == true) {
        #extraEntries = { 
        # "shindovs.conf" = ''
        #   title shindovs
        #   efi /EFI/Microsoft/Boot/bootmgfw.efi
        # ''; 
        #};
        extraFiles = {
          "efi/Microsoft/Boot/bootmgfw.efi" = "/home/${uservars.name}/.winloader/Boot/bootmgfw.efi";
          "efi/Microsoft/Boot/bootmgr.efi" = "/home/${uservars.name}/.winloader/Boot/bootmgr.efi";
          "efi/Microsoft/Boot/memtest.efi" = "/home/${uservars.name}/.winloader/Boot/memtest.efi";
          "efi/Microsoft/Boot/BCD" = "/home/${uservars.name}/.winloader/Boot/BCD";
          "efi/Microsoft/Boot/BCD.LOG" = "/home/${uservars.name}/.winloader/Boot/BCD.LOG";
          "efi/Microsoft/Boot/BCD.LOG1" = "/home/${uservars.name}/.winloader/Boot/BCD.LOG1";
          "efi/Microsoft/Boot/BCD.LOG2" = "/home/${uservars.name}/.winloader/Boot/BCD.LOG2";
          "efi/Microsoft/Boot/boot.stl" = "/home/${uservars.name}/.winloader/Boot/boot.stl";
          "efi/Microsoft/Boot/BOOTSTAT.DAT" = "/home/${uservars.name}/.winloader/Boot/BOOTSTAT.DAT";
          "efi/Microsoft/Boot/kd_02_10df.dll" = "/home/${uservars.name}/.winloader/Boot/kd_02_10df.dll";
          "efi/Microsoft/Boot/kd_02_10ec.dll" = "/home/${uservars.name}/.winloader/Boot/kd_02_10ec.dll";
          "efi/Microsoft/Boot/kd_02_1137.dll" = "/home/${uservars.name}/.winloader/Boot/kd_02_1137.dll";
          "efi/Microsoft/Boot/kd_02_14e4.dll" = "/home/${uservars.name}/.winloader/Boot/kd_02_14e4.dll";
          "efi/Microsoft/Boot/kd_02_15b3.dll" = "/home/${uservars.name}/.winloader/Boot/kd_02_15b3.dll";
          "efi/Microsoft/Boot/kd_02_1969.dll" = "/home/${uservars.name}/.winloader/Boot/kd_02_1969.dll";
          "efi/Microsoft/Boot/kd_02_19a2.dll" = "/home/${uservars.name}/.winloader/Boot/kd_02_19a2.dll";
          "efi/Microsoft/Boot/kd_02_1af4.dll" = "/home/${uservars.name}/.winloader/Boot/kd_02_1af4.dll";
          "efi/Microsoft/Boot/kd_02_8086.dll" = "/home/${uservars.name}/.winloader/Boot/kd_02_8086.dll";
          "efi/Microsoft/Boot/kd_07_1415.dll" = "/home/${uservars.name}/.winloader/Boot/kd_07_1415.dll";
          "efi/Microsoft/Boot/kd_0C_8086.dll" = "/home/${uservars.name}/.winloader/Boot/kd_0C_8086.dll";
          "efi/Microsoft/Boot/kdstub.dll" = "/home/${uservars.name}/.winloader/Boot/kdstub.dll";
          "efi/Microsoft/Boot/kdnet_uart16550.dll" = "/home/${uservars.name}/.winloader/Boot/kdnet_uart16550.dll";
          "efi/Microsoft/Boot/winsipolicy.p7b" = "/home/${uservars.name}/.winloader/Boot/winsipolicy.p7b";
          "efi/Microsoft/Boot/en-US/bootmgr.efi.mui" = "/home/${uservars.name}/.winloader/Boot/en-US/bootmgr.efi.mui";
          "efi/Microsoft/Boot/en-US/bootmgfw.efi.mui" = "/home/${uservars.name}/.winloader/Boot/en-US/bootmgfw.efi.mui";
          "efi/Microsoft/Boot/en-US/memtest.efi.mui" = "/home/${uservars.name}/.winloader/Boot/en-US/memtest.efi.mui";
          "efi/Microsoft/Boot/Resources/bootres.dll" = "/home/${uservars.name}/.winloader/Boot/Resources/bootres.dll";
          "efi/Microsoft/Boot/Resources/en-US/bootres.dll.mui" = "/home/${uservars.name}/.winloader/Boot/Resources/en-US/bootres.dll.mui";
        };
      };
    };
  };
}