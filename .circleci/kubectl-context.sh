#!/bin/sh
echo $ca | base64 -d > ca.crt
echo $token | base64 -d > token

kubectl config set-credentials circleci --token="$(cat token)"
kubectl config set-cluster kubernetes --server=$apiserver --insecure-skip-tls-verify=true
kubectl config set-context circleci --cluster=kubernetes --user=circleci --namespace=default
kubectl config use-context circleci
chmod 755 ~/.kube/config
