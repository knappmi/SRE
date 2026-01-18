# Terraform Example: Local File Management
#
# This is a simple example that demonstrates Terraform basics
# without requiring cloud credentials.

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

# Variables for configuration
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "development"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "sre-training"
}

# Local values for computed data
locals {
  timestamp = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

# Create a configuration file
resource "local_file" "config" {
  content = templatefile("${path.module}/templates/config.tpl", {
    environment  = var.environment
    project_name = var.project_name
    timestamp    = local.timestamp
  })
  filename        = "${path.module}/output/config.txt"
  file_permission = "0644"
}

# Create a system info file
resource "local_file" "system_info" {
  content = <<-EOT
    SRE Training Infrastructure
    ============================
    
    Project: ${var.project_name}
    Environment: ${var.environment}
    Created: ${local.timestamp}
    
    This infrastructure is managed by Terraform.
    Do not modify manually.
    
    Tags:
    ${jsonencode(local.tags)}
  EOT
  
  filename        = "${path.module}/output/system_info.txt"
  file_permission = "0644"
}

# Demonstrate null_resource for provisioning
resource "null_resource" "setup" {
  # This resource doesn't create real infrastructure
  # but demonstrates provisioner usage
  
  provisioner "local-exec" {
    command = "echo 'Infrastructure setup completed at ${local.timestamp}'"
  }
  
  # Trigger re-runs when these values change
  triggers = {
    environment = var.environment
    timestamp   = local.timestamp
  }
}

# Outputs to display important information
output "environment" {
  description = "Current environment"
  value       = var.environment
}

output "config_file" {
  description = "Path to generated config file"
  value       = local_file.config.filename
}

output "system_info_file" {
  description = "Path to system info file"
  value       = local_file.system_info.filename
}

output "creation_time" {
  description = "Infrastructure creation timestamp"
  value       = local.timestamp
}
