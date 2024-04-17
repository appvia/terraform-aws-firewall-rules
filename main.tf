module "parser" {
  source = "./modules/rules_parser"

  rules = local.rules
}

resource "aws_networkfirewall_rule_group" "this" {
  name        = var.name
  capacity    = var.capacity
  description = "Stateful rule group for ${var.name}"
  type        = "STATEFUL"

  rule_group {
    stateful_rule_options {
      rule_order = var.ordering
    }

    rule_variables {
      dynamic "ip_sets" {
        for_each = var.ip_variables

        content {
          key = upper(ip_sets.key)
          ip_set {
            definition = ip_sets.value
          }
        }
      }

      dynamic "port_sets" {
        for_each = var.port_variables

        content {
          key = upper(port_sets.key)
          port_set {
            definition = port_sets.value
          }
        }
      }
    }

    reference_sets {
      dynamic "ip_set_references" {
        for_each = var.ip_references

        content {
          key = upper(ip_set_references.key)
          ip_set_reference {
            reference_arn = ip_set_references.value
          }
        }
      }
    }

    rules_source {
      rules_string = module.parser.generated
    }
  }

  tags = merge(var.tags, {
    "Name" : var.name
    "RuleFiles" : join(" ", [
      for name in var.rule_files : basename(name)
    ])
  })
}
