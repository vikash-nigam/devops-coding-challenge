# DevOps Coding Challenge

## Project Overview

This project is a **Spring Boot Application** deployed using **Helm, Docker, and Terraform**. It includes configurations for Kubernetes (K8s) monitoring using Prometheus and automated deployment.

## Features

- Spring Boot application setup
- Helm charts for Kubernetes deployment
- Docker support
- Terraform configurations for AWS infrastructure
- Prometheus monitoring setup

## Prerequisites

Ensure you have the following installed:

- Docker
- Kubernetes (Minikube or any cluster)
- Helm
- Terraform
- AWS CLI (for cloud deployments)
- Git

## Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/your-repo/devops-coding-challenge.git
cd devops-coding-challenge
```

### 2. Build the Docker Image

```bash
docker build -t my-springboot-app .
```

### 3. Run with Docker

```bash
docker run -p 8080:8080 my-springboot-app
```

### 4. Deploy to Kubernetes using Helm

```bash
helm upgrade --install my-app ./springboot-app
```

### 5. Deploy AWS Infrastructure with Terraform

```bash
cd terraform
terraform init
terraform apply
```

## Monitoring with Prometheus

To install Prometheus with Helm:

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack -f values.yaml
```

## File Structure

```
├── Dockerfile
├── terraform/
│   ├── eks/
│   ├── rds/
├── springboot-app/
│   ├── templates/
│   ├── values.yaml
│   ├── Chart.yaml
├── src/
│   ├── main/
│   ├── resources/
│   │   ├── application.yml
└── README.md
```

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a pull request.

## License

This project is licensed under the MIT License.


