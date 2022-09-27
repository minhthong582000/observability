.POSIX:
.PHONY: *

default: terraform wait_for_instances_startup ansible

ansible:
	make -C ansible

terraform:
	make -C terraform

wait_for_instances_startup:
	sleep 10

clean:
	rm -rf /tmp/opensearch-nodecerts
	make -C terraform clean
