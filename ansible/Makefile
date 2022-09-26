.POSIX:
.PHONY: *

default: ansible

ansible:
	ansible-playbook -i inventories/ playbooks/monitoring.yaml --extra-vars "admin_password=Test@123 kibanaserver_password=Test@6789"
