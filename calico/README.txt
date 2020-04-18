from https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

downloaded from https://docs.projectcalico.org/v3.13/manifests/calico.yaml

calico doesnt currently build for arm, so I forked it and built it for arm

there are 5 images involved:
node, go-build, bpftool, bird, cni-plugin

and some deps:
node -> go-build
node -> bpftool
node -> bird
cni-plugin -> go-build
