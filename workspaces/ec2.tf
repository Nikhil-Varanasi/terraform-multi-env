resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = ["sg-0996d6bc9e1352780"]
    instance_type = lookup(var.instance_type, terraform.workspace)
    tags = {
        Name = "terraform-${terraform.workspace}"
    }
}