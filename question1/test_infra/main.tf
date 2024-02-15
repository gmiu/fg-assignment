module "test_infrastructure" {
  source = "./modules/test_infrastructure"

  subnet_id          = var.subnet_id
  security_group_ids = var.security_group_ids

  al2023_count   = var.al2023_count
  al2_count      = var.al2_count
  debian12_count = var.debian12_count
  suse15_count   = var.suse15_count
  ubuntu20_count = var.ubuntu20_count
  ubuntu22_count = var.ubuntu22_count
}
