# This file is controlled by /etc/dotfiles/README.org
{ config, pkgs, inputs, ... }:

{
  time.timeZone = "America/Toronto";

  networking.hostName = "acernitro";
  networking.firewall.enable = false;
  networking.wireless.enable = true;
  networking.wireless.userControlled.enable = true;
  networking.useDHCP = false;
  networking.interfaces.enp6s0f1.useDHCP = true;
  networking.interfaces.wlp0s20f3.useDHCP = true;

  networking.wireless.networks = {
    MyWiFi_5C1870 = {
      priority = 3;
      pskRaw = "409b3c85fef1c5737f284d2f82f20dc6023e41804e862d4fa26265ef8193b326";
    };
    BELL182 = {
      priority = 2;
      pskRaw = "8b3c114c695c5013bbcf5fc0af781c7872f95c34e2cceb31afa7bfc1adf66245";
    };
    SM-G975W3034 = {
      priority = 1;
      pskRaw = "74835d96a98ca2c56ffe4eaf92223f8a555168b59ec2bb22b1e46b2a333adc80";
    };
  };
  networking.hosts = {
    "192.168.3.105" = [ "gamingpc" ];
    "192.168.3.163" = [ "acernitro" ];
    "192.168.3.182" = [ "raspberry" ];
    "192.168.3.183" = [ "homecloud" ];
  };
  users.users.chris.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO4wka/LfG3pto15DIm9LIRbb6rWr7/ipCRiCdAKSlY4 chris@chrishayward.xyz"
  ];

  services.tlp.enable = true;
  services.xserver.dpi = 96;
  services.xserver.libinput.touchpad.tapping = false;
  services.printing.enable = true;

  programs.mtr.enable = true;
  programs.fish.enable = true;
  programs.gnupg.agent.enable = true;

  users.users.chris = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
