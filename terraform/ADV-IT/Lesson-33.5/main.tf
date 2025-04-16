
provider "aws" {
  region = "eu-west-1"
}

import {
  id = "sg-028ea98894885b10a"
  to = aws_security_group.web
}

import {
  id = "sg-0883f02dfc4431a5f"
  to = aws_security_group.sql
}

import {
  id = "i-0335662044d0b40f7"
  to = aws_instance.web
}

import {
  id = "i-0e2c9dc754433f9b4"
  to = aws_instance.sql
}