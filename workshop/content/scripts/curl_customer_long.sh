export INGRESS_GATEWAY=$(oc get route istio-ingressgateway -n user1-smcp -o 'jsonpath={.spec.host}')
while :; do sleep 1; curl http://${INGRESS_GATEWAY} ; done
