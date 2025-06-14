variable "ami_id" {
  type = string
  default = "ami-0b09627181c8d5778"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}
