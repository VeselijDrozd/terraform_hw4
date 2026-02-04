variable "ip_string" {
  type        = string
  description = "ip-адрес"
  
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
