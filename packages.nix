{ config, pkgs, lib, inputs, ... }:

{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    programs.dconf.enable = true;

    programs.nix-ld = {
        enable = true;

        libraries = with pkgs; [
            zlib zstd stdenv.cc.cc curl openssl attr libssh bzip2 libxml2 acl libsodium util-linux xz systemd
        ];
    };

    programs.virt-manager.enable = true;
    virtualisation.libvirtd = {
        enable = true;
        qemu = {
            package = pkgs.qemu;
            swtpm.enable = true;
        };
    };
    users.groups.libvirtd.members = ["sysfab"];
    virtualisation.spiceUSBRedirection.enable = true;

    environment.systemPackages = with pkgs; [
        wget
        curl
        git
        htop
        python3
        zip
        ntfs3g
        pulseaudio
        virtiofsd
    ];

    programs.bash.enable = true;
}