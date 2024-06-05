mock_provider "aws" {
  // mock_data "aws_availability_zones" {
  //   defaults = {
  //     names = [
  //       "eu-west-1a",
  //       "eu-west-1b",
  //       "eu-west-1c"
  //     ]
  //   }
  // }
}

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
