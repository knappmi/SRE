# 02 - Infrastructure as Code (IaC)

## 🎯 Importance

Infrastructure as Code (IaC) is crucial for SREs because it enables:

- **Reproducibility**: Create identical environments consistently
- **Version Control**: Track infrastructure changes like code
- **Automation**: Eliminate manual provisioning steps
- **Documentation**: Infrastructure becomes self-documenting
- **Disaster Recovery**: Rebuild infrastructure quickly
- **Scalability**: Deploy infrastructure at scale

SREs use IaC to manage cloud resources, automate deployments, and ensure infrastructure reliability.

## 🛠️ Tools Covered

### Terraform
- Industry-standard IaC tool
- Cloud-agnostic (AWS, GCP, Azure, etc.)
- Declarative syntax
- State management
- Plan before apply

## 🚀 Getting Started

### Prerequisites
```bash
# Install Terraform
# macOS
brew install terraform

# Linux
wget https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_amd64.zip
unzip terraform_1.6.0_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Verify installation
terraform version
```

### Running Examples

```bash
cd terraform/

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Plan changes (dry-run)
terraform plan

# Apply changes (for local examples only)
terraform apply

# Destroy resources
terraform destroy
```

## 📖 What You'll Learn

1. **Basic Syntax**: Resources, variables, outputs
2. **State Management**: Local and remote state
3. **Modules**: Reusable infrastructure components
4. **Data Sources**: Query existing infrastructure
5. **Provisioners**: Execute scripts on resources
6. **Workspaces**: Manage multiple environments

## 💡 Best Practices

- Always use version control for Terraform code
- Use remote state storage (S3, GCS, etc.)
- Implement state locking to prevent conflicts
- Use modules for reusability
- Never commit secrets or credentials
- Use `.tfvars` files for environment-specific values
- Run `terraform plan` before `terraform apply`
- Use `terraform fmt` to format code
- Implement proper resource naming conventions
- Tag all resources appropriately

## 🎓 Exercise Progression

1. Start with simple local resources (null_resource, local_file)
2. Create basic cloud resources (if you have cloud access)
3. Build reusable modules
4. Implement remote state
5. Create multi-environment setups

## 📚 Additional Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [Terraform Best Practices](https://www.terraform-best-practices.com/)
- [HashiCorp Learn](https://learn.hashicorp.com/terraform)

## ⚠️ Important Notes

- The examples in this directory use local resources that don't require cloud credentials
- For cloud resources, ensure you have proper credentials configured
- Always review `terraform plan` output before applying
- Be aware of costs when working with cloud resources
- Clean up resources with `terraform destroy` when done
