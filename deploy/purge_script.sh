#!/bin/bash

set -e

helm delete neo4j --purge

kubectl delete service ui
kubectl delete deployment ui

kubectl delete service apollo
kubectl delete deployment apollo
kubectl delete configmap apollo-config

kubectl delete ingress conference-ingress
