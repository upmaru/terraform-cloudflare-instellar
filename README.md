# Terraform Cloudflare Module for Instellar

This module contains integrations with Cloudflare for Instellar.

- [x] Setup zero-trust ssh tunnel access.
- [ ] DNS credential module.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.29.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_access_application.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/access_application) | resource |
| [cloudflare_access_ca_certificate.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/access_ca_certificate) | resource |
| [cloudflare_access_policy.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/access_policy) | resource |
| [cloudflare_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_tunnel.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/tunnel) | resource |
| [cloudflare_tunnel_config.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/tunnel_config) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [terraform_data.cloudflared](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_access"></a> [bastion\_access](#input\_bastion\_access) | Bastion access to provision cloudflare tunnel | <pre>object({<br>    user         = string<br>    host         = string<br>    private_key  = string<br>    port         = number<br>    architecture = string<br>  })</pre> | n/a | yes |
| <a name="input_blueprint"></a> [blueprint](#input\_blueprint) | The identifier of the blueprint | `string` | n/a | yes |
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input\_cloudflare\_account\_id) | Cloudflare account id | `string` | n/a | yes |
| <a name="input_emails"></a> [emails](#input\_emails) | Emails of users who can access the tunnel | `list(string)` | n/a | yes |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | Identifier for the tunnel | `string` | n/a | yes |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | Zone you want to use for creating a tunnel | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->