# MongoDB Atlas Terraform Module

This module creates and manages MongoDB Atlas projects with comprehensive networking, security, and feature configuration.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | >= 2.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_mongodbatlas"></a> [mongodbatlas](#provider\_mongodbatlas) | 2.0.1 |

## Resources

| Name | Type |
|------|------|
| [mongodbatlas_project.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project) | resource |
| [mongodbatlas_network_container.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/network_container) | resource |
| [mongodbatlas_network_peering.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/network_peering) | resource |
| [mongodbatlas_project_ip_access_list.with_peering](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project_ip_access_list) | resource |
| [mongodbatlas_custom_dns_configuration_cluster_aws.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/custom_dns_configuration_cluster_aws) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | Public API key to authenticate to Atlas | `string` | n/a | yes |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | Private API key to authenticate to Atlas | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Atlas Organization ID | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name | `string` | n/a | yes |
| <a name="input_is_collect_database_specifics_statistics_enabled"></a> [is\_collect\_database\_specifics\_statistics\_enabled](#input\_is\_collect\_database\_specifics\_statistics\_enabled) | Whether to collect database-specific statistics | `bool` | `true` | no |
| <a name="input_is_data_explorer_enabled"></a> [is\_data\_explorer\_enabled](#input\_is\_data\_explorer\_enabled) | Whether to enable Data Explorer | `bool` | `true` | no |
| <a name="input_is_extended_storage_sizes_enabled"></a> [is\_extended\_storage\_sizes\_enabled](#input\_is\_extended\_storage\_sizes\_enabled) | Whether to enable extended storage sizes | `bool` | `true` | no |
| <a name="input_is_performance_advisor_enabled"></a> [is\_performance\_advisor\_enabled](#input\_is\_performance\_advisor\_enabled) | Whether to enable Performance Advisor | `bool` | `true` | no |
| <a name="input_is_realtime_performance_panel_enabled"></a> [is\_realtime\_performance\_panel\_enabled](#input\_is\_realtime\_performance\_panel\_enabled) | Whether to enable Real-Time Performance Panel | `bool` | `true` | no |
| <a name="input_is_schema_advisor_enabled"></a> [is\_schema\_advisor\_enabled](#input\_is\_schema\_advisor\_enabled) | Whether to enable Schema Advisor | `bool` | `true` | no |
| <a name="input_custom_dns_enabled"></a> [custom\_dns\_enabled](#input\_custom\_dns\_enabled) | Whether to enable Custom DNS | `bool` | `true` | no |
| <a name="input_enable_network_peering"></a> [enable\_network\_peering](#input\_enable\_network\_peering) | Whether to enable network peering with AWS VPC | `bool` | `false` | no |
| <a name="input_limits"></a> [limits](#input\_limits) | Project limits | <pre>list(object({<br/>    name  = string<br/>    value = number<br/>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the project | `map(string)` | `{}` | no |
| <a name="input_ip_access_list"></a> [ip\_access\_list](#input\_ip\_access\_list) | List of IP access rules for the project | <pre>list(object({<br/>    cidr_block         = optional(string)<br/>    ip_address         = optional(string)<br/>    aws_security_group = optional(string)<br/>    comment            = string<br/>  }))</pre> | `[]` | no |
| <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider) | Cloud provider for network peering | `string` | n/a | yes |
| <a name="input_atlas_cidr_block"></a> [atlas\_cidr\_block](#input\_atlas\_cidr\_block) | Atlas CIDR block for network container | `string` | n/a | yes |
| <a name="input_aws_region_name_network_container"></a> [aws\_region\_name\_network\_container](#input\_aws\_region\_name\_network\_container) | AWS region name for network container | `string` | n/a | yes |
| <a name="input_aws_accepter_region_name"></a> [aws\_accepter\_region\_name](#input\_aws\_accepter\_region\_name) | AWS accepter region name for network peering | `string` | n/a | yes |
| <a name="input_route_table_cidr_block"></a> [route\_table\_cidr\_block](#input\_route\_table\_cidr\_block) | Route table CIDR block for network peering | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID for network peering | `string` | n/a | yes |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account ID for network peering | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The MongoDB Atlas project ID |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | The MongoDB Atlas project name |
| <a name="output_project_org_id"></a> [project\_org\_id](#output\_project\_org\_id) | The MongoDB Atlas organization ID |
| <a name="output_container_id"></a> [container\_id](#output\_container\_id) | The network container ID |
| <a name="output_peering_id"></a> [peering\_id](#output\_peering\_id) | The network peering ID |
| <a name="output_ip_access_list_ids"></a> [ip\_access\_list\_ids](#output\_ip\_access\_list\_ids) | List of IP access list entry IDs |
| <a name="output_ip_access_list_details"></a> [ip\_access\_list\_details](#output\_ip\_access\_list\_details) | Details of all IP access list entries |
| <a name="output_custom_dns_enabled"></a> [custom\_dns\_enabled](#output\_custom\_dns\_enabled) | Whether custom DNS is enabled |
| <a name="output_project_features"></a> [project\_features](#output\_project\_features) | Project feature settings |
| <a name="output_project_tags"></a> [project\_tags](#output\_project\_tags) | Tags applied to the project |
| <a name="output_network_container_details"></a> [network\_container\_details](#output\_network\_container\_details) | Network container configuration details |
| <a name="output_network_peering_details"></a> [network\_peering\_details](#output\_network\_peering\_details) | Network peering configuration details |

## Usage

### Basic Usage

```hcl
module "mongodb_atlas" {
  source = "./mongodbatlas_project"

  # Required
  public_key   = var.public_key
  private_key  = var.private_key
  org_id       = var.org_id
  project_name = var.project_name

  # Optional
  tags = var.tags
}
```

### Advanced Usage with Network Peering

```hcl
module "mongodb_atlas" {
  source = "./mongodbatlas_project"

  # Authentication
  public_key   = var.atlas_public_key
  private_key  = var.atlas_private_key
  org_id       = var.atlas_org_id
  project_name = "production-database"

  # Network Peering Configuration
  enable_network_peering              = true
  cloud_provider                      = "AWS"
  atlas_cidr_block                   = "10.8.0.0/21"
  aws_region_name_network_container   = "us-east-1"
  aws_accepter_region_name            = "us-east-1"
  route_table_cidr_block             = "10.0.0.0/16"
  vpc_id                             = aws_vpc.main.id
  aws_account_id                     = "123456789012"

  # Security Configuration
  ip_access_list = [
    {
      cidr_block = "10.0.0.0/8"
      comment    = "Internal network access"
    },
    {
      aws_security_group = "sg-12345678"
      comment           = "Application security group"
    },
    {
      ip_address = "203.0.113.1"
      comment    = "Admin workstation"
    }
  ]

  # Feature Configuration
  is_performance_advisor_enabled                   = true
  is_realtime_performance_panel_enabled           = true
  is_data_explorer_enabled                        = true
  custom_dns_enabled                              = true

  # Project Limits
  limits = [
    {
      name  = "atlas.project.maxClusters"
      value = 10
    },
    {
      name  = "atlas.project.maxUsers"
      value = 100
    }
  ]

  # Tags
  tags = {
    Environment   = "production"
    Project       = "data-platform"
    CostCenter    = "engineering"
    Owner         = "data-team"
    BackupPolicy  = "daily"
  }
}
```
