{
  "all" = [
    {
      "allow_recreate" = tobool(null)
      "allow_stopping_for_update" = true
      "boot_disk" = tolist([
        {
          "auto_delete" = true
          "device_name" = "fhmhluv9jjulbfaq3co5"
          "disk_id" = "fhmhluv9jjulbfaq3co5"
          "initialize_params" = tolist([
            {
              "block_size" = 4096
              "description" = ""
              "image_id" = "fd8kb72uc47duuitmajn"
              "kms_key_id" = ""
              "name" = ""
              "size" = 10
              "snapshot_id" = ""
              "type" = "network-hdd"
            },
          ])
          "mode" = "READ_WRITE"
        },
      ])
      "created_at" = "2026-02-03T07:09:55Z"
      "description" = "TODO: description; {{terraform yyy managed}}"
      "filesystem" = toset([])
      "folder_id" = "b1g6h9eoppq97skv3m9e"
      "fqdn" = "marketing-vm-0.ru-central1.internal"
      "gpu_cluster_id" = ""
      "hardware_generation" = tolist([
        {
          "generation2_features" = tolist([])
          "legacy_features" = tolist([
            {
              "pci_topology" = "PCI_TOPOLOGY_V2"
            },
          ])
        },
      ])
      "hostname" = "marketing-vm-0"
      "id" = "fhmfnsp23dqnvdhubam8"
      "labels" = tomap({
        "owner" = "r.grivnyashkin"
        "project" = "marketing"
      })
      "local_disk" = tolist([])
      "maintenance_grace_period" = ""
      "maintenance_policy" = tostring(null)
      "metadata" = tomap({
        "serial-port-enable" = "1"
        "user-data" = <<-EOT
        #cloud-config
        users:
          - name: drozd
            groups: sudo
            sudo: ["ALL=(ALL) NOPASSWD:ALL"]
            shell: /bin/bash
            ssh-authorized-keys:
              - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH3ev9TS5IXzMuJFbkJfJFpNe0F+hCFpc0DeLepkXcqw drozd@Ubuntu
        
        package_update: true
        package_upgrade: false
        packages:
          - nginx
          - curl
        
        runcmd:
          - echo "Hello drozd!" > /etc/motd
        
        EOT
      })
      "metadata_options" = tolist([
        {
          "aws_v1_http_endpoint" = 1
          "aws_v1_http_token" = 2
          "gce_http_endpoint" = 1
          "gce_http_token" = 1
        },
      ])
      "name" = "marketing-vm-0"
      "network_acceleration_type" = "standard"
      "network_interface" = tolist([
        {
          "dns_record" = tolist([])
          "index" = 0
          "ip_address" = "10.0.1.26"
          "ipv4" = true
          "ipv6" = false
          "ipv6_address" = ""
          "ipv6_dns_record" = tolist([])
          "mac_address" = "d0:0d:fb:f3:22:1b"
          "nat" = true
          "nat_dns_record" = tolist([])
          "nat_ip_address" = "62.84.126.35"
          "nat_ip_version" = "IPV4"
          "security_group_ids" = toset(null) /* of string */
          "subnet_id" = "e9b2vf870f7jsgfnr99c"
        },
      ])
      "placement_policy" = tolist([
        {
          "host_affinity_rules" = tolist([])
          "placement_group_id" = ""
          "placement_group_partition" = 0
        },
      ])
      "platform_id" = "standard-v1"
      "resources" = tolist([
        {
          "core_fraction" = 5
          "cores" = 2
          "gpus" = 0
          "memory" = 1
        },
      ])
      "scheduling_policy" = tolist([
        {
          "preemptible" = true
        },
      ])
      "secondary_disk" = toset([])
      "service_account_id" = ""
      "status" = "running"
      "timeouts" = null /* object */
      "zone" = "ru-central1-a"
    },
  ]
  "external_ip_address" = [
    "62.84.126.35",
  ]
  "fqdn" = [
    "marketing-vm-0.ru-central1.internal",
  ]
  "internal_ip_address" = [
    "10.0.1.26",
  ]
  "labels" = [
    tomap({
      "owner" = "r.grivnyashkin"
      "project" = "marketing"
    }),
  ]
  "network_interface" = [
    tolist([
      {
        "dns_record" = tolist([])
        "index" = 0
        "ip_address" = "10.0.1.26"
        "ipv4" = true
        "ipv6" = false
        "ipv6_address" = ""
        "ipv6_dns_record" = tolist([])
        "mac_address" = "d0:0d:fb:f3:22:1b"
        "nat" = true
        "nat_dns_record" = tolist([])
        "nat_ip_address" = "62.84.126.35"
        "nat_ip_version" = "IPV4"
        "security_group_ids" = toset(null) /* of string */
        "subnet_id" = "e9b2vf870f7jsgfnr99c"
      },
    ]),
  ]
}
