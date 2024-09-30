# Cloud Technologies Advanced - Grid Dynamics
Cloud Technologies Advanced - Grid Dynamics

1. Horizontal Pod Autoscaler

This is installed as an add-on within the GKE scope.

2. Metrics Server

Install Metrics Server:

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

---

3. External Secrets Operator

I pose insufficient permissions to attach roles to the newly created service accounts.
There is a need to create Service Account manifest and attach an appropriate workload.
The default service account has not the Secret Manager Aaccessor role attachted.

Install External Secrets:

```bash
helm repo add external-secrets https://charts.external-secrets.io

helm install external-secrets \
   external-secrets/external-secrets \
    -n external-secrets \
    --create-namespace \
```
---

4. KEDA

Add the KEDA Helm Repository:

```bash
helm repo add kedacore https://kedacore.github.io/charts
helm repo update
```

Install KEDA in the `keda` namespace:

```bash
helm install keda kedacore/keda --namespace keda --create-namespace
```

---

All the draft manifests are located in the specific directories.
