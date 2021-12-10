terraform {
  required_version = ">= 0.12" # colocando compatibilidade do terraform para 0.12
}

resource "aws_instance" "web" {
  ami           = "ami-0e66f5495b4efdd0f"
  subnet_id                   = "subnet-091d8530ca8d35a20"
  instance_type               = var.tipo
  key_name                    = "keypair-turma3-ze-dev"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-0c493a481025a9028"]
  root_block_device {
    encrypted   = true
    volume_size = 8
  }
  tags = {
    Name = "${var.nome}",
    Itau = true
  }
}