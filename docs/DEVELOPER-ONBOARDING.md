\# Developer Onboarding Guide



\## Project

\*\*FinServ Digital – Security-Hardened Kubernetes Platform\*\*



\## 1. Project Overview



This project demonstrates a security-hardened Kubernetes platform for financial microservices using AWS, Terraform, Ansible, Jenkins and Kubernetes.



\## 2. Technology Stack



\- AWS EC2 and Amazon ECR

\- Terraform

\- Ansible

\- Docker

\- Kubernetes (K3s)

\- Jenkins

\- HashiCorp Vault

\- Falco

\- Trivy and Cosign

\- Prometheus and Grafana



\## 3. Kubernetes Namespaces



The platform separates workloads into four namespaces:



| Namespace | Purpose |

|---|---|

| finserv-accounts | Account services |

| finserv-payments | Payment services |

| finserv-transactions | Transaction services |

| finserv-customers | Customer services |



\## 4. Useful Kubernetes Commands



Check cluster nodes:



```bash

kubectl get nodes

```



List namespaces:



```bash

kubectl get namespaces

```



List pods across namespaces:



```bash

kubectl get pods -A

```



Check deployments:



```bash

kubectl get deployments -A

```



Check services:



```bash

kubectl get services -A

```



Check autoscaling:



```bash

kubectl get hpa -A

```



\## 5. CI/CD Workflow



1\. Developer pushes code to GitHub.

2\. Jenkins retrieves the source code.

3\. Jenkins builds the Docker image.

4\. Jenkins performs an application health check.

5\. The image is pushed to Amazon ECR.

6\. Trivy scans the image for vulnerabilities.

7\. Cosign signs and verifies the container image.



\## 6. Security Guidelines



\- Use the assigned namespace for application workloads.

\- Follow least-privilege access policies.

\- Do not store credentials in source code.

\- Use Vault for secrets management.

\- Follow NetworkPolicy restrictions.

\- Scan and sign container images before deployment.

\- Review Falco alerts for suspicious container activity.



\## 7. Monitoring



Prometheus collects metrics from the Kubernetes environment.



Grafana provides dashboards for monitoring system and application metrics.



Falco detects suspicious runtime activity inside containers.



\## 8. Important Note



This guide describes the educational project environment. Access credentials, cluster endpoints and deployment permissions must be provided separately by the project administrator.

