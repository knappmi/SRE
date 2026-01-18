# Ansible Configuration Management Exercises

## 📁 Structure

- **playbook.yml** - Main Ansible playbook
- **inventory** - Host inventory file
- **templates/** - Jinja2 templates

## 🎯 Exercise Approach

### 1. Study the Existing Configuration

```bash
# Review the playbook
cat playbook.yml

# Review the inventory
cat inventory

# Review templates
cat templates/app_config.j2
```

### 2. Practice Exercises

**Beginner:**
- Run the playbook in check mode: `ansible-playbook playbook.yml --check`
- Modify variables and see how templates change
- Add new tasks to install packages
- Change file ownership and permissions

**Intermediate:**
- Create a new role for web server setup
- Add handlers for service restarts
- Use loops to install multiple packages
- Implement conditionals (when:)
- Use Ansible vault for secrets

**Advanced:**
- Organize playbook into roles
- Implement dynamic inventory
- Create custom Ansible modules
- Set up rolling deployments
- Implement idempotency checks

## 💡 Practice Ideas

1. **Basic Tasks**
   - Install packages (apt, yum)
   - Copy files to remote hosts
   - Create users and groups
   - Manage services (start, stop, enable)

2. **Templates**
   - Create configuration files from templates
   - Use variables and facts
   - Implement conditionals in templates
   - Loop through lists in templates

3. **Roles**
   - Create a web server role
   - Create a database role
   - Create a monitoring role
   - Compose them in playbooks

4. **Advanced Patterns**
   - Use tags for selective execution
   - Implement error handling
   - Use blocks for grouping tasks
   - Delegate tasks to specific hosts

## 🔧 Useful Commands

```bash
# Check syntax
ansible-playbook playbook.yml --syntax-check

# Dry run
ansible-playbook playbook.yml --check

# Run with verbose output
ansible-playbook playbook.yml -v

# Run specific tags
ansible-playbook playbook.yml --tags "web"

# List hosts
ansible all --list-hosts -i inventory

# Ad-hoc commands
ansible all -m ping -i inventory
ansible all -m shell -a "uptime" -i inventory

# Encrypt secrets
ansible-vault create secrets.yml
ansible-vault edit secrets.yml
```

## 📚 Key Concepts

- Playbooks and tasks
- Inventory management
- Variables and facts
- Templates (Jinja2)
- Handlers
- Roles and galaxy
- Idempotency
- Check mode
- Ansible Vault
- Modules

## 🎓 Learning Path

1. Start with simple ad-hoc commands
2. Write basic playbooks
3. Use variables and templates
4. Organize into roles
5. Implement complex orchestration
6. Use vault for secrets
7. Optimize for idempotency
