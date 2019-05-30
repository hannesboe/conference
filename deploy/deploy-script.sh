#!/bin/bash

set -eu
helm install --name neo4j stable/neo4j --namespace persistence -f neo4j/neo4j.yaml 

