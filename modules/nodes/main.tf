resource "aws_instance" "ec2" {
  count = var.node_count

  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.node_instance_type
  subnet_id                   = var.node_subnet_id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh-key.key_name

  vpc_security_group_ids = [
    aws_security_group.ssh.id, aws_security_group.kube-api.id
  ]

  root_block_device {
    delete_on_termination = true
    volume_size           = var.node_disk_size
    volume_type           = "gp2"
  }

  depends_on = [aws_security_group.ssh]

  connection {
    type        = "ssh"
    user        = var.node_username
    private_key = file(var.node_ssh_privatekey)
    host        = self.public_dns
  }

  provisioner "file" {
    source      = "scripts/kube_install.sh"
    destination = "/tmp/kube_install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/kube_install.sh",
      "/tmp/kube_install.sh ${var.node_role} ${var.kube_version}",
    ]
  }

  lifecycle {
    ignore_changes = [iam_instance_profile]
  }

  tags = {
    Name = "${var.node_name}-${count.index}"
  }
}

output "node_ips" {
  value = aws_instance.ec2[*].public_ip
}