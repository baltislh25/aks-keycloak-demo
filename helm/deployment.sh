#!/bin/bash

# Add Bitnami Helm repo
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# Deploy PostgreSQL
helm upgrade --install postgres bitnami/postgresql \
  --namespace default \
  -f values-postgres.yaml

# Deploy Keycloak with external PostgreSQL
helm upgrade --install keycloak bitnami/keycloak \
  --namespace default \
  -f values-keycloak.yaml

# (Optional) Deploy a static NGINX server
kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/application/deployment.yaml

