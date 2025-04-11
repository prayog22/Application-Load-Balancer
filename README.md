# ☁️ AWS EC2 with Apache, VPC & Bitbucket Pipelines using Terraform

This project uses **Terraform** to provision a complete AWS environment including a custom **VPC**, **Security Groups**, and an **EC2 instance** with **Apache installed** via a startup script. It also integrates **Bitbucket Pipelines** for CI/CD.

---

## 📁 Project Structure

| File                    | Description |
|-------------------------|-------------|
| `backend.tf`            | Configures the remote backend for storing Terraform state (e.g., S3 + DynamoDB). |
| `bitbucket-pipelines.yml` | Automates Terraform commands in CI/CD. |
| `install-apache.sh`     | User data script to install Apache on the EC2 instance. |
| `instance.tf`           | Provisions the EC2 instance and attaches the startup script. |
| `main.tf`               | Root module that ties all components together. |
| `output.tf`             | Declares output values like instance public IP. |
| `provider.tf`           | Specifies AWS provider and region. |
| `security-group.tf`     | Creates security groups (e.g., allow SSH and HTTP). |
| `variable.tf`           | Defines input variables. |
| `vpc.tf`                | Sets up custom VPC, subnets, IGW, and route tables. |

---

## 🧱 Prerequisites

- [Terraform](https://www.terraform.io/downloads)
- AWS CLI configured (`~/.aws/credentials`)
- Bitbucket Pipelines enabled
- S3 bucket & DynamoDB table (if using remote backend)

---

## ⚙️ Setup & Usage

### 1. Clone the Repository

```bash
git clone https://github.com/prayog22/Application-Load-Balancer.git
```
