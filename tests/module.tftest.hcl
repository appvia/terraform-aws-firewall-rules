mock_provider "aws" {}

run "basic" {
  command = plan

  variables {
    name       = "stateful-test"
    rule_files = ["./examples/basic/rules/default.rules"]
  }

  assert {
    condition     = aws_networkfirewall_rule_group.this.type == "STATEFUL"
    error_message = "Firewall rule group should be stateful"
  }
}
