# 03 - Configuration Management

## 🎯 Importance

Configuration Management is essential for SREs to:

- **Consistency**: Ensure systems are configured identically
- **Automation**: Reduce manual configuration errors
- **Compliance**: Enforce security and organizational policies
- **Scalability**: Configure hundreds or thousands of servers
- **Audit Trail**: Track what changed, when, and why
- **Recovery**: Restore systems to known good states

## 🛠️ Tools Covered

### Ansible
- Agentless (uses SSH)
- Simple YAML syntax
- Large module library
- Idempotent operations
- Perfect for configuration drift prevention

## 🚀 Getting Started

### Prerequisites
```bash
# Install Ansible
# macOS
brew install ansible

# Linux (Ubuntu/Debian)
sudo apt update
sudo apt install ansible

# Linux (RHEL/CentOS)
sudo yum install ansible

# Verify installation
ansible --version
```

### Running Examples

```bash
cd ansible/

# Check syntax
ansible-playbook --syntax-check playbook.yml

# Run in check mode (dry-run)
ansible-playbook --check playbook.yml

# Run playbook
ansible-playbook playbook.yml

# Run with specific inventory
ansible-playbook -i inventory/hosts playbook.yml

# Run specific tags
ansible-playbook playbook.yml --tags "webserver"
```

## 📖 What You'll Learn

1. **Inventory Management**: Define and group hosts
2. **Playbooks**: Orchestrate configurations
3. **Modules**: Use built-in and custom modules
4. **Variables**: Manage configuration data
5. **Templates**: Generate config files with Jinja2
6. **Roles**: Organize playbooks for reusability
7. **Handlers**: Trigger actions on changes

## 💡 Best Practices

- Use roles for organization and reusability
- Make playbooks idempotent
- Use variables for flexibility
- Store secrets in Ansible Vault
- Use version control for playbooks
- Test in check mode first
- Use tags for selective execution
- Document your playbooks
- Use dynamic inventory for cloud
- Follow naming conventions

## 🎓 Exercise Progression

1. Start with simple ad-hoc commands
2. Create basic playbooks
3. Use variables and templates
4. Build reusable roles
5. Implement error handling
6. Manage secrets with Vault

## 📚 Additional Resources

- [Ansible Documentation](https://docs.ansible.com/)
- [Ansible Galaxy](https://galaxy.ansible.com/) - Share and use roles
- [Ansible Best Practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html)

## ⚠️ Important Notes

- Examples use localhost for demonstration
- For real servers, update inventory with actual hosts
- Always test in non-production first
- Be careful with potentially destructive operations
- Use `--check` mode to preview changes
