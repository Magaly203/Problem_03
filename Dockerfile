# Usar la imagen base de Ubuntu
# Esta línea indica que el contenedor se construirá a partir de la última versión de la imagen oficial de Ubuntu.

FROM ubuntu:latest

# Actualizar la lista de paquetes en la imagen base
# El comando 'apt-get update' descarga la lista más reciente de paquetes desde los repositorios.
# 'apt-get upgrade -y' actualiza todos los paquetes instalados a su versión más reciente.

RUN apt-get update && apt-get upgrade -y

# Instalar Apache, PHP y sus módulos necesarios
# 'apt-get install -y apache2' instala el servidor web Apache, utilizado para alojar sitios web.
# 'php' instala el lenguaje de programación de PHP.
# 'libapache2-mod-php' instala los módulos necesario para que Apache pueda ejecutar código PHP.
# 'php-mysql' instala todo lo necesario para que PHP interactúe con bases de datos MySQL.

RUN apt-get install -y apache2 php libapache2-mod-php php-mysql

# Instalar el servidor MySQL
# 'apt-get install -y mysql-server' instala MySQL la cual nos permitirá gestionar bases de datos dentro del contenedor, junto con Apache y PHP.

RUN apt-get install -y mysql-server

# Instalar el editor nano
# 'apt-get install -y nano' instala el editor de texto nano, que es una herramienta para editar archivos de texto desde la terminal.

RUN apt-get install -y nano

# Configurar Apache para que inicie automáticamente
# Se iniciara el servicio de Apache dentro del contenedor.
# La opción 'service apache2 start' arranca Apache para que pueda comenzar a servir archivos web.

CMD ["service", "apache2", "start"]

# Crear un archivo PHP de prueba
# Esta línea utiliza el comando 'RUN' para crear un archivo PHP de prueba dentro de la carpeta raíz de Apache (/var/www/html).
# El archivo PHP contiene un script que muestra el mensaje "Hola desde PHP dentro de Docker!" cuando se visita a través del navegador.

RUN echo "<?php echo 'Hola desde PHP dentro de Docker!'; ?>" > /var/www/html/prueba.php

# Exponer los puertos 80 (Apache) y 3306 (MySQL) del contenedor
# Puerto 80: utilizado por el servidor Apache para servir páginas web.
# Puerto 3306: utilizado por MySQL para permitir la conexión con bases de datos.

EXPOSE 80 3306
