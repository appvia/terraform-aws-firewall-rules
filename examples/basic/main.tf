module "rule_group" {
  source = "../../"

  name     = "stateful-test"
  ordering = "STRICT_ORDER"

  rule_files = [
    "${path.root}/rules/default.rules",
  ]
}
