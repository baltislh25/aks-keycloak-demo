#!/bin/bash

KEYCLOAK_URL="http://keycloak.keycloak.svc.cluster.local:8080"
REALM_FILE="/tmp/realm-export.json"
ADMIN_USER="admin"
ADMIN_PASSWORD="admin"

# Get admin access token
TOKEN=$(curl -s \
  -d "client_id=admin-cli" \
  -d "username=${ADMIN_USER}" \
  -d "password=${ADMIN_PASSWORD}" \
  -d "grant_type=password" \
  "${KEYCLOAK_URL}/realms/master/protocol/openid-connect/token" | jq -r .access_token)

# Import the realm (you can also create clients/users/roles using API)
curl -s -X POST "${KEYCLOAK_URL}/admin/realms" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Content-Type: application/json" \
  --data @"${REALM_FILE}"

echo "✅ Realm imported successfully."
