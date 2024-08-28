# Setting up Infra on AWS 🚀

Step: Create first the IAM user with security credentials
Step: Install the aws console
Step: type the aws configure, and add the acess key and secret access key
Step: make a folder name it with your own
Step: add provider file in the provider.tf

```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}
```


Step: Initialize the tf files using teraform init, plan