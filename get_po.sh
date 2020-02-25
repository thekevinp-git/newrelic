#!/bin/bash

CONTEXTS="ops-green.us-east-1.core.shuttercloud.org apps-dev-blue.us-east-1.core.shuttercloud.org apps-qa-blue.us-east-1.core.shuttercloud.org apps-prod-blue.us-east-1.core.shuttercloud.org"

for CONTEXT in $CONTEXTS; do
  ### LOGFILE="/tmp/a10-data/"$SERVER"_"$(date +"%Y.%m.%d-%H.%M.%S").log
  echo "CONTEXT: $CONTEXT"
  `kubectl config set current-context $CONTEXT`
  echo "getConfig : `kubectl config current-context`"
  `kubectl get svc --all-namespaces > $CONTEXT"_services_"$(date +"%Y.%m.%d-%H.%M.%S").txt`
  `kubectl get cronjob --all-namespaces > $CONTEXT"_cronjob_"$(date +"%Y.%m.%d-%H.%M.%S").txt`
  `kubectl get job --all-namespaces > $CONTEXT"_jobs_"$(date +"%Y.%m.%d-%H.%M.%S").txt`
done
