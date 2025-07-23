{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs;[
    # Language Analysis
    # sbcl # required by emacs lsp vfork
    universal-ctags
    # 1
    # rustup install stable
    # rustup component add rust-analyzer
    # 2
    # config in editor： rust-analyzer path: /run/current-system/sw/bin/rust-analyzer
    rustc
    rustup
    rust-analyzer
    cargo
    go
    gopls
    python3
    pyenv
    python3Packages.pip
    (python3.withPackages (ps: [
      ps.python-lsp-server
    ]))
    uv
    nixd
    nodejs_22
    gcc
    cmake
    gnumake
    pkg-config
    zlib
    zlib.dev
  ];
}
