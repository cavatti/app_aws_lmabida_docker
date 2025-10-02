#!/bin/bash
NAME=${1:-mundo}

curl -XPOST "http://localhost:8080/2015-03-31/functions/function/invocations" \
-H "Content-Type: application/json" \
-d "{
  \"httpMethod\": \"GET\",
  \"path\": \"/hello\",
  \"queryStringParameters\": {\"name\": \"$NAME\"},
  \"headers\": {}
}"
echo
