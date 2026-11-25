\# PCI-DSS Security Control Mapping



\## Project

\*\*FinServ Digital – Security-Hardened Kubernetes Platform for Financial Microservices\*\*



This document maps the security controls implemented in the project to relevant PCI-DSS v4.0.1 requirements.



| PCI-DSS Requirement | Security Control | Project Implementation |

|---|---|---|

| 1 – Network Security Controls | Network segmentation and traffic restrictions | Separate Kubernetes namespaces and default-deny NetworkPolicies |

| 2 – Secure Configurations | Secure system configuration | Kubernetes RBAC and restricted service accounts |

| 3 – Protect Stored Account Data | Protect sensitive data | HashiCorp Vault KV secrets storage and access policies |

| 5 – Protect Against Malware | Runtime threat detection | Falco monitors suspicious container activity |

| 6 – Secure Systems and Software | Vulnerability management and secure deployment | Trivy image scanning, Jenkins CI/CD and Cosign image signing |

| 7 – Restrict Access | Least-privilege access | Namespace-scoped Kubernetes Roles and RoleBindings |

| 10 – Log and Monitor Access | Security monitoring | Prometheus, Grafana and Falco |

| 12 – Information Security Policies | Incident response procedures | Project incident response playbook |



\## Important Notes



\- This is an educational project mapping, not a PCI-DSS compliance certification.

\- The platform demonstrates selected technical controls; it does not implement or validate every PCI-DSS requirement.

\- Vault was configured in development mode for this demonstration and is not production-ready.

\- No real payment card data or production credentials should be stored in this environment.



\## Conclusion



The project demonstrates selected PCI-DSS-aligned security practices through network segmentation, access control, secrets management, vulnerability scanning, image signing, runtime monitoring and incident response documentation.

