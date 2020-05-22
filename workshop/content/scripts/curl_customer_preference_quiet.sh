#!/bin/sh

export CURL_POD=$(oc get pods -n user1-tutorial -l app=curl | grep curl | awk '{ print $1}' )
export CUSTOMER_POD=$(oc get pods -n user1-tutorial -l app=customer | grep customer | awk '{ print $1}' )

echo "A load generating script is running in the next step. Ctrl+C to stop"

while :; do 

# echo "Executing curl in curl pod"
oc exec -n user1-tutorial $CURL_POD -- curl -s http://preference:8080 > /dev/null
sleep 0.5

# echo "Executing curl in customer pod"
oc exec -n user1-tutorial $CUSTOMER_POD -c customer -- curl -s http://preference:8080 > /dev/null

sleep 0.5

done

