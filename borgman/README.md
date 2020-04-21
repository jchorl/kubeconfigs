# Borgman
Repo: https://github.com/jchorl/borgman

## Keys
When you create API keys in B2, they print the key ID and the key.

The secrets that must be added:
```
$ ls borgman/*.txt
borgman/backblaze_key.txt
borgman/backblaze_key_id.txt
borgman/borg_passphrase.txt
borgman/bucket.txt
```

The keys must then be inserted into Kubernetes with e.g.
```bash
kubectl create secret -n borgman generic backblaze --from-file ./borgman/backblaze_key_id.txt --from-file ./borgman/backblaze_key.txt --from-file ./borgman/bucket.txt
kubectl create secret -n borgman generic borg --from-file ./borgman/borg_passphrase.txt
```

## Initializing borg
Initializing borg is a one-time thing
```bash
j@troy:~$ docker run -it --rm -u 1000:1000 -v /mnt/backup:/mnt/backup ubuntu bash
...
```

Separately:
```bash
j@troy:~$ docker exec -it -u 0:0 a71c6e997a90 bash
root@a71c6e997a90:/# apt-get update && apt-get install -y borgbackup
...
root@a71c6e997a90:/# mkdir /.{config,cache}
root@a71c6e997a90:/# chown 1000:1000 /.{config,cache}
```

Now back to the user shell
```bash
I have no name!@633f62d31a45:/$ borg init --encryption=repokey /mnt/backup
Enter new passphrase: 
Enter same passphrase again: 
```

## Initializing rclone
```bash
j@troy:~$ docker run -it --rm ubuntu bash
root@b01998597975:/# apt-get update && apt-get install -y curl unzip
...
root@b01998597975:/# curl https://rclone.org/install.sh | bash
root@b01998597975:/# rclone config     
2020/04/20 05:55:49 NOTICE: Config file "/root/.config/rclone/rclone.conf" not found - using defaults     
No remotes found - make a new one                                                                         
n) New remote                             
s) Set configuration password                       
q) Quit config                                   
n/s/q> n         
name> remote                                                                                                                                                                                                        
Type of storage to configure.                                                                             
...
b2
# finish the wizard, the account and key aren't important
root@b01998597975:/# cat /root/.config/rclone/rclone.conf 
[remote]
type = b2
hard_delete = true
```
