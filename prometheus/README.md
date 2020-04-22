# AlertManager
## Config
SendGrid API key and to email address are stored in secrets so they need not be checked into source control
```bash
kubectl create secret -n monitoring generic alertmanager --from-file ./prometheus/sendgrid_api_key.txt --from-file ./prometheus/to_email.txt
```
