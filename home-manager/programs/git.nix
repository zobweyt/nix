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
    };

    signing = {
      key = "CB18F885C9B85085";
      signByDefault = true;
    };
  };
}
