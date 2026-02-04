module "vpc" {
  source   = "./vpc"
  vpc_name = "develop"
  subnets  = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-d", cidr = "10.0.3.0/24" },
  ]
}

module "marketing" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=4730505f991c173ff42f44d7cffaa7366041e2f7"
  env_name       = "marketing" 
  network_id     = module.vpc.vpc_id
  subnet_zones   = module.vpc.subnets[*].zone
  subnet_ids     = module.vpc.subnets[*].id
  instance_name  = "vm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    owner= "r.grivnyashkin",
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

module "analytics" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=4730505f991c173ff42f44d7cffaa7366041e2f7"
  env_name       = "analytics" 
  network_id     = module.vpc.vpc_id
  subnet_zones   = module.vpc.subnets[*].zone
  subnet_ids     = module.vpc.subnets[*].id
  instance_name  = "vm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    owner= "r.grivnyashkin",
    project = "analytics"
  }

  metadata = {
    user-data          = local.cloudinit
    serial-port-enable = 1
  }
}

locals {
  cloudinit = templatefile("${path.module}/cloud-init.yml", {
    username = var.vms_username
    ssh_key  = trimspace(file(var.vms_ssh_root_key))
  })
}
