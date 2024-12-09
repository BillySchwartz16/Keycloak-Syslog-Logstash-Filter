# Use the official Keycloak 26 image as the base
FROM quay.io/keycloak/keycloak:26.0.0

# Set environment variables for the admin user
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Expose the default HTTP port
EXPOSE 8080

# Set the working directory
WORKDIR /opt/keycloak

# Start Keycloak in development mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
