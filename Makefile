.POSIX:
.PHONY: *

default: terraform ansible

ansible:
	make -C ansible

terraform:
	make -C terraform

clean:
	rm -rf /tmp/opensearch-nodecerts
	make -C terraform clean
