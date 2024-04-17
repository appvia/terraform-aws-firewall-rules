output "invalid" {
  value       = local.invalid_rules
  description = "List of rules that failed to be parsed"
}

output "enabled" {
  value       = local.enabled_rules
  description = "List of enabled rules"
}

output "disabled" {
  value       = local.disabled_rules
  description = "List of disabled rules"
}

output "comments" {
  value       = local.comments
  description = "List of comments"
}

output "duplicate_sids" {
  value       = local.duplicate_sids
  description = "List of duplicate statement identifiers for enabled rules"
}

output "generated" {
  value = join("\n", [
    for rule in local.enabled_rules : rule.raw
  ])
}
