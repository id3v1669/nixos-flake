{lib, config, pkgs, ...}: 
let
  curversion = "23.05";
  uname = "user";
in
{
  nixpkgs.config.allowUnfree = true;
  security.rtkit.enable = true;
  time.timeZone = "Australia/Perth";
  i18n.defaultLocale = "en_AU.UTF-8";
  sound.enable = true;
  networking.networkmanager.enable = true;
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };
  programs = {
    adb.enable = true;
    fish.enable = true;
  };
  services = {
    blueman.enable = true;
    printing.enable = true;
    flatpak.enable = true;
    xserver = {
      enable = true;
      layout = "us,ru";
      xkbVariant = ",";
      xkbOptions = "grp:win_space_toggle";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = true;
    };
  };
  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };
  users.users."${uname}" = {
    isNormalUser = true;
    description = "id3v1669";
    extraGroups = [ "rustdesk" "adbusers" "networkmanager" "wheel" "kvm" "input" "disk" "libvirtd" "video" "docker" ];
    shell = pkgs.fish;
  };
  fonts.packages  = with pkgs; [
    terminus-nerdfont
    noto-fonts
    nerdfonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];
  nix = {
    settings = {
      experimental-features = [ "flakes" "nix-command" ];
    #  auto-optimise-store = true;
    };
    #gc = {
    #  automatic = true;
    #  dates = "weekly";
    #  options = "--delete-older-than 7d";
    #};
  };
  environment = {
    systemPackages = with pkgs; [
      fish
    ];
    etc = {
	    "wireplumber/bose.lua".text = ''
local function set_default_sink_and_remove_hsp_hfp()
    local banned_profiles = {
        ["Headset Head Unit (HSP/HFP)"] = true,
        ["Headset Head Unit (HSP/HFP, codec mSBC)"] = true,
        ["Headset Head Unit (HSP/HFP, codec CVSD)"] = true,
        ["High Fidelity Playback (A2DP Sink)"] = true
        -- add as many as you need
    }
    for id, node in pairs(nodes_om:enumerate()) do
        -- For setting the default sink
        if node["media.class"] == "Audio/Sink" and node["device.name"] == "bluez_card.AC_BF_7>
            node:send("SESSION_NODE_UPDATE", "u", wp.WP_SESSION_NODE_UPDATE_FLAG_PRIORITY, "i>
        end
        if banned_profiles[node["device.profile.description"]] then
            node:send("DEVICE_PROFILE_UPDATE", "u", wp.WP_DEVICE_PROFILE_UPDATE_FLAG_AVAILABI>
        end
    end
end
	    '';
    };
  };
  system.stateVersion = "${curversion}";
}