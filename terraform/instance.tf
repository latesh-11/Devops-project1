resource "aws_instance" "web" {
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key-tf}"
  vpc_security_groups_ids = ["${aws_security_group.allow_tls.id}"]
  ami = "${aws_ami.ubuntu.id}"
  tags = {
    Name = "jenkins-server"
  }
}

resource "aws_instance" "web2" {
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key-tf}"
  vpc_security_groups_ids = ["${aws_security_group.allow_tls.id}"]
  ami = "${aws_ami.ubuntu.id}"
  tags = {
    Name = "webapp-server"
  }
}