{
	disko.devices.disk.main = {
		type = "disk";
		device = "/dev/disk/by-id/nvme-WD_Blue_SN580_2TB_2451DE406975";
		content = {
			type = "gpt";
			partitions = {
				ESP = {
					priority = 1;
					size = "1G";
					type = "EF00";
					content = {
						type = "filesystem";
						format = "vfat";
						mountpoint = "/boot";
						mountOptions = [ "umask=0077" ];
					};
				};
				swap = {
					priority = 2;
					size = "16G";
					content = {
						type = "swap";
					};
				};
				root = {
					priority = 3;
					size = "100%";
					content = {
						type = "btrfs";
						extraArgs = [ "-L" "nixos" "-f" ];
						subvolumes = {
							"/root" = {
								mountpoint = "/";
								mountOptions = [ "compress=zstd:3" "noatime" ];
							};
							"/home" = {
								mountpoint = "/home";
								mountOptions = [ "compress=zstd:3" "noatime" ];
							};
							"/nix" = {
								mountpoint = "/nix";
								mountOptions = [ "compress=zstd:3" "noatime" ];
							};
							"/games" = {
								mountpoint = "/games";
								mountOptions = [ "compress=zstd:3" "noatime" ];
							};
							"/music" = {
								mountpoint = "/music";
								mountOptions = [ "compress=zstd:3" "noatime" ];
							};

						};
					};
				};
			};
		};
	};
}
