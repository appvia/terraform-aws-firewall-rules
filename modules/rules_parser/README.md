<!-- BEGIN_TF_DOCS -->
## Providers

No providers.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rules"></a> [rules](#input\_rules) | List of rules. Each entry should be a single rule declaration | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_comments"></a> [comments](#output\_comments) | List of comments |
| <a name="output_disabled"></a> [disabled](#output\_disabled) | List of disabled rules |
| <a name="output_duplicate_sids"></a> [duplicate\_sids](#output\_duplicate\_sids) | List of duplicate statement identifiers for enabled rules |
| <a name="output_enabled"></a> [enabled](#output\_enabled) | List of enabled rules |
| <a name="output_generated"></a> [generated](#output\_generated) | n/a |
| <a name="output_invalid"></a> [invalid](#output\_invalid) | List of rules that failed to be parsed |
<!-- END_TF_DOCS -->
