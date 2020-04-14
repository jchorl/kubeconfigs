docker run -it --rm -v $(pwd)/.kube:/.kube:ro -v $(pwd):/kube -w /kube bitnami/kubectl -n monitoring logs prometheus-57ccd7d75d-cztj2
