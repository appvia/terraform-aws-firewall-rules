locals {
  rule_regex = "^(?P<enabled>#)*[\\s#]*(?P<raw>(?P<header>[^()]+)\\((?P<options>.*)\\)$)"

  option_regex = "(?P<key>[^\\;\\:]+)(?:\\:\\s?(?P<value>[^\\;]+))?\\;"

  raw_rules = [
    for rule in flatten([
      for rule in var.rules : [
        try(regex(local.rule_regex, trimspace(rule)), {
          parsed = false,
          raw    = rule,
        })
      ]
      ]) : merge(rule, {
      parsed  = lookup(rule, "parsed", true)
      enabled = lookup(rule, "enabled", null) != "#"
      header  = trimspace(lookup(rule, "header", ""))
      options = regexall(local.option_regex, lookup(rule, "options", ""))
    })
  ]

  invalid_rules = [
    for rule in local.raw_rules :
    rule.raw if rule.parsed == false && !startswith(rule.raw, "#")
  ]

  enabled_rules = [
    for rule in local.raw_rules :
    rule if rule.parsed == true && rule.enabled == true
  ]

  disabled_rules = [
    for rule in local.raw_rules :
    rule if rule.parsed == true && rule.enabled == false
  ]

  comments = [
    for rule in local.raw_rules :
    rule.raw if rule.parsed == false && startswith(rule.raw, "#")
  ]

  sids = sort(flatten([
    for rule in local.enabled_rules : [
      for opt in rule.options : opt.value if trimspace(opt.key) == "sid"
    ]
  ]))

  duplicate_sids = [
    for a, b in local.sids :
    b if index(local.sids, b) != a
  ]
}
