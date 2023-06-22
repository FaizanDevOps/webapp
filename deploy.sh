#!/bin/bash



# Start the application using Docker Compose
docker-compose up --build

# Wait for the application to be ready
sleep 25

# Install and upgrade Helm chart
helm upgrade --install webapp ./webapp

# Wait for the deployment to be ready
kubectl rollout status deployment/webapp


#get the application URL


NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services webapp)
NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
echo "WebApp can be accessed at: http://$NODE_IP:$NODE_PORT"
