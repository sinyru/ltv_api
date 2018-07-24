#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/rdates"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "rdate": {
      "start_date": "2018-02-01",
      "end_date": "2018-03-01"
    }
  }'

echo
