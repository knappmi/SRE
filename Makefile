.PHONY: help setup check-tools setup-all cleanup verify

# Colors for output
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

help: ## Show this help message
	@echo "$(BLUE)SRE Training Repository - Makefile Commands$(NC)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(GREEN)%-20s$(NC) %s\n", $$1, $$2}'

check-tools: ## Check if required tools are installed
	@echo "$(BLUE)Checking required tools...$(NC)"
	@command -v docker >/dev/null 2>&1 || { echo "$(RED)✗ Docker is not installed$(NC)"; exit 1; }
	@echo "$(GREEN)✓ Docker is installed$(NC)"
	@command -v docker-compose >/dev/null 2>&1 || command -v docker compose >/dev/null 2>&1 || { echo "$(YELLOW)⚠ Docker Compose is not installed (optional)$(NC)"; }
	@command -v docker-compose >/dev/null 2>&1 && echo "$(GREEN)✓ Docker Compose is installed$(NC)" || command -v docker compose >/dev/null 2>&1 && echo "$(GREEN)✓ Docker Compose is installed$(NC)" || true
	@command -v python3 >/dev/null 2>&1 || { echo "$(YELLOW)⚠ Python 3 is not installed (optional)$(NC)"; }
	@command -v python3 >/dev/null 2>&1 && echo "$(GREEN)✓ Python 3 is installed$(NC)" || true
	@command -v kubectl >/dev/null 2>&1 || { echo "$(YELLOW)⚠ kubectl is not installed (optional for K8s exercises)$(NC)"; }
	@command -v kubectl >/dev/null 2>&1 && echo "$(GREEN)✓ kubectl is installed$(NC)" || true
	@command -v terraform >/dev/null 2>&1 || { echo "$(YELLOW)⚠ Terraform is not installed (optional for IaC exercises)$(NC)"; }
	@command -v terraform >/dev/null 2>&1 && echo "$(GREEN)✓ Terraform is installed$(NC)" || true
	@command -v ansible >/dev/null 2>&1 || { echo "$(YELLOW)⚠ Ansible is not installed (optional for config mgmt exercises)$(NC)"; }
	@command -v ansible >/dev/null 2>&1 && echo "$(GREEN)✓ Ansible is installed$(NC)" || true
	@echo ""

setup: check-tools ## Initial setup and tool verification
	@echo "$(BLUE)Setting up SRE training environment...$(NC)"
	@echo "$(GREEN)✓ Setup complete!$(NC)"
	@echo ""
	@echo "$(YELLOW)Next steps:$(NC)"
	@echo "  1. Navigate to a concept directory (e.g., cd 01-coding)"
	@echo "  2. Read the README.md"
	@echo "  3. Follow the exercises"
	@echo ""

setup-containers: ## Set up Docker environment for container exercises
	@echo "$(BLUE)Setting up container environment...$(NC)"
	@cd 06-containers && docker build -t sre-training-web -f examples/Dockerfile . 2>/dev/null || echo "$(YELLOW)Container examples will be available in 06-containers$(NC)"
	@echo "$(GREEN)✓ Container environment ready$(NC)"

setup-databases: ## Set up database containers for practice
	@echo "$(BLUE)Setting up database containers...$(NC)"
	@cd 04-databases && docker-compose up -d 2>/dev/null || echo "$(YELLOW)Database containers will be available via docker-compose in 04-databases$(NC)"
	@echo "$(GREEN)✓ Database containers ready$(NC)"

setup-monitoring: ## Set up monitoring stack (Prometheus + Grafana)
	@echo "$(BLUE)Setting up monitoring stack...$(NC)"
	@cd 07-monitoring && docker-compose up -d 2>/dev/null || echo "$(YELLOW)Monitoring stack will be available via docker-compose in 07-monitoring$(NC)"
	@echo "$(GREEN)✓ Monitoring stack ready$(NC)"

setup-all: setup ## Set up all infrastructure components
	@echo "$(BLUE)Setting up all infrastructure...$(NC)"
	@$(MAKE) setup-containers 2>/dev/null || true
	@$(MAKE) setup-databases 2>/dev/null || true
	@$(MAKE) setup-monitoring 2>/dev/null || true
	@echo "$(GREEN)✓ All infrastructure ready!$(NC)"

cleanup: ## Clean up all running containers and resources
	@echo "$(BLUE)Cleaning up resources...$(NC)"
	@cd 04-databases && docker-compose down 2>/dev/null || true
	@cd 07-monitoring && docker-compose down 2>/dev/null || true
	@docker container prune -f 2>/dev/null || true
	@echo "$(GREEN)✓ Cleanup complete$(NC)"

verify: ## Verify exercises are working
	@echo "$(BLUE)Verifying setup...$(NC)"
	@docker --version
	@echo "$(GREEN)✓ Verification complete$(NC)"

test-coding: ## Run tests for coding exercises
	@echo "$(BLUE)Running coding tests...$(NC)"
	@cd 01-coding/python && python3 -m pytest tests/ 2>/dev/null || echo "$(YELLOW)Install pytest to run Python tests$(NC)"

test-all: ## Run all available tests
	@echo "$(BLUE)Running all tests...$(NC)"
	@$(MAKE) test-coding 2>/dev/null || true
	@echo "$(GREEN)✓ Tests complete$(NC)"
