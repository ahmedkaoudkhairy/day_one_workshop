provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami       = "ami-0453ec754f44f9a4a"
   
  instance_type = "t2.micro"

  tags = {
    Name = "WebServer"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              echo "<h1>Welcome to Terraform Web Server</h1>" | sudo tee /var/www/html/index.html
              sudo systemctl start apache2
              EOF
}

resource "aws_s3_bucket" "web_files" {
  bucket = "my-terraform-web-files-${random_id.bucket_suffix.hex}"
  //acl    = "public-read"

  tags = {
    Name = "WebFilesBucket"
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}
resource "aws_s3_bucket" "example" {
    bucket = "my_example_buket"
    


  
}