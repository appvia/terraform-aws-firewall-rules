<!-- markdownlint-disable -->
<a href="https://www.appvia.io/"><img src="./appvia_banner.jpg" alt="Appvia Banner"/></a><br/><p align="right"> <a href="https://registry.terraform.io/modules/appvia/firewall/aws/latest"><img src="https://img.shields.io/static/v1?label=APPVIA&message=Terraform%20Registry&color=191970&style=for-the-badge" alt="Terraform Registry"/></a></a> <a href="https://github.com/appvia/terraform-aws-firewall-rules/releases/latest"><img src="https://img.shields.io/github/release/appvia/terraform-aws-firewall-rules.svg?style=for-the-badge&color=006400" alt="Latest Release"/></a> <a href="https://appvia-community.slack.com/join/shared_invite/zt-1s7i7xy85-T155drryqU56emm09ojMVA#/shared-invite/email"><img src="https://img.shields.io/badge/Slack-Join%20Community-purple?style=for-the-badge&logo=slack" alt="Slack Community"/></a> <a href="https://github.com/appvia/terraform-aws-firewall-rules/graphs/contributors"><img src="https://img.shields.io/github/contributors/appvia/terraform-aws-firewall-rules.svg?style=for-the-badge&color=FF8C00" alt="Contributors"/></a>

<!-- markdownlint-restore -->
<!--
  ***** CAUTION: DO NOT EDIT ABOVE THIS LINE ******
-->

![Github Actions](../../actions/workflows/terraform.yml/badge.svg)

# Terraform AWS Firewall Rules

## Description

This module is responsible for creating AWS Network Stateful Firewall Rules. Provided a given set of rule files in Suricata format, this module will parse and validate those
rules, providing feedback on validation errors at plan and apply time.

## Usage

Add example usage here

```hcl
module "example" {
  source  = "appvia/firewall-rules/aws"
  version = "1.0.0"

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
```

## Update Documentation

The `terraform-docs` utility is used to generate this README. Follow the below steps to update:

1. Make changes to the `.terraform-docs.yml` file
2. Fetch the `terraform-docs` binary (https://terraform-docs.io/user-guide/installation/)
3. Run `terraform-docs markdown table --output-file ${PWD}/README.md --output-mode inject .`

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_parser"></a> [parser](#module\_parser) | ./modules/rules_parser | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_networkfirewall_rule_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_rule_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the AWS network firewall rule group | `string` | n/a | yes |
| <a name="input_rule_files"></a> [rule\_files](#input\_rule\_files) | List of rule files to load into the rule group | `list(string)` | n/a | yes |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Capacity defining the maximum number of rules within the rule group | `number` | `50` | no |
| <a name="input_ip_references"></a> [ip\_references](#input\_ip\_references) | Map consisting of string keys and values denoting IP prefix list variable definitions | `map(string)` | `{}` | no |
| <a name="input_ip_variables"></a> [ip\_variables](#input\_ip\_variables) | Map consisting of string keys with string list values denoting IP variable definitions | `map(list(string))` | `{}` | no |
| <a name="input_ordering"></a> [ordering](#input\_ordering) | Specifies the type of ordering when evaluating rules within the group | `string` | `"DEFAULT_ACTION_ORDER"` | no |
| <a name="input_port_variables"></a> [port\_variables](#input\_port\_variables) | Map consisting of string keys with string list values denoting port variable definitions | `map(list(string))` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to resources created by this module | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the AWS network firewall rule group |
| <a name="output_rules"></a> [rules](#output\_rules) | List of applied rules within the network firewall rule group |
<!-- END_TF_DOCS -->
