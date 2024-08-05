resource "aws_security_group" "allow_http" {
  name        = "allow_http_reqs"
  description = "Allow HTTP inbound"

  tags = {
    Name = "allow_http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group" "allow_pma" {
  name        = "allow_pma_reqs"
  description = "Allow HTTP inbound"

  tags = {
    Name = "allow_pma"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_pma_ipv4" {
  security_group_id = aws_security_group.allow_pma.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8081
  ip_protocol       = "tcp"
  to_port           = 8081
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_reqs"
  description = "Allow SSH inbound traffic"

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group" "allow_all_outbound" {
  name        = "allow_outbound"
  description = "Allow all outbound"

  tags = {
    Name = "allow_outbound"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_all_outbound.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}