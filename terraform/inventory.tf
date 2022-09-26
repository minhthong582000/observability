/*
* Create Ansible Inventory File
*/
locals {
  inventory = templatefile(
    "${path.module}/templates/hosts.yaml",
    {
      for i in range(var.instances_count) :
      "instance" => {
        public_ip  = aws_instance.monitoring[i].public_ip
        private_ip = aws_instance.monitoring[i].private_ip
        roles      = (i == 0 ? "data,master" : "data,ingest")
      }...
    }
  )
}

resource "null_resource" "inventories" {
  provisioner "local-exec" {
    command = "echo '${local.inventory}' > ${path.module}/../ansible/inventories/hosts.yaml"
  }

  triggers = {
    template = local.inventory
  }
}
