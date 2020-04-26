# ddns
This is really just a cron that curls /update and reports metrics

## Setup
It requires a secret
```bash
kubectl -n ddns create secret generic auth --from-literal=token=<token>
```
