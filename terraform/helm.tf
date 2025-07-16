# Create namespace
resource "kubernetes_namespace" "keycloak" {
  metadata {
    name = "keycloak"
  }
}

# PostgreSQL
resource "helm_release" "postgres" {
  name       = "postgres"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  namespace  = kubernetes_namespace.keycloak.metadata[0].name

  set {
    name  = "auth.postgresPassword"
    value = "postgres123"
  }

  set {
    name  = "auth.username"
    value = "keycloak"
  }

  set {
    name  = "auth.password"
    value = "keycloak123"
  }

  set {
    name  = "auth.database"
    value = "keycloakdb"
  }
}

# Keycloak
resource "helm_release" "keycloak" {
  name       = "keycloak"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "keycloak"
  namespace  = kubernetes_namespace.keycloak.metadata[0].name

  depends_on = [helm_release.postgres]

  set {
    name  = "auth.adminUser"
    value = "admin"
  }

  set {
    name  = "auth.adminPassword"
    value = "admin123"
  }

  set {
    name  = "externalDatabase.host"
    value = "postgres.keycloak.svc.cluster.local"
  }

  set {
    name  = "externalDatabase.user"
    value = "keycloak"
  }

  set {
    name  = "externalDatabase.password"
    value = "keycloak123"
  }

  set {
    name  = "externalDatabase.database"
    value = "keycloakdb"
  }
}
