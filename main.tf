/*terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Sahil123"
    workspaces {
      name = "gh-actions-demo"
    }
    
  }
}*/
  
#remote backend
 
/*terraform {
  backend "s3" {
    bucket = "azure-devops-roche"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "Roche_Dynamo_Db_Table"
    
  }
}*/
  
  terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  AWS_ACCESS_KEY_ID: ${{secrets.AWS_ACCESS_KEY_ID}}
  AWS_SECRETS_ACCESS_KEY: ${{secrets.AWS_SECRETS_ACCESS_KEY}}
  AWS_REGION: ${{secrets.AWS_REGION}}
}

resource "aws_instance" "vm-web" {
  
  ami           = "ami-0cca134ec43cf708f"
  instance_type = "t2.micro"

  tags = {
    Name = "server for web"
    Env = "dev"
  }
}
