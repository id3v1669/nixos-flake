{lib, config, pkgs, bootloader, ...}: 
let
  mb = "/boot";
  ocp = "${pkgs.over-opencore}/ocpkg/X64/EFI/OC";
  ocb = "${pkgs.over-opencore}/ocbinaryData";
in
{
  boot.loader = {
    grub.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = mb;
    };
    systemd-boot = {
      enable = true;
			configurationLimit = 20;
			extraFiles = {
      } // lib.optionalAttrs (bootloader.defconf) {
				"EFI/OC/OpenCore.efi" = "${ocp}/OpenCore.efi";
				"EFI/OC/Drivers/OpenRuntime.efi" = "${ocp}/Drivers/OpenRuntime.efi";
				"EFI/OC/Drivers/OpenCanopy.efi" = "${ocp}/Drivers/OpenCanopy.efi";
				"EFI/OC/Drivers/OpenHfsPlus.efi" = "${ocp}/Drivers/OpenHfsPlus.efi";
				"EFI/OC/Drivers/OpenLinuxBoot.efi" = "${ocp}/Drivers/OpenLinuxBoot.efi";
				"EFI/OC/Drivers/AudioDxe.efi" = "${ocp}/Drivers/AudioDxe.efi";
				"EFI/OC/Drivers/ext4_x64.efi" = "${ocb}/Drivers/ext4_x64.efi";
				"EFI/OC/Drivers/btrfs_x64.efi" = "${ocb}/Drivers/btrfs_x64.efi";
				"EFI/OC/Tools/OpenShell.efi" = "${ocp}/Tools/OpenShell.efi";
				"EFI/OC/Tools/CleanNvram.efi" = "${ocp}/Tools/CleanNvram.efi";
				"EFI/OC/config.plist" = ./config.plist;
			};
			##${pkgs.toybox}/bin/rm -rf ${mb}/EFI/systemd
      extraInstallCommands = if bootloader.defconf then ''
${pkgs.toybox}/bin/mkdir -p ${mb}/EFI/OC/Resources
${pkgs.toybox}/bin/mkdir -p ${mb}/EFI/OC/ACPI
${pkgs.toybox}/bin/mkdir -p ${mb}/EFI/OC/Kexts
${pkgs.toybox}/bin/cp -r ${ocb}/Resources/* ${mb}/EFI/OC/Resources
			'' 
			else let
	      ocpc = "${pkgs.callPackage ./../../overlays/ocpc.nix {}}/ocpc/EFI/OC";
      in ''
${pkgs.toybox}/bin/mkdir -p ${mb}/EFI/OC
${pkgs.toybox}/bin/cp -r ${ocpc}/* ${mb}/EFI/OC/
			'';
    };
  };
}