# https://status.nixos.org (nixos-22.11)
{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.05.tar.gz") {} }:

let
  python-packages = pkgs.python3.withPackages (p: with p; [
    jinja2
    kubernetes
    mkdocs-material
    netaddr
    rich
  ]);
in
pkgs.mkShell {
  shellHook = ''
    alias k=kubectl
    alias vi=nvim
    eval "$(direnv hook bash)"
    export EDITOR=nvim
  '';

  buildInputs = with pkgs; [
    zsh
    ansible
    ansible-lint
    bmake
    diffutils
    docker
    docker-compose_1 # TODO upgrade to version 2
    git
    go
    gotestsum
    iproute2
    jq
    k9s
    kube3d
    kubectl
    kubernetes-helm
    kustomize
    libisoburn
    neovim
    openssh
    p7zip
    pre-commit
    shellcheck
    terraform
    yamllint
    argocd
    curl
    sops
    age
    direnv
    fluxcd
    cilium-cli
    envsubst
    go-task

    python-packages
  ];
}

