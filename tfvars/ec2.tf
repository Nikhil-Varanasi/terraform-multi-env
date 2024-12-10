resource "aws_instance" "expense" {
    for_each = var.instance
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    instance_type = each.value
    tags = merge(
        var.common_tags,
        var.tags,
        {
            Name = each.key
        }
    )
}

resource "aws_security_group" "allow_ssh_terraform" {
    name        = "Allow_ssh_${var.environment}"
    description = "Allow port 22 for ssh access"

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = merge(
        var.common_tags,
        var.tags,
        {
            Name = "allow_ssh_${var.environment}"
        }
    )    
}