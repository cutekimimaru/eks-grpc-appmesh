
## AppMesh
```bash
./docker_build.sh

kubectl create -f kubernetes/greeter-server.yaml
kubectl create -f kubernetes/greeter-client.yaml

kubectl logs  greeter-client-round-robin
```
