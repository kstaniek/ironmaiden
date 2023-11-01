.POSIX:
.PHONY: *
.EXPORT_ALL_VARIABLES:

KUBECONFIG = $(shell pwd)/../../metal/kubeconfig.yaml
KUBE_CONFIG_PATH = $(KUBECONFIG)

default: integrations bootstrap

integrations:
	make -C ../integrations/
		
bootstrap:
	kubectl apply --server-side --kustomize ./bootstrap
	sops --decrypt ./bootstrap/age-key.sops.yaml | kubectl apply -f -
	kubectl apply -f ./flux/vars/cluster-settings.yaml
	
	kubectl apply --server-side --kustomize ./flux/config


