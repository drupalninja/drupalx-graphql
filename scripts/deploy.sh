#!/bin/bash

export TERMINUS_HIDE_GIT_MODE_WARNING=1

echo "Running terminus drush drupalx-decoupled.dev si -- -y drupalx_graphql"

set -e # Exit immediately if a command exits with a non-zero status.

# Run the terminus command and capture its output
output=$(terminus drush drupalx-decoupled.dev si -- -y drupalx_graphql)

echo "Command output:"
echo "$output"

# Extract DRUPAL_CLIENT_ID for Previewer
DRUPAL_CLIENT_ID=$(echo "$output" | awk '/--- Previewer ---/{flag=1; next} /DRUPAL_CLIENT_ID=/{if(flag==1) {print $1; flag=0}}' | cut -d'=' -f2)

# Extract DRUPAL_CLIENT_SECRET for Previewer
DRUPAL_CLIENT_SECRET=$(echo "$output" | awk '/--- Previewer ---/{flag=1; next} /DRUPAL_CLIENT_SECRET=/{if(flag==1) {print $1; flag=0}}' | cut -d'=' -f2)

# Check if the values were successfully extracted
if [ -z "$DRUPAL_CLIENT_ID" ] || [ -z "$DRUPAL_CLIENT_SECRET" ]; then
  echo "Failed to extract DRUPAL_CLIENT_ID or DRUPAL_CLIENT_SECRET"
  exit 1
fi

echo "DRUPAL_CLIENT_ID: $DRUPAL_CLIENT_ID"
echo "DRUPAL_CLIENT_SECRET: $DRUPAL_CLIENT_SECRET"

terminus drush drupalx-decoupled.dev cr

echo -n "$DRUPAL_CLIENT_ID" | vercel env add DRUPAL_CLIENT_ID production --force
echo -n "$DRUPAL_CLIENT_SECRET" | vercel env add DRUPAL_CLIENT_SECRET production --force

echo "Deploying to Vercel..."

# Deploy to Vercel
curl -X POST -H "Content-Type: application/json" https://api.vercel.com/v1/integrations/deploy/prj_YmQ0eV8HSqQ1AhDsxpsTfmKdotSt/KrCZvy8LfY
