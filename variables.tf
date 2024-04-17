variable "name" {
  type        = string
  description = "Name of the AWS network firewall rule group"
}

variable "capacity" {
  type        = number
  default     = 50
  description = "Capacity defining the maximum number of rules within the rule group"
}

variable "ordering" {
  type        = string
  default     = "DEFAULT_ACTION_ORDER"
  description = "Specifies the type of ordering when evaluating rules within the group"

  validation {
    condition = contains([
      "DEFAULT_ACTION_ORDER",
      "STRICT_ORDER",
    ], var.ordering)

    error_message = "Invalid ordering type specified. Must be one of 'DEFAULT_ACTION_ORDER', 'STRICT_ORDER'."
  }
}

variable "rule_files" {
  type        = list(string)
  description = "List of rule files to load into the rule group"
}

variable "ip_variables" {
  type        = map(list(string))
  default     = {}
  description = "Map consisting of string keys with string list values denoting IP variable definitions"
}

variable "ip_references" {
  type        = map(string)
  default     = {}
  description = "Map consisting of string keys and values denoting IP prefix list variable definitions"
}

variable "port_variables" {
  type        = map(list(string))
  default     = {}
  description = "Map consisting of string keys with string list values denoting port variable definitions"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to be applied to resources created by this module"
}
