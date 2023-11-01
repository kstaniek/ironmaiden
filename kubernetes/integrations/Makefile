.POSIX:
.PHONY: *
.EXPORT_ALL_VARIABLES:

KUBECONFIG = $(shell pwd)/../../metal/kubeconfig.yaml
KUBE_CONFIG_PATH = $(KUBECONFIG)

default:
	./deploy-integrations.sh