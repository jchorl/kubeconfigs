# Sheetheus
Prometheus scrapes this to get financial data

## Creds
Run the image locally to get creds in a pickle file, then:
```
docker run -it --rm -v $(pwd)/.kube:/.kube:ro -v $(pwd):/kube -w /kube bitnami/kubectl create secret generic -n sheetheus sheetheus --from-file=./sheetheus/token.pickle
```
