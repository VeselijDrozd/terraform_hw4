output "vpc_id" {
  value       = yandex_vpc_network.develop.id
  description = "ID of network"
}

output "subnets" {
  value = [
    for idx, subnet in yandex_vpc_subnet.develop : {
      zone = var.subnets[idx].zone
      id   = subnet.id
      cidr = var.subnets[idx].cidr
      name = subnet.name
    }
  ]
}
