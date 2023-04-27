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
        <script>
            let websocket;
            function validarCampos() {
                var wsUri = "ws://localhost:8080/ServidorWEBArqui/websocketendpoint";
                let email = document.getElementById("email").value;
                let password = document.getElementById("password").value;

                if (email === "" || password === "") {
                    alert("Por favor, complete todos los campos.");
                } else if (email !== "" && password !== "") {
                    websocket = new WebSocket(wsUri + "?email=" + email + "&password=" + password);
                    websocket.onopen = () => {
                        console.log("Conexión WebSocket establecida.");
                        alert("Se abrio correctamente ahora se redireccionara.");
                    };

                    websocket.onmessage = (event) => {
                        console.log(`Mensaje recibido: ${event.data}`);
                    };

                    websocket.onerror = (event) => {
                        console.error(`Error en conexión WebSocket: ${event}`);
                    };

                    websocket.onclose = () => {
                        console.log("Conexión WebSocket cerrada.");
                        alert("No se abrio correctamente no se redireccionara.");
                    };
                }
            }

            function inicioSession() {
                const loginDiv = document.createElement('div');
                loginDiv.classList.add('login');

                const h1 = document.createElement('h1');
                h1.textContent = 'Bienvenido Usuario';
                loginDiv.appendChild(h1);

                const h2 = document.createElement('h2');
                h2.textContent = 'Por favor escriba sus datos';
                loginDiv.appendChild(h2);

                const emailLabel = document.createElement('label');
                emailLabel.setAttribute('for', 'email');
                emailLabel.textContent = 'Correo:';
                loginDiv.appendChild(emailLabel);

                const emailInput = document.createElement('input');
                emailInput.setAttribute('type', 'email');
                emailInput.setAttribute('id', 'email');
                emailInput.setAttribute('name', 'email');
                loginDiv.appendChild(emailInput);

                const passwordLabel = document.createElement('label');
                passwordLabel.setAttribute('for', 'password');
                passwordLabel.textContent = 'Contraseña:';
                loginDiv.appendChild(passwordLabel);

                const passwordInput = document.createElement('input');
                passwordInput.setAttribute('type', 'password');
                passwordInput.setAttribute('id', 'password');
                passwordInput.setAttribute('name', 'password');
                loginDiv.appendChild(passwordInput);

                const submitBtn = document.createElement('button');
                submitBtn.setAttribute('id', 'submit-btn');
                submitBtn.textContent = 'Ingresar';
                submitBtn.addEventListener('click', validarCampos);
                loginDiv.appendChild(submitBtn);

                document.body.appendChild(loginDiv);
            }
        </script>
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
    </body>
</html>