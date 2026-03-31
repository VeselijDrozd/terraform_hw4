###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
  sensitive   = true
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  sensitive   = true
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  sensitive   = true
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

###common vars

variable "vms_ssh_root_key" {
  type        = string
  description = "ssh-keygen -t ed25519"
  sensitive   = true
}

variable "vms_username" {
  type        = string
  default     = "ubuntu"
  description = "username of VMs"
  sensitive   = true
}

variable "ip_string" {
  type        = string
  description = "ip-адрес"
  default     = "192.168.1.1"
  
  validation {
    condition = can(regex(
      "^((25[0-5]|(2[0-4]|1\\d|[1-9]?)\\d)\\.?){4}$",
      var.ip_string
    ))
    error_message = "Not IP"
  }
}

variable "ip_list" {
  type        = list(string)
  description = "список ip-адресов"
  default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
  
  validation {
    condition = alltrue([
      for ip in var.ip_list : can(regex(
        "^((25[0-5]|(2[0-4]|1\\d|[1-9]?)\\d)\\.?){4}$",
        ip
      ))
    ])
    error_message = "Not IP"
  }
}



