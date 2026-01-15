#  Global Population Data Pipeline

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![Docker](https://img.shields.io/badge/docker-ready-blue.svg)](https://www.docker.com/)

> Automated ETL pipeline for global population data with real-time streaming capabilities

## Overview

An automated ETL pipeline that extracts global population data from [Worldometers](https://www.worldometers.info/world-population/population-by-country/), processes it using Apache Airflow, and stores it in PostgreSQL, AWS S3, and BigQuery. Supports both batch processing and real-time streaming with Kafka.

## Architecture

![System Architecture](images/Structure.png)
![Pipeline Flow](images/pipeline.png)
![Time Flow](images/time_spent_flow.png)

## Key Features

- **Web Scraping**: Automated data extraction using BeautifulSoup
- **Workflow Orchestration**: Apache Airflow for ETL automation
- **Data Storage**: PostgreSQL for transactional data, AWS S3 for data lake
- **Real-Time Streaming**: Kafka for event-driven data processing
- **Infrastructure as Code**: Terraform for AWS resource provisioning
- **Containerized**: Docker Compose for easy deployment

## Technology Stack

| Component | Technology |
|-----------|-----------|
| **Orchestration** | Apache Airflow |
| **Database** | PostgreSQL |
| **Streaming** | Apache Kafka |
| **Cloud Storage** | AWS S3 |
| **Data Warehouse** | Google BigQuery |
| **IaC** | Terraform |
| **Containers** | Docker & Docker Compose |
| **Monitoring** | Grafana |

## Prerequisites

- Docker & Docker Compose
- Python 3.8+
- AWS CLI (for S3 authentication)
- Git

## Quick Start

### 1. Clone Repository

```bash
git clone https://github.com/EbEmad/Global-Population-Data-Pipeline.git
cd Global-Population-Data-Pipeline
```

### 2. Configure Environment

Create a `.env` file with your credentials:

```env
# PostgreSQL
POSTGRES_USER=your_user
POSTGRES_PASSWORD=your_password
POSTGRES_DB=population_db

# Kafka
KAFKA_BROKER=kafka:9092

# AWS
AWS_ACCESS_KEY_ID=""
AWS_SECRET_ACCESS_KEY=""
AWS_DEFAULT_REGION=""
S3_BUCKET_NAME=""

# Airflow
AIRFLOW_UID=50000
```

### 3. Start Services

```bash
docker-compose up -d --build
```

### 4. Access Services

| Service | URL | Credentials |
|---------|-----|-------------|
| Airflow | http://localhost:8080 | admin / admin |
| Grafana | http://localhost:3000 | admin / admin |

## Usage

### Run Pipeline via Airflow UI
1. Open http://localhost:8080
2. Find `population_data_pipeline` DAG
3. Click "Trigger DAG"

### Run Pipeline via CLI
```bash
docker-compose exec airflow-webserver airflow dags trigger population_data_pipeline
```

### Query Data

**PostgreSQL:**
```bash
docker-compose exec postgres psql -U your_user -d population_db
```

