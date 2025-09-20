{ pkgs, ... }:

{
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;

    enableSshSupport = true;

    defaultCacheTtl = 14400;
    defaultCacheTtlSsh = 14400;
    maxCacheTtl = 86400;

    pinentry.package = pkgs.pinentry-tty;
  };
}
