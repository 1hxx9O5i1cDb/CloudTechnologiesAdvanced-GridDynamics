1. Metrics Server

Install Metrics Server:

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

---

2. External Secrets Operator

I am insufficient permissions to attach roles to the newly created service accounts. These manifest will be a draft.
The default service account has not the accessor role attachted.

Install External Secrets:

```bash
helm repo add external-secrets https://charts.external-secrets.io

helm install external-secrets \
   external-secrets/external-secrets \
    -n external-secrets \
    --create-namespace \
```

Create the Manifests

---

3. KEDA

Add the KEDA Helm Repository:

```bash
helm repo add kedacore https://kedacore.github.io/charts
helm repo update
```

Install KEDA in the `keda` namespace:

```bash
helm install keda kedacore/keda --namespace keda --create-namespace
```





