# Intelligent Information Systems 2 - Data Warehouse Project

A mini data warehouse (DWH) for the Nordwind company, consisting of a Staging Area and a Data Mart, built with KNIME and PostgreSQL.

## Group Members

- Adrian Martinez (maiz)
- Jason Nguyen (nguyejas)

## Prerequisites

- Docker
- KNIME Analytics Platform 5.11.0

## Setup

Clone the repository:

```bash
git clone https://github.com/beybasa/dwh_project.git
cd dwh_project
```

Start the database:

```bash
docker compose up -d
```

This starts a PostgreSQL 18.3 instance on port 5433 and automatically creates the staging and datamart schemas. To verify it is running:

```bash
docker exec -it iis2_dwh_postgres psql -U iis2 -d nordwind -c "\dn"
```

## Running

TODO: Explain staging area and data mart workflows
