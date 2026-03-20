  # **Guía de instalación y ejecución del proyecto**


### 1. Descargar el proyecto

- Abrir el repositorio en GitHub.
- Clic en Code → Download ZIP.
- Ir a descargas descomprimir el archivo ZIP.


### 2. Abrir el proyecto


- Abrir la carpeta descomprimida en Visual Studio Code.

### 3. Configurar la base de datos

- Ir a la carpeta db y abrir el archivo: api-crud.sql, luego:
- Copiar todo el contenido:
Ctrl + A
Ctrl + C

#### Configuración en XAMPP

- Abrir XAMPP.
- Iniciar Apache y MySQL.
- Clic en Admin (MySQL)
- Ir a la pestaña SQL
- Pegar el contenido (Ctrl + V)
-Ejecutar


### 4. Ejecutar el backend (API)
- Abrir una terminal y ejecutar:
  
1. cd api
2. cd src
3. npm start


### 5. Ejecutar Flutter
- Abrir otra terminal y ejecutar:
  
1. cd flutter
2. flutter pub get
3. flutter pub upgrade
4. flutter run
Seleccionar un navegador (por ejemplo: Chrome)
   opcion: 1 


### 6. Prueba del sistema
-Dar click en:  registrar nuevo usuario
- Crear un rol ingresando:
1. Nombre del rol
2. Descripción
- Dar click en crear
- Luego verificar en phpMyAdmin en la tabla roles.

  
### 7. Iniciar sesión
1. Email: user@email.com
2. Contraseña: 12345678
   - Le das click en ingresar
  
     
## Notas
- Ejecutar primero la base de datos
- Tener instalado Node.js, Flutter y XAMPP
