{ pkgs
, config
, lib
, uservars
, inputs
, ...
}:
let 
  eww = "${lib.getExe pkgs.eww}";
	dependencies = with pkgs; [
		coreutils
	];
in
{
	
  imports = [
    ./scss.nix
    ./yuck.nix
		inputs.eww.homeManagerModules.default
  ];
	programs.eww.enable = true;
	#programs.eww.configDir = ./../eww;
  # systemd.user.services.eww-daemon = {
	# 	Unit = {
  #     Description = "eww daemon service";
  #  	  After = ["graphical-session-pre.target"];
  #     PartOf = ["graphical-session.target"];
  #   };
	# 	Service = {
	# 		Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
	# 		ExecStart = "${eww} daemon --no-daemonize";
	# 		ExecReload = "${eww} reload";
	# 		Restart = "on-failure";
	# 	};
	# 	Install = { WantedBy = ["graphical-session.target"]; };
  # };
  # systemd.user.services.eww-bar = {
	# 	Unit = {
  #     Description = "eww bar launcher service";
  #  	  After = [ "graphical-session-pre.target" "eww-daemon.service" ];
  #     PartOf = [ "graphical-session.target" ];
	# 		BindsTo = "eww-daemon.service";
  #   };
	# 	Service = {
	# 		Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
  #     Type = "oneshot";
	# 		ExecStart = "${eww} open-many popup-power-window calendar-popup-window bar";
	# 		RemainAfterExit = true;
	# 	};
	# 	Install = { WantedBy = ["graphical-session.target"]; };
  # };
  # systemd.user.services.eww-volume = {
  #   Unit = {
  #     Description = "eww volume updater service";
	# 		After = [ "graphical-session-pre.target" "eww-daemon.service" ];
  #     PartOf = [ "graphical-session.target" ];
	# 		BindsTo = "eww-daemon.service";
  #   };
	# 	Service = {
	# 		Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
	# 		ExecStart = "${pkgs.bash}/bin/bash ${config.home.homeDirectory}/.scripts/eww_volume.sh";
	# 		Restart = "on-failure";
	# 	};
	# 	Install = { WantedBy = ["graphical-session.target"]; };
  # };
  # systemd.user.services.eww-ws = {
  #   Unit = {
  #     Description = "eww workspace updater service";
  #  	  After = [ "graphical-session-pre.target" "eww-daemon.service" ];
  #     PartOf = [ "graphical-session.target" ];
	# 		BindsTo = "eww-daemon.service";
  #   };
	# 	Service = {
	# 		Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
	# 		ExecStart = "${pkgs.bash}/bin/bash ${config.home.homeDirectory}/.scripts/eww_ws.sh";
	# 		Restart = "on-failure";
	# 	};
	# 	Install = { WantedBy = ["graphical-session.target"]; };
  # };
  # systemd.user.services.eww-lang = {
  #   Unit = {
  #     Description = "eww language updater service";
  #  	  After = [ "graphical-session-pre.target" "eww-daemon.service" ];
  #     PartOf = [ "graphical-session.target" ];
	# 		BindsTo = "eww-daemon.service";
  #   };
	# 	Service = {
	# 		Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
	# 		ExecStart = "${pkgs.bash}/bin/bash ${config.home.homeDirectory}/.scripts/eww_lang.sh";
	# 		Restart = "on-failure";
	# 	};
	# 	Install = { WantedBy = ["graphical-session.target"]; };
  # };
  # systemd.user.services.eww-songname = {
  #   Unit = {
  #     Description = "eww songname updater service";
  #  	  After = [ "graphical-session-pre.target" "eww-daemon.service" ];
  #     PartOf = [ "graphical-session.target" ];
	# 		BindsTo = "eww-daemon.service";
  #   };
	# 	Service = {
	# 		Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
	# 		ExecStart = "${pkgs.bash}/bin/bash ${config.home.homeDirectory}/.scripts/eww_songname.sh";
	# 		Restart = "on-failure";
	# 	};
	# 	Install = { WantedBy = ["graphical-session.target"]; };
  # };
}
