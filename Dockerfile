FROM public.ecr.aws/lambda/python:3.11

# Instalar dependências
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copiar app
COPY app.py .

# Definir handler
CMD ["app.handler"]
