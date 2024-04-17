locals {
  rules = compact(concat([
    for f in var.rule_files :
    split("\n", format("# --- %s\n%s", basename(f), file(f)))
  ]...))
}
