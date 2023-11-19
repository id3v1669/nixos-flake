{ config, lib, pkgs, uservars, ... }:
{
  imports = [
(./. + "/checkbox-checked-symbolic.nix")
(./. + "/checkbox-mixed-symbolic.nix")
(./. + "/checkbox-unchecked-symbolic.nix")
(./. + "/check-symbolic@2.nix")
(./. + "/check-symbolic.nix")
(./. + "/cursor-handle-symbolic.nix")
(./. + "/dot-symbolic@2.nix")
(./. + "/dot-symbolic.nix")
(./. + "/line-symbolic@2.nix")
(./. + "/line-symbolic.nix")
(./. + "/radio-checked-symbolic.nix")
(./. + "/radio-mixed-symbolic.nix")
(./. + "/radio-unchecked-symbolic.nix")
(./. + "/scale-slider-symbolic.nix")
(./. + "/small-checkbox-checked-symbolic.nix")
(./. + "/small-checkbox-mixed-symbolic.nix")
(./. + "/small-checkbox-unchecked-symbolic.nix")
(./. + "/small-check-symbolic@2.nix")
(./. + "/small-check-symbolic.nix")
(./. + "/small-dot-symbolic@2.nix")
(./. + "/small-dot-symbolic.nix")
(./. + "/small-line-symbolic@2.nix")
(./. + "/small-line-symbolic.nix")
(./. + "/small-radio-checked-symbolic.nix")
(./. + "/small-radio-mixed-symbolic.nix")
(./. + "/small-radio-unchecked-symbolic.nix")
	];

home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-after-slider@2.png".source = ./. + "/scale-horz-marks-after-slider@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-after-slider-dark@2.png".source = ./. + "/scale-horz-marks-after-slider-dark@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-after-slider-dark.png".source = ./. + "/scale-horz-marks-after-slider-dark.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-after-slider-disabled@2.png".source = ./. + "/scale-horz-marks-after-slider-disabled@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-after-slider-disabled-dark@2.png".source = ./. + "/scale-horz-marks-after-slider-disabled-dark@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-after-slider-disabled-dark.png".source = ./. + "/scale-horz-marks-after-slider-disabled-dark.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-after-slider-disabled.png".source = ./. + "/scale-horz-marks-after-slider-disabled.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-after-slider.png".source = ./. + "/scale-horz-marks-after-slider.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-before-slider@2.png".source = ./. + "/scale-horz-marks-before-slider@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-before-slider-dark@2.png".source = ./. + "/scale-horz-marks-before-slider-dark@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-before-slider-dark.png".source = ./. + "/scale-horz-marks-before-slider-dark.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-before-slider-disabled@2.png".source = ./. + "/scale-horz-marks-before-slider-disabled@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-before-slider-disabled-dark@2.png".source = ./. + "/scale-horz-marks-before-slider-disabled-dark@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-before-slider-disabled-dark.png".source = ./. + "/scale-horz-marks-before-slider-disabled-dark.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-before-slider-disabled.png".source = ./. + "/scale-horz-marks-before-slider-disabled.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-horz-marks-before-slider.png".source = ./. + "/scale-horz-marks-before-slider.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-after-slider@2.png".source = ./. + "/scale-vert-marks-after-slider@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-after-slider-dark@2.png".source = ./. + "/scale-vert-marks-after-slider-dark@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-after-slider-dark.png".source = ./. + "/scale-vert-marks-after-slider-dark.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-after-slider-disabled@2.png".source = ./. + "/scale-vert-marks-after-slider-disabled@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-after-slider-disabled-dark@2.png".source = ./. + "/scale-vert-marks-after-slider-disabled-dark@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-after-slider-disabled-dark.png".source = ./. + "/scale-vert-marks-after-slider-disabled-dark.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-after-slider-disabled.png".source = ./. + "/scale-vert-marks-after-slider-disabled.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-after-slider.png".source = ./. + "/scale-vert-marks-after-slider.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-before-slider@2.png".source = ./. + "/scale-vert-marks-before-slider@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-before-slider-dark@2.png".source = ./. + "/scale-vert-marks-before-slider-dark@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-before-slider-dark.png".source = ./. + "/scale-vert-marks-before-slider-dark.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-before-slider-disabled@2.png".source = ./. + "/scale-vert-marks-before-slider-disabled@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-before-slider-disabled-dark@2.png".source = ./. + "/scale-vert-marks-before-slider-disabled-dark@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-before-slider-disabled-dark.png".source = ./. + "/scale-vert-marks-before-slider-disabled-dark.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-before-slider-disabled.png".source = ./. + "/scale-vert-marks-before-slider-disabled.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scale-vert-marks-before-slider.png".source = ./. + "/scale-vert-marks-before-slider.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/selectionmode-checkbox-checked@2.png".source = ./. + "/selectionmode-checkbox-checked@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/selectionmode-checkbox-checked-dark@2.png".source = ./. + "/selectionmode-checkbox-checked-dark@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/selectionmode-checkbox-checked-dark.png".source = ./. + "/selectionmode-checkbox-checked-dark.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/selectionmode-checkbox-checked.png".source = ./. + "/selectionmode-checkbox-checked.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/selectionmode-checkbox-unchecked@2.png".source = ./. + "/selectionmode-checkbox-unchecked@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/selectionmode-checkbox-unchecked-dark@2.png".source = ./. + "/selectionmode-checkbox-unchecked-dark@2.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/selectionmode-checkbox-unchecked-dark.png".source = ./. + "/selectionmode-checkbox-unchecked-dark.png";
home.file.".themes/dynamic-color-theme/gtk-3.0/assets/selectionmode-checkbox-unchecked.png".source = ./. + "/selectionmode-checkbox-unchecked.png";
}