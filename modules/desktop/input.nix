{ config, lib, pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      (fcitx5-rime.override {
#         librime = (pkgs.librime.overrideAttrs (oldAttrs: {
#           buildInputs = oldAttrs.buildInputs ++ [ pkgs.luajit ];
#         })).override{
#           plugins = [ librime-lua ];
#         };
        rimeDataPkgs = with pkgs.nur.repos.linyinfeng.rimePackages;
          withRimeDeps [
            rime-ice
          ];
      })
      fcitx5-chinese-addons
      fcitx5-table-extra

    ];
  };
}
