# ECS Project for Threat Composer App

This project deploys the Threat Composer application using Amazon Elastic Container Service (ECS) and Terraform, with automated CI/CD pipelines managed by GitHub Actions.

## 1. Project Overview

(Add further details on what the project is about e.g. overview of requirements and details on the app being deployed)


## 2. Dockerfile Optimisation

The `Dockerfile` used to build the Threat Composer application's container image has been optimised for size and efficiency. Key optimisations include:

* **Multi-stage builds:** Utilising multi-stage builds to reduce the final image size by only including necessary runtime dependencies.
* **Base image selection:** Choosing a minimal base image suitable for the application's runtime environment (e.g., `node:alpine`).
* **Minimising unnecessary files:** Ensuring that only required files are copied into the final image.

## 3. Terraform Infrastructure

Terraform is used to provision and manage the entire AWS infrastructure for the Threat Composer application. Key aspects of the Terraform implementation include:

* **Remote State:**
    * Terraform state is stored remotely in an Amazon S3 bucket. This ensures state persistence and enables collaboration by preventing state conflicts.
* **Modular Design:**
    * The infrastructure is built using Terraform modules for each component, including:
        * VPC (Virtual Private Cloud)
        * ALB (Application Load Balancer)
        * Route53 (DNS)
        * ECS (Elastic Container Service)
    * This modular approach promotes code reusability and maintainability.
* **DRY Principle:**
    * The "Don't Repeat Yourself" (DRY) principle is strictly adhered to. Common configurations and resources are abstracted into modules to avoid hardcoding.
* **Variable Management:**
    * All variable values, including sensitive information, are stored in a `terraform.tfvars` file. This separates configuration from code and protects sensitive data.


## 4. CI/CD Pipelines with GitHub Actions

GitHub Actions automates the build, deployment, and management of the Threat Composer application. Secrets, such as AWS access keys, are securely stored as GitHub Secrets to protect sensitive information across all workflows. Three pipelines are implemented:

* **Docker Image Build and Push:**
    * This pipeline builds the Docker image from the `Dockerfile` and pushes it to Amazon ECR (Elastic Container Registry).
    * It is triggered automatically on pushes when changes are detected in the `app` code directory or the `Dockerfile`.
* **Terraform Apply:**
    * This pipeline applies the Terraform code to provision or update the AWS infrastructure.
    * This pipeline is triggered automatically on pushes when changes are detected in the `terraform` directory.
* **Terraform Destroy:**
    * This pipeline destroys the AWS infrastructure created by Terraform.
    * It is triggered manually to prevent accidental deletion of resources.

## 5. Security and Static Analysis

Security and static analysis tools are integrated into the CI/CD pipelines to enhance code quality and security:

* **Trivy:**
    * Trivy is used to scan the Docker image for vulnerabilities before it is pushed to ECR.
    * This ensures that the deployed image is free from known security flaws.
* **TFLint:**
    * TFLint is used to lint the Terraform code, checking for best practices and potential errors.
    * This helps ensure that the infrastructure code is well-formed and follows recommended guidelines.
* **Checkov:**
    * Checkov is used to perform static code analysis on the Terraform code, checking for security misconfigurations.
    * This helps identify and prevent potential security vulnerabilities in the infrastructure.