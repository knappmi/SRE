# Terraform Exercises

## 📁 Structure

- **terraform/** - Complete Terraform configuration (reference implementation)
- Work directly in this directory to practice

## 🎯 Exercise Approach

Rather than providing incomplete templates, use this approach to practice:

### 1. Study the Existing Configuration
```bash
cd terraform
cat main.tf  # Study the complete example
```

### 2. Practice Exercises

**Beginner:**
- Modify variables in `terraform.tfvars.example`
- Add new variables and use them in resources
- Change resource attributes (names, tags, etc.)

**Intermediate:**
- Add a new resource (e.g., another local_file)
- Create a new template file and use it
- Add more outputs to display information

**Advanced:**
- Refactor into modules
- Add data sources
- Implement remote state
- Add conditional resources

### 3. Test Your Changes

```bash
# Initialize
terraform init

# Validate syntax
terraform validate

# Plan (dry-run)
terraform plan

# Apply
terraform apply

# Clean up
terraform destroy
```

## 💡 Practice Ideas

1. **Variable Practice**: Add variables for different environments (dev, staging, prod)
2. **Resource Creation**: Add more local_file resources with different content
3. **Templates**: Create new template files and use templatefile() function
4. **Modules**: Break the configuration into reusable modules
5. **State Management**: Configure remote state (S3, etc.)
6. **Workspaces**: Use terraform workspaces for multi-environment

## 📚 Key Concepts to Practice

- Variables and locals
- Resources and data sources
- Outputs
- Template files
- State management
- Module organization
- Dependencies between resources

## 🔧 Useful Commands

```bash
terraform init          # Initialize working directory
terraform validate      # Validate configuration files
terraform fmt           # Format code to canonical format
terraform plan          # Preview changes
terraform apply         # Apply changes
terraform destroy       # Destroy resources
terraform show          # Show current state
terraform output        # Display outputs
```
