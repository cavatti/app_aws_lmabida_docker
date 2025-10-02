#!/bin/bash

# Pega o primeiro parâmetro passado, ou usa "mundo" como padrão
NAME=${1:-mundo}

# Envia evento JSON completo para o Lambda container local
curl -s -XPOST "http://localhost:8080/2015-03-31/functions/function/invocations" \
-H "Content-Type: application/json" \
-d "{
  \"version\": \"2.0\",
  \"routeKey\": \"GET /hello\",
  \"rawPath\": \"/hello\",
  \"rawQueryString\": \"name=$NAME\",
  \"headers\": {},
  \"queryStringParameters\": {\"name\": \"$NAME\"},
  \"requestContext\": {
    \"http\": {
      \"method\": \"GET\",
      \"path\": \"/hello\",
      \"sourceIp\": \"127.0.0.1\",
      \"userAgent\": \"curl/8.2.1\"
    }
  },
  \"body\": null,
  \"isBase64Encoded\": false
}" | jq -r '.body | fromjson'

# Quebra de linha no terminal
echo
