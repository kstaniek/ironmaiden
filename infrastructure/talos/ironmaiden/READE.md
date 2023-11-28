# How to start

```
talhelper gensecret > talsecret.sops.yaml
sops -e -i talsecret.sops.yaml
./generate-clusterconfig.sh

talosctl apply-config -n 172.31.30.11 -f ./clusterconfig/ironmaiden-metal1.home.staniek.name.yaml -i
talosctl apply-config -n 172.31.30.12 -f ./clusterconfig/ironmaiden-metal2.home.staniek.name.yaml -i
talosctl apply-config -n 172.31.30.13 -f ./clusterconfig/ironmaiden-metal3.home.staniek.name.yaml -i

talosctl bootstrap -n 172.31.30.11

talosctl kubeconfig -n 172.31.30.11
```

Wait for:

```
$ kubectl get nodes
NAME     STATUS     ROLES           AGE   VERSION
metal1   NotReady   control-plane   69s   v1.28.4
metal2   NotReady   control-plane   50s   v1.28.4
metal3   NotReady   control-plane   70s   v1.28.4
```

```
$ kubectl get pods -A
NAMESPACE     NAME                             READY   STATUS    RESTARTS       AGE
kube-system   coredns-78f679c54d-7pzgq         0/1     Pending   0               2m35s
kube-system   coredns-78f679c54d-dpcrl         0/1     Pending   0               2m35s
kube-system   kube-apiserver-metal1            1/1     Running   0               112s
kube-system   kube-apiserver-metal2            1/1     Running   0               110s
kube-system   kube-apiserver-metal3            1/1     Running   0               29s
kube-system   kube-controller-manager-metal1   1/1     Running   2 (2m50s ago)   88s
kube-system   kube-controller-manager-metal2   1/1     Running   0               99s
kube-system   kube-controller-manager-metal3   1/1     Running   2 (2m44s ago)   55s
kube-system   kube-scheduler-metal1            1/1     Running   2 (2m53s ago)   85s
kube-system   kube-scheduler-metal2            1/1     Running   0               92s
kube-system   kube-scheduler-metal3            1/1     Running   2 (2m46s ago)   67s
```

```
$ ./deploy-integrations.sh
serviceaccount/cilium created
serviceaccount/cilium-operator created
serviceaccount/hubble-relay created
serviceaccount/hubble-ui created
role.rbac.authorization.k8s.io/cilium-config-agent created
clusterrole.rbac.authorization.k8s.io/cilium created
clusterrole.rbac.authorization.k8s.io/cilium-operator created
clusterrole.rbac.authorization.k8s.io/hubble-ui created
rolebinding.rbac.authorization.k8s.io/cilium-config-agent created
clusterrolebinding.rbac.authorization.k8s.io/cilium created
clusterrolebinding.rbac.authorization.k8s.io/cilium-operator created
clusterrolebinding.rbac.authorization.k8s.io/hubble-ui created
configmap/cilium-config created
configmap/hubble-relay-config created
configmap/hubble-ui-nginx created
secret/cilium-ca created
secret/hubble-relay-client-certs created
secret/hubble-server-certs created
service/hubble-metrics created
service/hubble-peer created
service/hubble-relay created
service/hubble-ui created
deployment.apps/cilium-operator created
deployment.apps/hubble-relay created
deployment.apps/hubble-ui created
daemonset.apps/cilium created
namespace/system-controllers created
serviceaccount/kubelet-csr-approver created
clusterrole.rbac.authorization.k8s.io/kubelet-csr-approver created
clusterrolebinding.rbac.authorization.k8s.io/kubelet-csr-approver created
service/kubelet-csr-approver created
deployment.apps/kubelet-csr-approver created
pod/kubelet-csr-approver-test-connection created
```

# Reset talos

talosctl -n 172.31.30.11,172.31.30.12,172.31.30.13  reset --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --graceful=false --reboot
