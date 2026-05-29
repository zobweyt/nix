{ ... }:

{
  programs.git = {
    enable = true;

    ignores = [
      ".DS_Store"
    ];

    userName = "Nikita Gaziev";
    userEmail = "zobweyt@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    };

    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
  };

  home.file.".ssh/allowed_signers".text = ''
    zobweyt@gmail.com namespaces="git" ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC7c4jvXf5V05jJikWdqwu898TWW9/uRnPnU3FGhoygF
  '';
}
