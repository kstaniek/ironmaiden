.POSIX:

env ?= "prod"

default: pxe

~/.ssh/id_ed25519:
	ssh-keygen -t ed25519 -P '' -f "$@"

pxe: ~/.ssh/id_ed25519
	ansible-playbook \
		--inventory inventories/${env}.yml \
		pxe.yml	

dns: ~/.ssh/id_ed25519
	ansible-playbook \
		--inventory inventories/${env}.yml \
		dns.yml	

k3s:
	ansible-playbook \
		--inventory inventories/${env}.yml \
		k3s.yml

wol:
	ansible-playbook \
		--inventory inventories/${env}.yml \
		wol.yml

console:
	ansible-console \
		--inventory inventories/${env}.yml

k3s-uninstall:
	ansible-playbook \
	--inventory inventories/${env}.yml \
		k3s-uninstall.yml

post-install:
	ansible-playbook \
	--inventory inventories/${env}.yml \
		post-install.yml

storage:
	ansible-playbook \
	--inventory inventories/${env}.yml \
		storage.yml