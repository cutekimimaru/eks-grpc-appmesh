# eks-grpc-appmesh
> A demostration for integrating AWS AppMesh with gRPC

## How ?
1. Prepare the docker images for the gRPC example greeter-server and greeter-client and push to AWS ECR
2. Setup AWS AppMesh with the [https://docs.aws.amazon.com/app-mesh/latest/userguide/getting-started-kubernetes.html](reference) 
3. Deploy K8S pods with the yaml files inside `kubernetes/` of this repo
4. Check the traffic between greeter-client and greeter-server by the following command

```bash
kubectl logs  greeter-client-round-robin
```

## Health Checking
> The implementation for both kubernetes pod and AWS AppMesh's virtual node are required.

#### Kubernetes
1. Choose a binary file [https://github.com/grpc-ecosystem/grpc-health-probe/releases](here)
2. Wrap the downloaded binary file into the docker image
3. Configure readiness probe and liveness probe with the [https://kubernetes.io/blog/2018/10/01/health-checking-grpc-servers-on-kubernetes/](reference) or take a look at file `deployment-greeter-server.yaml` inside the `kubernetes/` of this repo 

#### AppMesh
1. Refer to the [https://github.com/aws/aws-app-mesh-examples/blob/5a2d04227593d292d52e5e2ca638d808ebed5e70/walkthroughs/howto-k8s-grpc/color_server/main.go#L52-L60](sample code) and implement them into your gRPC service
2. Refer to the file `app-mesh-greeter-server.yaml` and configure listener for your virtual node links to the gRPC service mentioned in 1. above
 
