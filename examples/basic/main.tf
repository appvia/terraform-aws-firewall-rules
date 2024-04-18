module "rule_group" {
  source = "../../"

  name     = "stateful-test"
  ordering = "STRICT_ORDER"

  rule_files = [
    "${path.root}/rules/default.rules",
  ]

  ip_variables = {
    HOME_NET = [
      "10.0.0.0/8",
    ]

    EXTERNAL_NET = [
      "0.0.0.0/0",
    ]
  }
}
