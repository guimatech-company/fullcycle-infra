module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  monitoring             = false
  vpc_security_group_ids = ["sg-0bd67c5d1e08a6a53"]
  subnet_id              = "subnet-097e7e5e2b5607337"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "Teste pipeline"
  }
}

terraform {
  backend "s3" {
    bucket = "teste-repositorio-fullcycle"
    key    = "teste"
    region = "sa-east-1"
  }
}