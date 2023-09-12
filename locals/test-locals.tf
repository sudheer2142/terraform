resource "aws_key_pair" "deployer" {
  key_name   = "devops-pub"
  public_key = local.mykey

}

resource "aws_instance" "file-function" {
  ami = local.ami_id #devops-practice in us-east-1
  instance_type = local.instance_type
  key_name = aws_key_pair.deployer.key_name
}