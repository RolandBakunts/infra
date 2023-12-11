# output "public_key" {
#   value = module.ssh.public_key_openssh
# }

output "public_ip" {
  value = module.instance.public_ip
}
