output "arn" {
  value       = aws_networkfirewall_rule_group.this.arn
  description = "ARN of the AWS network firewall rule group"
}

output "rules" {
  value = [
    for rule in module.parser.enabled : rule.raw
  ]

  description = "List of applied rules within the network firewall rule group"
}
