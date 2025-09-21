{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs;[
    ((emacsPackagesFor emacs-unstable).emacsWithPackages
      (epkgs:(with epkgs;[
        vterm
        treesit-grammars.with-all-grammars # help tree-sitter and tree-sitter-langs works well
        #tree-sitter-langs
      ])))
  
  ];
  services.emacs = {
    enable = true;
    package = pkgs.emacs-unstable;
  };

  # replace default editor with emacs
  environment.variables.EDITOR = "emacs";
}