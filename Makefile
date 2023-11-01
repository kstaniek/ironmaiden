.POSIX:
.PHONY: *
.EXPORT_ALL_VARIABLES:

KUBECONFIG = $(shell pwd)/metal/kubeconfig.yaml
KUBE_CONFIG_PATH = $(KUBECONFIG)


default: metal 

	
metal:
	make -C metal

bootstrap:
	make -C bootstrap

external:
	make -C external

post-install:
	@./scripts/hacks

tools:
	@docker run \
		--rm \
		--interactive \
		--tty \
		--network host \
		--env "KUBECONFIG=${KUBECONFIG}" \
		--volume "/var/run/docker.sock:/var/run/docker.sock" \
		--volume $(shell pwd):$(shell pwd) \
		--volume ${HOME}/.ssh:/root/.ssh \
		--volume ${HOME}/.terraform.d:/root/.terraform.d \
		--volume homelab-tools-cache:/root/.cache \
		--volume homelab-tools-nix:/nix \
		--workdir $(shell pwd) \
		nixos/nix nix-shell

reconsile:
	flux -n flux-system reconcile source git flux-cluster
	flux -n flux-system reconcile kustomization flux-cluster
	flux -n flux-system reconcile kustomization config
	flux -n flux-system reconcile kustomization core
	flux -n flux-system reconcile kustomization apps


clean:
	docker compose --project-directory ./metal/roles/pxe_server/files down