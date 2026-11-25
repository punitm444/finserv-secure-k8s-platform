\# Incident Response Playbook



\## Project

\*\*FinServ Digital – Security-Hardened Kubernetes Platform\*\*



\## 1. Purpose



This playbook describes basic steps for identifying, containing and responding to security incidents in the Kubernetes environment.



\## 2. Common Incident Scenarios



\- Suspicious shell activity inside a container.

\- Unauthorized network communication between namespaces.

\- Vulnerable container images.

\- Exposed or compromised application secrets.

\- Unexpected pod or application behaviour.



\## 3. Incident Response Steps



\### Step 1: Identify



Use Falco logs and Kubernetes events to identify suspicious activity.



```bash

kubectl get pods -A

kubectl get events -A --sort-by=.lastTimestamp

kubectl logs -n falco -l app.kubernetes.io/name=falco --tail=50

```



\### Step 2: Investigate



Inspect the affected workload and review its logs.



```bash

kubectl describe pod <pod-name> -n <namespace>

kubectl logs <pod-name> -n <namespace>

```



\### Step 3: Contain



If a workload is compromised, isolate it by scaling down its deployment or applying an appropriate NetworkPolicy.



```bash

kubectl scale deployment <deployment-name> --replicas=0 -n <namespace>

```



\### Step 4: Recover



After investigating and fixing the issue, redeploy a trusted and verified image.



```bash

kubectl rollout restart deployment/<deployment-name> -n <namespace>

kubectl rollout status deployment/<deployment-name> -n <namespace>

```



\### Step 5: Verify



Confirm that the application is healthy and review relevant security logs.



```bash

kubectl get pods -n <namespace>

kubectl logs -n falco -l app.kubernetes.io/name=falco --tail=50

```



\## 4. Preventive Measures



\- Use namespace-based access restrictions.

\- Follow least-privilege RBAC.

\- Store application secrets in Vault.

\- Scan container images with Trivy.

\- Sign and verify images using Cosign.

\- Monitor suspicious runtime activity with Falco.



\## 5. Important Note



This playbook is designed for an educational project environment. Production incident response would require additional procedures, escalation contacts, evidence preservation and recovery planning.

