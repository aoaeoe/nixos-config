{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "evims";
    userEmail = "3657@email.cn";
#     extraConfig = {
#       core = { pager = "delta"; };
#       interactive = { diffFilter = "delta --color-only"; };
#       delta = { navigate = true; };
#       merge = { conflictstyle = "diff3"; };
#       diff = { colorMoved = "default"; };
#       init = { defaultBranch = "main"; };
#     };
  };

}
