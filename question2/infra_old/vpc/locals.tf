locals {
  azs = [for az in ["a", "b"] : "${var.aws_region}${az}"]
}
