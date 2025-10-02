# FastAPI + AWS Lambda Docker

Este projeto é um exemplo de aplicação simples utilizando **FastAPI** rodando em **AWS Lambda via container**, com a biblioteca **Mangum** para adaptar a aplicação ao ambiente Lambda.

---

## Estrutura do projeto

O projeto contém os seguintes arquivos principais:

- `app.py`: contém a aplicação FastAPI e o handler do Lambda.
- `Dockerfile`: define como construir a imagem Docker para o Lambda.
- `requirements.txt`: lista as dependências Python do projeto.
- `test.sh`: script para testar a aplicação localmente enviando eventos simulando o API Gateway.

---

## Pré-requisitos

- **Docker** para construir e executar a imagem do Lambda container.
- **curl** para enviar requisições HTTP ao container local.
- **jq** para exibir a resposta do Lambda de forma legível.

---

## Como rodar localmente

1. Construir a imagem Docker.
2. Executar o container.
3. Testar a aplicação usando `test.sh` ou `curl`. O script monta automaticamente o JSON completo e exibe a resposta de forma legível.

---

## Observações importantes

- Não é possível abrir o `localhost` no navegador diretamente, pois o Lambda container local espera **requisições POST com JSON de evento**.
- O script `test.sh` facilita o teste local e garante que o evento enviado tenha todos os campos necessários, incluindo `sourceIp`.
