.POSIX:
.PHONY: *

default: ansible

ansible:
	ansible-playbook -i inventories/ playbooks/monitoring.yaml \
		--extra-vars "admin_password=Test@123" \
		--extra-vars "kibanaserver_password=Test@6789" \
		--extra-vars "logstash_password=Test@1234"
