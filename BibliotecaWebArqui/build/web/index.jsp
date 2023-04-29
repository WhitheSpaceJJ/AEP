<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css" />
        <title>Biblioteca Web</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-image: url('https://cdn.bioguia.com/embed/4d7b6ef20520f25701d664ae4dc571524395778/Las_bibliotecas_mas_hermosas_del_mundo_y_por_que_deberias_conocerlas');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                font-family: 'Roboto', sans-serif;
            }

            .login {
                display: flex;
                flex-direction: column;
                align-items: center;
                border: 2px solid #444;
                border-radius: 10px;
                padding: 20px;
                background-color: rgba(255, 255, 255, 0.8);
                box-shadow: 0px 0px 20px rgba(0,0,0,0.2);
                max-width: 400px;
                width: 100%;
            }


            h1 {
                margin: 0;
                font-size: 36px;
                font-weight: bold;
                color: #444;
                text-align: center;
            }
            h2 {
                margin: 0;
                font-size: 30px;
                font-weight: bold;
                color: #444;
                text-align: center;
            }

            label, input, button {
                margin: 10px 0;
                display: block;
                width: 100%;
            }

            input, button {
                padding: 10px;
                border-radius: 4px;
                border: 1px solid #ccc;
                font-size: 16px;
                color: #444;
                background-color: #fff;
                transition: border-color 0.3s ease;
            }

            input:focus, button:focus {
                outline: none;
                border-color: #00bcd4;
            }

            button {
                background-color: #00bcd4;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #0097a7;
            }

            @media only screen and (min-width: 768px) {
                .login {
                    max-width: 600px;
                }
            }
        </style>

    </head>
    <body>
        <div class="login">
            <h1>Bienvenido Usuario</h1>
            <h2>Porfavor escriba sus datos</h2>
            <label for="email">Correo:</label>
            <input type="email" id="email" name="email">
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password">
            <button id="submit-btn" onclick="validarCampos()">Ingresar</button>
        </div>
        <script>
            function validarCampos() {
                const email = document.getElementById('email').value;
                const password = document.getElementById('password').value;
                // Validar que se haya ingresado un correo electrónico y una contraseña
                if (email === "" || password === "") {
                    alert('Por favor, ingrese su correo electrónico y contraseña.');
                } else {
                    // alert('Usuario ' + email + ', Contrasena ' + password);
                    //   window.location.href = 'menuPrincipalBibliotecario.jsp';
                    //           window.location.href = 'menuPrincipalUsuarios.jsp';       
                    // Hacer una solicitud a la API Fetch para llamar al método "sesion" en el servidor REST

                    fetch('http://localhost:8080/ServidorRESTArqui/webresources/sesion/query?email=' + email + '&password=' + password)
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('No se pudo obtener una respuesta del servidor.');
                                }
                                return response.json();
                            })
                            .then(usuario => {
                                if (usuario.tipo === "ADMIN") {
                                    alert('Bienvenido ' + usuario.email + usuario.password + usuario.tipo + '!');
                                    window.location.href = "menuPrincipalBibliotecario.jsp";
                                } else {
                                    alert('Bienvenido ' + usuario.email + usuario.password + usuario.tipo + '!');
                                    window.location.href = "menuPrincipalUsuarios.jsp";
                                }
                            })
                            .catch(error => {
                                alert(`Se produjo un error al intentar iniciar sesión: ${error.message}`);
                            });
                }
            }
        </script>
    </body>
</html>