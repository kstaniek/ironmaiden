.POSIX:

env ?= "prod"

install-sops:
	ansible-playbook \
		--inventory inventories/${env}.yaml \
		playbooks/install_sops.yaml	

dns:
	ansible-playbook \
		--inventory inventories/${env}.yaml \
		playbooks/dns.yaml	


dhcp:
	ansible-playbook \
		--inventory inventories/${env}.yaml \
		playbooks/dhcp.yaml	

kea:
	ansible-playbook \
		--inventory inventories/${env}.yaml \
		playbooks/kea.yaml	

timesyncd:
	ansible-playbook \
		--inventory inventories/${env}.yaml \
		playbooks/timesyncd.yaml	

minio:
	ansible-playbook \
		--inventory inventories/${env}.yaml \
		playbooks/minio.yaml

