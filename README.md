# AKS Keycloak Demo Project

This project demonstrates the automated deployment of an Azure Kubernetes Service (AKS) cluster along with:

- 🛡️ Keycloak (Authentication and Identity Management)
- 🗄️ PostgreSQL Database (as Keycloak's backend)
- 🌐 Static Web Page (access controlled via Keycloak)
- ⚙️ Infrastructure provisioned with **Terraform**
- 🔧 Configuration and deployment handled using **Ansible**
- 🚀 CI/CD pipelines implemented via **GitHub Actions**

## 📁 Project Structure

aks-keycloak-demo/
├── .github/workflows/ # GitHub Actions for rollout, configure, disassemble
├── ansible/ # Ansible playbooks and roles
│ ├── roles/
│ │ ├── keycloak/
│ │ ├── postgres/
│ │ └── web/
│ ├── inventory.ini
│ ├── site.yml
├── terraform/ # Terraform code to provision AKS + networking
│ ├── main.tf, outputs.tf, variables.tf, ...
└── README.md

## 🚀 Features

- **Azure AKS Cluster Setup** using Terraform modules.
- **Keycloak** deployed as a container with custom `values.yaml`.
- **PostgreSQL** provisioned via Ansible and used as Keycloak's DB.
- **Static web server** exposed via LoadBalancer and protected by Keycloak.
- **Infrastructure as Code** (Terraform + Ansible).
- **GitHub Actions** automate rollout, config, and tear-down pipelines.

## 🔧 Tools Used

| Tool        | Purpose                           |
|-------------|-----------------------------------|
| Terraform   | Provisioning AKS + Networking     |
| Ansible     | Deploying Keycloak, PostgreSQL, Web |
| GitHub Actions | CI/CD pipelines                |
| Azure CLI   | Authentication and configuration  |
| Kubernetes  | Cluster orchestration             |

## 🏗️ Setup Instructions

1. Clone Repo

git clone https://github.com/<your-username>/aks-keycloak-demo.git
cd aks-keycloak-demo

2. Terraform Infrastructure

cd terraform
terraform init
terraform apply -auto-approve

3. Configure Kubeconfig

az aks get-credentials --resource-group rg-terraform-backend --name keycloak-aks --overwrite-existing


4. Deploy Apps via Ansible

ansible-playbook -i ansible/inventory.ini ansible/site.yml

## ⚙️ GitHub Actions
🔄 .github/workflows/

rollout.yml: Provisions infra and deploys apps

configure.yml: Configures Keycloak (realms, clients)

disassemble.yml: Destroys infrastructure


#### ✅ Suggested Features to Extend the Project :

🔒 HTTPS Support with Ingress + TLS (Cert-Manager)
How: Add NGINX Ingress Controller and Cert-Manager (Let's Encrypt).

Benefit: Secure HTTPS + routing flexibility.

🔁 Keycloak Realm + Client Import Automation
How: Use keycloak-configure.sh via Ansible to import JSON exports.

Benefit: Saves time and ensures consistent realm setup.

💾 Persistent Volume for PostgreSQL
How: Use Azure Disk or Azure Files.

Benefit: Durable data even if pods restart.

📈 Monitoring and Logging (Prometheus + Grafana + Loki)
How: Deploy monitoring stack using Helm or Ansible.

Benefit: Real-time visibility and diagnostics.

📊 Horizontal Pod Autoscaling (HPA)
How: Define HorizontalPodAutoscaler based on resource usage.

Benefit: Auto-scale app pods under load.

👤 RBAC for Keycloak Admins
How: Define roles in Keycloak and assign permissions.

Benefit: Secure role-based admin access.

🧪 CI/CD Validation Jobs
How:

terraform fmt, terraform validate

ansible-lint

kubectl get pods for smoke testing

Benefit: Prevents errors and keeps code clean.

🛡️ Backup Mechanism
How: Nightly pg_dump + realm export.

Benefit: Disaster recovery & data protection.