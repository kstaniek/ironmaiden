#!/usr/bin/env bash

# Deploy the configuration to the nodes
talosctl apply-config -n 172.31.30.11 -f ./clusterconfig/ironmaiden-metal1.home.staniek.name.yaml
talosctl apply-config -n 172.31.30.12 -f ./clusterconfig/ironmaiden-metal2.home.staniek.name.yaml
talosctl apply-config -n 172.31.30.13 -f ./clusterconfig/ironmaiden-metal3.home.staniek.name.yaml
