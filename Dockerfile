# Define a imagem base
FROM python:3.10


RUN pip install --upgrade pip

RUN adduser -D myuser
USER myuser
WORKDIR /home/myuser


# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o código da aplicação para o diretório de trabalho
COPY . /app

# Instala as dependências do projeto

COPY --chown=myuser:myuser requirements.txt requirements.txt
RUN pip install --user -r requirements.txt

# Expõe a porta em que a aplicação irá rodar
EXPOSE 5000

# Define o comando para iniciar a aplicação
CMD ["python", "main.py"]
