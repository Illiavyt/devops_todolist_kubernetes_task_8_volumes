#!/bin/bash

# Створення namespace mateapp...
kubectl create namespace mateapp --dry-run=client -o yaml | kubectl apply -f -

# Створення PersistentVolume
kubectl apply -f pv.yml -n mateapp

# Створення PersistentVolumeClaim
kubectl apply -f pvc.yml -n mateapp

# Застосування ConfigMap та Secret
kubectl apply -f configmap.yml -n mateapp
kubectl apply -f secret.yml -n mateapp

# Розгортання ToDo застосунку
kubectl apply -f deployment.yml -n mateapp

# Усі ресурси створено
kubectl get all -n mateapp
