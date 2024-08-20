variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-west-2"
}
