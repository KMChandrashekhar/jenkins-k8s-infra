# Jenkins K8s Infrastructure

Complete Jenkins + Kubernetes lab setup managed as code.

## Structure
```
jenkins-k8s-infra/
├── docker/
│   ├── master/     → Jenkins Master setup
│   └── agent/      → Jenkins Agent Dockerfile + scripts
├── app/
│   └── website/    → Sample HTML app + Dockerfile
├── k8s/
│   ├── jenkins/    → K8s manifests for Jenkins
│   └── app/        → K8s manifests for the app
└── jenkins/
    └── pipelines/  → Jenkinsfile pipeline definitions
```

## Quick Start

### Docker Setup
```bash
# 1. Start Jenkins Master
cd docker/master && ./run.sh

# 2. Build Agent image
cd docker/agent && ./build.sh

# 3. Start Agent (get secret from Jenkins UI first)
cd docker/agent && ./run.sh <SECRET_TOKEN>
```

### K8s Setup
```bash
# Install Jenkins via Helm
helm repo add jenkins https://charts.jenkins.io
helm install jenkins jenkins/jenkins -n jenkins \
  --set controller.serviceType=NodePort \
  --set controller.nodePort=32000

# Deploy app
kubectl apply -f k8s/app/
```

