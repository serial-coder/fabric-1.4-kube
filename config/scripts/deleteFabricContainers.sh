eval $(minikube docker-env)
kubectl delete -f ../kube/orderer.yaml
kubectl delete -f ../kube/peer0-green-airline.yaml
kubectl delete -f ../kube/peer0-green-agencies.yaml
kubectl delete -f ../kube/peer0-blue-airline.yaml
kubectl delete -f ../kube/peer0-blue-agencies.yaml
kubectl delete -f ../kube/peer0-further.yaml
kubectl delete -f ../kube/cli.yaml
