
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
2. Preferiblemente utilizar XAMPP como servidor local, si no se puede ir al paso correr localmente.
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

Implementación de JWT.
----------------
1. El archivo ya esta generado pero si es el caso utilizar el siguiente comando:

```bash
   php artisan vendor:publish --provider="Tymon\JWTAuth\Providers\LaravelServiceProvider"
```

Despues implementar el siguiente comando:

```bash
   php artisan jwt:secret
```
Esto generara la llave en el .env para su uso en las peticiones.


Generacion de migraciones.
----------------

1. Usar el siguente comando:

```bash
   php artisan migrate
```

2. despues alimentamos la base de datos con este comando:

```bash
   php artisan db:seed
```




    
## Correr localmente

Se recomienda dejarlo en un servidor XAMPP, sin embargo si no es posible utilizar el siguiente comando:

```bash
  php artisan serve
```



## Miscelaneos

El sitio se puede consultar en un ambiente de pruebas en la siguiente dirección: https://pruebaerictel.us/

Para la consulta de la api con esta direccion: https://pruebaerictel.us/api/v1

Documentación del API
---------------

Si se desea ver la documentación se puede ir la direccion (tanto en localhost como en el dominio) con el siguiente segmento: 

```bash
  /api/documentation
```

Test
---------------

Para correr los tests usar el siguiente comando

```bash
  composer test
```

Base de datos
---------------
Dentro del proyecto se incluye la base de datos del proyecto con el nombre prueba-erictel.sql

Contacto
---------------

Cualquier duda o sugerencia a los siguientes correos:

- agongorita@outlook.com
- agongora@ditech.es

