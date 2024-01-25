{ ... }: {
  imports = [
    ../common.nix
  ];
  
	# Suspend to RAM
	boot.kernelParams = [
		"mem_sleep_default=s2idle"
	];

	# Networking
	networking = {
		hostName = "cwm-nixos";
		networkmanager.enable = true;
	};
 
	# Nvidia setup
	hardware.nvidia = {
		modesetting.enable = true;
		open = false;
		nvidiaSettings = true;
	};
}
