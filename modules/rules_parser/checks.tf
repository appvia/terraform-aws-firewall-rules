check "disabled_rules" {
  assert {
    condition = length(local.disabled_rules) == 0
    error_message = format(
      "The following rules are valid but marked as disabled:\n%s",
      join("\n", formatlist("\t- %s", [
        for rule in local.disabled_rules :
        rule.raw
      ])),
    )
  }
}

check "invalid_rules" {
  assert {
    condition = length(local.invalid_rules) == 0
    error_message = format(
      "The following rule are invalid or malformed:\n%s",
      join("\n", formatlist("\t- %s", [
        for rule in local.invalid_rules : rule
      ])),
    )
  }
}

check "duplicate_sids" {
  assert {
    condition = length(local.duplicate_sids) == 0
    error_message = format(
      "The following duplicate statement identifiers have been found:\n%s",
      join("\n", formatlist("\t- %s", [
        for sid in local.duplicate_sids : sid
      ])),
    )
  }
}
