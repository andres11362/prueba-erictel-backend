<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Prueba Erictel</title>

    <!-- Fonts -->
    <link href="https://fonts.bunny.net/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">

    <!-- Styles -->
    <style>
        body {
            background-color: #111827;
        }

        .flex.content-center {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            min-height: 100vh;
            flex-direction: column;
        }

        h1 {
            color: gray;
            font-family: 'Nunito';
        }

        p {
            color: gray;
            font-family: 'Nunito';
        }
    </style>
</head>

<body>
    <div class="flex content-center">
        <h1>Prueba Erictel API</h1>
        <p>Si desea ir la documentación del API ir al siguiente <a href="{{env('APP_URL')}}/api/documentation">Enlace</a></p>
    </div>
</body>

</html>
