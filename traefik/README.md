# Ingress
Traefik is configured to use a forward auth provider. It uses google for auth.

## Auth domain
The forward auth provider allows you to use one domain for all auth. There's some extre config for that, particularly:
1. Env variables to the provider container
1. An ingress spec, so traefik provisions certs for the auth domain and redirects work

## Secrets
Fill the files in traefik: `google_client_id`, `google_client_secret`, `forward_auth_secret`
`kubectl create secret -n kube-system generic ingress --from-file ./traefik/google_client_id --from-file
 ./traefik/google_client_secret --from-file ./traefik/forward_auth_secret`

## Setup
https://github.com/thomseddon/traefik-forward-auth#provider-setup
