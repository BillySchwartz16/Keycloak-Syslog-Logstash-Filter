# Keycloak with ELK Stack

This repository sets up a Keycloak server with an ELK (Elasticsearch, Logstash, Kibana) stack using Docker and Docker Compose. It adds grok/kv filters to parse out the message field, which is useful for org.keycloak.events

## Prerequisites

- Docker
- Docker Compose

## Services

- **Keycloak**: Identity and access management server.
- **Elasticsearch**: Search and analytics engine.
- **Kibana**: Visualization tool for Elasticsearch.
- **Logstash**: Data processing pipeline for Elasticsearch.
- **MariaDB**: Database server.

## Setup

1. Clone the repository:
    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. Start the services:
    ```sh
    docker-compose up -d
    ```

## Configuration

### Keycloak

The Keycloak server is built using the [Dockerfile](http://_vscodecontentref_/0) provided in the repository. It is configured with the following environment variables:

- `KEYCLOAK_ADMIN`: Admin username (default: `admin`)
- `KEYCLOAK_ADMIN_PASSWORD`: Admin password (default: `admin`)
- `KC_DB`: Database type (default: `mariadb`)
- `KC_DB_URL`: Database URL
- `KC_DB_USERNAME`: Database username
- `KC_DB_PASSWORD`: Database password
- `KC_HOSTNAME`: Hostname
- `KC_HTTP_ENABLED`: Enable HTTP (default: `true`)
- `KC_HTTP_PORT`: HTTP port (default: `8080`)
- `KC_LOG`: Log output (default: `syslog,console`)
- `KC_LOG_LEVEL`: Log level (default: `org.keycloak.events:debug,info`)
- `KC_LOG_SYSLOG_LEVEL`: Syslog log level (default: `debug`)
- `KC_LOG_SYSLOG_ENDPOINT`: Syslog endpoint
- `KC_LOG_SYSLOG_TYPE`: Syslog type (default: `rfc3164`)

### ELK Stack

- **Elasticsearch**: Configured to run as a single node with memory locking enabled.
- **Kibana**: Configured to connect to the Elasticsearch service.
- **Logstash**: Configured to process syslog messages and send them to Elasticsearch.

### MariaDB

- `MYSQL_ROOT_PASSWORD`: Root password (default: `root`)
- `MYSQL_DATABASE`: Database name (default: `keycloak`)
- `MYSQL_USER`: Database user (default: `keycloak`)
- `MYSQL_PASSWORD`: Database password (default: `keycloak`)

## Logstash Configuration

The Logstash configuration is located in [logstash.conf](http://_vscodecontentref_/1). It is set up to process syslog messages and extract key-value pairs from the log messages.

## Accessing the Services

- **Keycloak**: [http://localhost:8080](http://localhost:8080)
- **Elasticsearch**: [http://localhost:9200](http://localhost:9200)
- **Kibana**: [http://localhost:5601](http://localhost:5601)

## Stopping the Services

To stop the services, run:
```sh
docker-compose down