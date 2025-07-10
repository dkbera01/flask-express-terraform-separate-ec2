variable "aws_region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key Pair Name"
}

variable "ami_id" {
  description = "AMI ID for Ubuntu"
}
