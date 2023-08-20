
# Prueba erictel backend

A continuacion se muestra el proceso de instalación y configuración del proyecto.




## Herramientas usadas

- PHP v8.1
- Laravel v9.x
- Composer v2.0
- PostgreSql v14.0
- tymon/jwt-auth v2.0
- axeldolislager/coinmarketcapapi v1.0

## Instalación

1. Descargar el repositorio.
2. Preferiblemente utilizar XAMPP como servidor local, si no se puede ir al paso 10.
3. Ir al la raiz del proyecto
4. Usar el comando:
```bash
   composer install
```
5. Usar el siguiente comando.
```bash
   cp .env.example .env
```
5. Despues usar el comando:
```bash
   php artisan key:generate
```
6. Crear la base de datos en el gestor deseado, se recomienda en PostgreSql.

8. Hacer uso del api de CoinMarketCap, para generar usuario y llave, seguir la siguente documentacion: https://coinmarketcap.com/api/documentation/v1/

7. Editar el archivo .env en los siguientes parametros:

Parametros de la base
---------------

- `DB_CONNECTION`: Se recomienda pgsql o mysql si es el caso.
- `DB_HOST`: Dirección Host donde esta albergada la base de datos.
- `DB_PORT`: Puerto que implemente el gestor de base de datos en el caso de PostgreSql usar 5432.
- `DB_DATABASE`: Nombre de la base de datos previamente creada.
- `DB_USERNAME`: Nombre del usuario administrador de la base de datos.
- `DB_PASSWORD`: Contraseña del usuario de la base de datos.

Parametros del api de CoinMarketCap 
---------------
- `CMC_API_KEY`: LLave a utilizar para la conectar con el api.
- `CMC_ENDPOINT`: Endpoint del consumo para la API.





    
## Run Locally

Clone the project

```bash
  git clone https://link-to-project
```

Go to the project directory

```bash
  cd my-project
```

Install dependencies

```bash
  npm install
```

Start the server

```bash
  npm run start
```


## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`API_KEY`

`ANOTHER_API_KEY`

