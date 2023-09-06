# Utiliza una imagen base con Python instalado
FROM python:3 AS ApiNames

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app/archivos
ARG TOKEN = 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
ARG USER = Danna-Sanabria

# Copia el archivo de requerimientos al directorio de trabajo
COPY ./app
COPY requirements.txt ./app/requirements.txt

# Instala las dependencias de la aplicación
RUN pip install -r requirements.txt

# Clona los archivos desde GitHub
RUN apt-get update && apt-get install -y git
RUN git clone https://%{USER}:${TOKEN}@github.com/Danna-Sanabria/ApiRestNames.git 

# Copia el contenido del repositorio clonado al directorio de trabajo
#COPY ./ApiRestNames/app
RUN pip install Flask
# Ejecuta la aplicación de Python
CMD ["python", "app.py"]
