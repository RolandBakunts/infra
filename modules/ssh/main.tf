resource "tls_private_key" "test" {
  algorithm = "RSA"
}

resource "local_file" "private_key" {
  content         = tls_private_key.test.private_key_pem
  filename        = "ssh_keys/${var.env}.pem"
  file_permission = "0600"
}


resource "local_file" "public_key" {
  content         = tls_private_key.test.public_key_pem
  filename        = "instance/${var.env}.pub"
  file_permission = "0600"
}
