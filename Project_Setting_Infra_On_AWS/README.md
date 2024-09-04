# Setting up Infra on AWS 📝

**Step 1:**  Create first the IAM user with security credentials

**Step 2:**  Install the aws console

**Step 3:** type the aws configure, and add the acess key and secret access key

**Step 4:**  make a folder name it with your own

**Step 5:**  add provider file in the provider.tf

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


**Step 6:**  Initialize the tf files using teraform init, plan

**Step 7:**  create another tf file name it main.tf


**Step 8:**  create another tf file name it main.tf

```
resource "aws_vpc
```

***Step 9:** Create variables i'll name it variables.tf

