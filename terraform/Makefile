.POSIX:
.PHONY: *

default: terraform

terraform:
	terraform init
	terraform apply --auto-approve

clean:
	terraform destroy --auto-approve
