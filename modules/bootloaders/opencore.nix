{ lib
, pkgs
, bootloader
, hostname
, ...
}: 
let
  mb = "/boot";
  ocp = "${pkgs.over-opencore}/ocpkg/X64/EFI";
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
			graceful = true;
			extraFiles = {
      } // lib.optionalAttrs (bootloader.defconf) {
				"EFI/OC/OpenCore.efi" = "${ocp}/OC/OpenCore.efi";
				"EFI/OC/Drivers/OpenRuntime.efi" = "${ocp}/OC/Drivers/OpenRuntime.efi";
				"EFI/OC/Drivers/OpenCanopy.efi" = "${ocp}/OC/Drivers/OpenCanopy.efi";
				"EFI/OC/Drivers/OpenHfsPlus.efi" = "${ocp}/OC/Drivers/OpenHfsPlus.efi";
				"EFI/OC/Drivers/OpenLinuxBoot.efi" = "${ocp}/OC/Drivers/OpenLinuxBoot.efi";
				"EFI/OC/Drivers/AudioDxe.efi" = "${ocp}/OC/Drivers/AudioDxe.efi";
				"EFI/OC/Drivers/ext4_x64.efi" = "${ocb}/Drivers/ext4_x64.efi";
				"EFI/OC/Drivers/btrfs_x64.efi" = "${ocb}/Drivers/btrfs_x64.efi";
				"EFI/OC/Tools/OpenShell.efi" = "${ocp}/OC/Tools/OpenShell.efi";
				"EFI/OC/Tools/CleanNvram.efi" = "${ocp}/OC/Tools/CleanNvram.efi";
				"EFI/OC/config.plist" = ./config.plist;
			};
      extraInstallCommands = if bootloader.defconf then ''
${pkgs.toybox}/bin/rm -rf ${mb}/EFI/BOOT/*
${pkgs.toybox}/bin/cp ${ocp}/BOOT/* ${mb}/EFI/BOOT/
${pkgs.toybox}/bin/mkdir -p ${mb}/EFI/OC/Resources
${pkgs.toybox}/bin/mkdir -p ${mb}/EFI/OC/ACPI
${pkgs.toybox}/bin/mkdir -p ${mb}/EFI/OC/Kexts
${pkgs.toybox}/bin/cp -r ${ocb}/Resources/* ${mb}/EFI/OC/Resources
			'' 
			else let
	      ocpc = "${pkgs.callPackage ./../../hosts/${hostname}/ocpc.nix {}}/ocpc/EFI";
      in ''
${pkgs.toybox}/bin/mkdir -p ${mb}/EFI/OC
${pkgs.toybox}/bin/rm -rf ${mb}/EFI/BOOT/*
${pkgs.toybox}/bin/cp ${ocpc}/BOOT/* ${mb}/EFI/BOOT/
${pkgs.toybox}/bin/cp -r ${ocpc}/OC/* ${mb}/EFI/OC/
			'';
    };
  };
}