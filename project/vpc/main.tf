resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop" {
  count          = length(var.subnets)
  name           = "${var.vpc_name}-${var.subnets[count.index].zone}"
  zone           = var.subnets[count.index].zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.subnets[count.index].cidr]
}

