![Github Actions](../../actions/workflows/terraform.yml/badge.svg)

# Terraform <NAME>

## Description

Add a description of the module here

## Usage

Add example usage here

```hcl
module "example" {
  source  = "appvia/<NAME>/aws"
  version = "0.0.1"

  # insert variables here
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
