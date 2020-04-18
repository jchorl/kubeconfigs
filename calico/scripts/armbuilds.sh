set -eux

# old manifests can be cleaned out of .docker/manifests

version=v3.13.2

for img in cni node pod2daemon-flexvol; do
    echo $img:$version

    docker pull calico/$img:$version
    docker tag calico/$img:$version jchorl/$img:$version
    docker push jchorl/$img:$version
    docker manifest create jchorl/$img:latest jchorl/$img:$version jchorl/$img:latest-arm
    docker manifest annotate jchorl/$img:latest jchorl/$img:$version
    docker manifest annotate jchorl/$img:latest jchorl/$img:latest-arm --os linux --arch arm
    docker manifest push jchorl/$img:latest

    echo done
done
