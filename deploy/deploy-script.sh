#!/bin/bash

# prerequites helm, kubectl and minikube installation for local builds is in place and minikube is up and running!
set -e

function setUpLocalEnv() {
  echo "setting up for deployment with local minikube"
  eval $(minikube docker-env)
  export mkip=$(minikube ip)
  export API_URL=conference-api.$mkip.nip.io
  export UI_URL=conference-ui.$mkip.nip.io
  [ "$(kubectl config current-context)" == "minikube" ] && echo "local environment setup for minikube" || echo "minikube not configured properly" exit 1;

}

if [ -z "$1" ] || [ "$1" == "local" ]; then 
	setUpLocalEnv
else
 # consider this as an extension point for setting up differnt docker registries, domains and kubernetes clusters
 echo "Currently only local environment is supported"
 exit 1
fi


#installing neo4j enterprise edition with 


#set up docker context ()

docker build -t conference_data:1 neo4j/initData/

#todo set init container verion for plugins here
helm install --name neo4j stable/neo4j --namespace persistence -f neo4j/neo4j.yaml 

# adding bolt port to service routing
kubectl patch service --namespace persistence neo4j-neo4j --patch "$(cat neo4j/service-port-patch.yaml)"
# adding prometheus headers


### api -server deplomynet

neo_cluster=bolt://neo4j-neo4j.persistence:768

docker build -t conference-api:1 --build-arg NEO4J_URI=$neo_cluster --no-cache ../api/

kubectl create configmap apollo-config --from-env-file api/configmap.properties

kubectl apply -f api/deployment.yaml
kubectl apply -f api/service.yaml

### ui -server deployment

docker build -t conference-ui:1 --build-arg GRAPH_URI=http://$API_URL --no-cache ../ui/ 

kubectl apply -f ui/deployment.yaml
kubectl set env deployment/ui VUE_APP_GRAPHQL_HTTP=http://$API_URL

kubectl apply -f ui/service.yaml



## ingress deployment

minikube addons enable ingress

helm install --name ingress stable/nginx-ingress --namespace ingress-nginx --set controller.metrics.enabled=true

sed -e "s/\UI_URL/$UI_URL/" -e "s/\API_URL/$API_URL/" ingress/ingress.yaml | kubectl apply -f - -n ingress-nginx


# prometheus & grafana
# https://github.com/kubernetes/ingress-nginx/blob/master/docs/user-guide/monitoring.md

helm install stable/nginx-ingress --name nginx-controller --namespace nginx-ingress

kubectl apply --kustomize github.com/kubernetes/ingress-nginx/deploy/prometheus/
kubectl apply --kustomize github.com/kubernetes/ingress-nginx/deploy/grafana/
