resource "aws_key_pair" "deployer" {
  key_name   = "key-tf"
  public_key = file("${path.module}"/id_rsa.pub)
}
