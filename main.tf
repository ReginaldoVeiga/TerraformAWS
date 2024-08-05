resource "aws_instance" "web" {
  count           = 1
  ami             = "ami-04a81a99f5ec58529"
  instance_type   = "t2.micro"
  key_name        = "aws-terraform"
  security_groups = ["allow_http_reqs", "allow_pma_reqs", "allow_ssh_reqs", "allow_outbound"]
  # user_data       = <<-EOL
  #  #!/bin/bash
  #  sudo apt-get update -y
  #  sudo apt-get upgrade -y
  #  sudo apt-get install curl -y
  #  # Instalar Docker
  #  curl -fsSL https://get.docker.com -o get-docker.sh
  #  sh ./get-docker.sh 
  #  # Executar containers Docker
  #  docker run --name some-nginx -d -p 8080:80 nginx:latest
  #  docker run -dit --name my-running-app -p 8081:80 httpd:latest
  #  # Alterar o conteúdo do index.html do NGINX
  #  docker exec -i some-nginx sh -c 'echo "Seja bem vindo ao NGINX" > /usr/share/nginx/html/index.html'
  # EOL
  
  tags = {
    Owner = "Reginaldo da Veiga Jardim"
    Name  = "instance-${count.index}"
  }

  depends_on = [
    aws_security_group.allow_all_outbound,
    aws_security_group.allow_http,
    aws_security_group.allow_ssh,
    aws_security_group.allow_pma
  ]
}