# FastAPI + AWS Lambda Docker

Este projeto é um exemplo de aplicação simples utilizando **FastAPI** rodando em **AWS Lambda via container**, com a ajuda da biblioteca **Mangum** para adaptar a aplicação ao ambiente Lambda.

---

## Estrutura do projeto

O projeto contém os seguintes arquivos principais:

- `app.py`: contém a aplicação FastAPI e o handler do Lambda.
- `Dockerfile`: define como construir a imagem Docker para o Lambda.
- `requirements.txt`: lista as dependências Python do projeto.
- `test.sh`: script para testar a aplicação localmente enviando eventos simulando o API Gateway.

---

## Pré-requisitos

Antes de rodar o projeto, é necessário ter instalado:

- **Docker** para construir e executar a imagem do Lambda container.
- **curl** para enviar requisições HTTP ao container local.
- **jq** para exibir a resposta do Lambda de forma legível.

---

## Como rodar localmente

1. **Construir a imagem Docker**: a imagem conterá o código da aplicação e todas as dependências necessárias.
2. **Executar o container**: o Lambda container será iniciado, pronto para receber eventos simulando requisições do API Gateway.
3. **Testar a aplicação**: utilizar o script `test.sh` ou comandos `curl` para enviar eventos JSON para o container e verificar a resposta. O script já monta automaticamente o JSON completo e exibe a resposta de forma legível.

---

## Como funciona o teste

O script de teste envia um **evento JSON completo**, simulando o formato que o **API Gateway v2** enviaria para o Lambda na AWS.  

A resposta do Lambda inclui campos adicionais (`statusCode`, `headers` e `body`) e o campo `body` contém o JSON com a resposta real da aplicação. O script utiliza `jq` para converter essa string em JSON legível no terminal.

---

## Observações importantes

- Não é possível abrir o `localhost` no navegador diretamente, pois o Lambda container local espera **requisições POST com o JSON de evento**.
- O script `test.sh` facilita o teste local e garante que o evento enviado tenha todos os campos necessários, incluindo `sourceIp`.
- Este projeto serve como um **exemplo prático para currículo**, demonstrando conhecimento em FastAPI, Docker e AWS Lambda.
