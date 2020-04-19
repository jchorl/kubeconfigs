# Running pihole on k8s

## Port issues
1. Node ports only allow ports > 30000, so pihole must use `hostNetwork: true`
1. `systemd-resolved` takes port 53 - follow https://unix.stackexchange.com/a/358485
