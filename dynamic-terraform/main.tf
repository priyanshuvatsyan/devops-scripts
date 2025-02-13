terraform {
  backend "s3"{
	bucket = "terraform-test-statefile-priva"
	key = "terraform.tfstate"  
        region = "us-west-2"

 }
}
provider "aws" {
  region = var.region
}
variable "instance_type" {
     default = "t2.micro"
}
variable "region" {
      default = "us-west-2"
}
resource "aws_instance" "my_instance"{
   ami = "ami-830c94e3"
   instance_type = var.instance_type
  
}
output "public_ip"{
 value = aws_instance.my_instance.public_ip
}
