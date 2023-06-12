# Define a imagem base
FROM python:3.10

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o código da aplicação para o diretório de trabalho
COPY . /app

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta em que a aplicação irá rodar
EXPOSE 5000

# Define o comando para iniciar a aplicação
CMD ["python", "main.py"]
