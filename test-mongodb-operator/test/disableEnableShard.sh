#!/bin/bash

set -ex

kubectl apply -f cr-shard.yaml
sleep 80s
kubectl patch perconaservermongoDB mongodb-cluster --type merge -p='{"spec":{"sharding":{"enabled":false}}}'
sleep 80s
# kubectl apply -f cr-shard.yaml
kubectl patch perconaservermongoDB mongodb-cluster --type merge -p='{"spec":{"sharding":{"enabled":true}}}'
sleep 80s
