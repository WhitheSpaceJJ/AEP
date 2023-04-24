

function capturaRevista(id) {
    borraHijos("mainId");
    let padre = document.getElementById("mainId");
    let titulo = document.createElement("h1");
    titulo.innerHTML = "Capturar Revista";
    padre.appendChild(titulo);
    let formulario = document.createElement("form");
    padre.appendChild(formulario);
    let contenedorFormulario = document.createElement("div");
    contenedorFormulario.setAttribute("class", "contenedorFormulario");
    formulario.appendChild(contenedorFormulario);
//ISBN
    let celdaEtiqISBN = document.createElement("div");
    celdaEtiqISBN.setAttribute("class", "derecha");
    contenedorFormulario.appendChild(celdaEtiqISBN);
    let etiqISBNRevista = document.createElement("label");
    etiqISBNRevista.setAttribute("for", "campoISBNRevistaId");
    etiqISBNRevista.innerHTML = "ISBN *:";
    celdaEtiqISBN.appendChild(etiqISBNRevista);
    let celdaISBNRevista = document.createElement("div");
    celdaISBNRevista.setAttribute("id", "celdaISBNRevistaId");
    contenedorFormulario.appendChild(celdaISBNRevista);
    let campoISBNRevista = document.createElement("input");
    campoISBNRevista.setAttribute("type", "number");
    campoISBNRevista.setAttribute("id", "isbnId");
    campoISBNRevista.setAttribute("name", "isbn");
    campoISBNRevista.setAttribute("size", "13");
    campoISBNRevista.setAttribute("value", id);
    campoISBNRevista.setAttribute("readonly", "readonly");
    campoISBNRevista.setAttribute("placeholder", "1234567891234");
    campoISBNRevista.setAttribute("title", "Entero positivo de 13 cifras maximo");
    celdaISBNRevista.appendChild(campoISBNRevista);
    let celdaVacia = document.createElement("div");
    celdaVacia.setAttribute("class", "span centrada");
    celdaVacia.innerHTML = "&nbsp;";
    contenedorFormulario.appendChild(celdaVacia);
//Titulo
    let celdaTituloR = document.createElement("div");
    celdaTituloR.setAttribute("class", "derecha");
    contenedorFormulario.appendChild(celdaTituloR);
    let etiqTituloR = document.createElement("label");
    etiqTituloR.setAttribute("for", "campoTituloRId");
    etiqTituloR.innerHTML = "Titulo *:";
    celdaTituloR.appendChild(etiqTituloR);
    let celdaTituloRevista = document.createElement("div");
    celdaTituloRevista.setAttribute("id", "celdaTituloRevistaId");
    contenedorFormulario.appendChild(celdaTituloRevista);
    let campoTituloRevista = document.createElement("input");
    campoTituloRevista.required = 'true';
    campoTituloRevista.setAttribute("type", "text");
    campoTituloRevista.setAttribute("id", "tituloId");
    campoTituloRevista.setAttribute("name", "titulo");
    campoTituloRevista.setAttribute("maxlength", "50");
    campoTituloRevista.setAttribute("min", "1");
    celdaTituloRevista.appendChild(campoTituloRevista);
    let celdaVacia2 = document.createElement("div");
    celdaVacia2.setAttribute("class", "span centrada");
    celdaVacia2.innerHTML = "&nbsp;";
    contenedorFormulario.appendChild(celdaVacia2);
//Editorial 
    let celdaEditorialR = document.createElement("div");
    celdaEditorialR.setAttribute("class", "derecha");
    contenedorFormulario.appendChild(celdaEditorialR);
    let etiqEditorialR = document.createElement("label");
    etiqEditorialR.setAttribute("for", "EditorialRId");
    etiqEditorialR.innerHTML = "Editorial *:";
    celdaEditorialR.appendChild(etiqEditorialR);
    let celdaEditorialRevista = document.createElement("div");
    celdaEditorialRevista.setAttribute("id", "celdaEditorialRevistaId");
    contenedorFormulario.appendChild(celdaEditorialRevista);
    let campoEditorialRevista = document.createElement("input");
    campoEditorialRevista.required = 'true';
    campoEditorialRevista.setAttribute("type", "text");
    campoEditorialRevista.setAttribute("id", "editorialId");
    campoEditorialRevista.setAttribute("name", "editorial");
    campoEditorialRevista.setAttribute("maxlength", "35");
    campoEditorialRevista.setAttribute("min", "1");
    celdaEditorialRevista.appendChild(campoEditorialRevista);
    let celdaVacia3 = document.createElement("div");
    celdaVacia3.setAttribute("class", "span centrada");
    celdaVacia3.innerHTML = "&nbsp;";
    contenedorFormulario.appendChild(celdaVacia3);
//ClasificacionR
    let celdaClasificacionR = document.createElement("div");
    celdaClasificacionR.setAttribute("class", "derecha");
    contenedorFormulario.appendChild(celdaClasificacionR);
    let etiqClasificacionR = document.createElement("label");
    etiqClasificacionR.setAttribute("for", "ClasificacionRId");
    etiqClasificacionR.innerHTML = "Clasificacion *:";
    celdaClasificacionR.appendChild(etiqClasificacionR);
    let celdaClasificacionRevista = document.createElement("div");
    celdaClasificacionRevista.setAttribute("id", "celdaClasificacionRevistaId");
    contenedorFormulario.appendChild(celdaClasificacionRevista);
    let campoClasificacionRevista = document.createElement("input");
    campoClasificacionRevista.required = 'true';
    campoClasificacionRevista.setAttribute("type", "text");
    campoClasificacionRevista.setAttribute("id", "clasificacionId");
    campoClasificacionRevista.setAttribute("name", "clasifiacion");
    campoClasificacionRevista.setAttribute("maxlength", "20");
    campoClasificacionRevista.setAttribute("min", "1");
    celdaClasificacionRevista.appendChild(campoClasificacionRevista);
    let celdaVacia4 = document.createElement("div");
    celdaVacia4.setAttribute("class", "span centrada");
    celdaVacia4.innerHTML = "&nbsp;";
    contenedorFormulario.appendChild(celdaVacia4);
//PeriocidadR
    let celdaPeriocidadR = document.createElement("div");
    celdaPeriocidadR.setAttribute("class", "derecha");
    contenedorFormulario.appendChild(celdaPeriocidadR);
    let etiqPeriocidadR = document.createElement("label");
    etiqPeriocidadR.setAttribute("for", "PeriocidadRId");
    etiqPeriocidadR.innerHTML = "Periocidad:";
    celdaPeriocidadR.appendChild(etiqPeriocidadR);
    let celdaPeriocidadRevista = document.createElement("div");
    celdaPeriocidadRevista.setAttribute("id", "celdaPeriocidadRevistaId");
    contenedorFormulario.appendChild(celdaPeriocidadRevista);
    let campoPeriocidadRevista = document.createElement("input");
    campoPeriocidadRevista.setAttribute("type", "text");
    campoPeriocidadRevista.setAttribute("id", "periocidadId");
    campoPeriocidadRevista.setAttribute("name", "periocidad");
    campoPeriocidadRevista.setAttribute("maxlength", "20");
    celdaPeriocidadRevista.appendChild(campoPeriocidadRevista);
    let celdaVacia5 = document.createElement("div");
    celdaVacia5.setAttribute("class", "span centrada");
    celdaVacia5.innerHTML = "&nbsp;";
    contenedorFormulario.appendChild(celdaVacia5);
//FechaR
    let celdaFechaR = document.createElement("div");
    celdaFechaR.setAttribute("class", "derecha");
    contenedorFormulario.appendChild(celdaFechaR);
    let etiqFechaR = document.createElement("label");
    etiqFechaR.setAttribute("for", "FechaRId");
    etiqFechaR.innerHTML = "Fecha: ";
    celdaFechaR.appendChild(etiqFechaR);
    let celdaFechaRevista = document.createElement("div");
    celdaFechaRevista.setAttribute("id", "celdaFechaRevistaId");
    contenedorFormulario.appendChild(celdaFechaRevista);
    let campoFechaRevista = document.createElement("input");
    campoFechaRevista.setAttribute("id", "fechaId");
    campoFechaRevista.setAttribute("name", "fecha");
    campoFechaRevista.setAttribute("type", "date");
    celdaFechaRevista.appendChild(campoFechaRevista);
    let celdaVacia6 = document.createElement("div");
    celdaVacia6.setAttribute("class", "span centrada");
    celdaVacia6.innerHTML = "&nbsp;";
    contenedorFormulario.appendChild(celdaVacia6);
    let celdaBoton = document.createElement("div");
    celdaBoton.setAttribute("class", "span centrada");
    contenedorFormulario.appendChild(celdaBoton);
    let boton = document.createElement("button");
    boton.setAttribute("type", "click");
    boton.setAttribute("class", "botones");
//    boton.setAttribute("onclick", "despliegaRevistas()");
    boton.setAttribute("onclick", "procesaGuardado()");
    boton.innerHTML = "Continuar";
    celdaBoton.appendChild(boton);
    let boton2 = document.createElement("button");
    boton2.setAttribute("type", "reset");
    boton2.setAttribute("class", "botones");
    boton2.innerHTML = "Limpiar";
    celdaBoton.appendChild(boton2);
    let resultados = document.createElement("div");
    resultados.setAttribute("id", "resultadosId");
    padre.appendChild(resultados);
}
function  procesaGuardado() {
    let id = document.getElementById("isbnId").value;
    let titulo = document.getElementById("tituloId").value;
    let editorial = document.getElementById("editorialId").value;
    let clasificacion = document.getElementById("clasificacionId").value;
    let periocidad = document.getElementById("periocidadId").value;
    let fecha = document.getElementById("fechaId").value;
    borraHijos("mainId");
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let revistas = JSON.parse(this.responseText);
            let titulo = "Revistas de la Biblioteca Web ";
            let encabezados = ["ISBN", "Titulo", "Editorial", "Clasificacion", "Periocidad", "Fecha"];
            despliegaTabla("mainId", titulo, encabezados, revistas);
        }
    };
    xhttp.open("GET", 'AgregaRevista?isbn=' + id + '&titulo=' + titulo +
            '&editorial=' + editorial + '&clasificacion=' + clasificacion + '&periocidad=' + periocidad +
            '&fecha=' + fecha);
    xhttp.send();
}

//Capturar ISBN
function capturaIsbn() {
    borraHijos("mainId");
    let padre = document.getElementById("mainId");
    let titulo = document.createElement("h1");
    titulo.innerHTML = "Capturar ISBN";
    padre.appendChild(titulo);
    let formulario = document.createElement("form");
    padre.appendChild(formulario);
    let contenedorFormulario = document.createElement("div");
    contenedorFormulario.setAttribute("class", "contenedorFormulario");
    formulario.appendChild(contenedorFormulario);
    let celdaEtiqISBN = document.createElement("div");
    celdaEtiqISBN.setAttribute("class", "derecha");
    contenedorFormulario.appendChild(celdaEtiqISBN);
    let etiqISBNRevista = document.createElement("label");
    etiqISBNRevista.setAttribute("for", "campoISBNRevistaId");
    etiqISBNRevista.innerHTML = "ISBN *";
    celdaEtiqISBN.appendChild(etiqISBNRevista);
    let celdaISBNRevista = document.createElement("div");
    celdaISBNRevista.setAttribute("id", "celdaISBNRevistaId");
    contenedorFormulario.appendChild(celdaISBNRevista);
    let campoISBNRevista = document.createElement("input");
    campoISBNRevista.required = 'true';
    campoISBNRevista.setAttribute("type", "number");
    campoISBNRevista.setAttribute("id", "isbnId");
    campoISBNRevista.setAttribute("name", "isbn");
    campoISBNRevista.setAttribute("size", "13");
    campoISBNRevista.setAttribute("min", "1");
    campoISBNRevista.setAttribute("max", "9999999999999");
    campoISBNRevista.setAttribute("placeholder", "1234567891234");
    campoISBNRevista.setAttribute("title", "Entero positivo de 13 cifras maximo");
    celdaISBNRevista.appendChild(campoISBNRevista);
    let celdaVacia = document.createElement("div");
    celdaVacia.setAttribute("class", "span centrada");
    celdaVacia.innerHTML = "&nbsp;";
    contenedorFormulario.appendChild(celdaVacia);
    let celdaBoton = document.createElement("div");
    celdaBoton.setAttribute("class", "span centrada");
    contenedorFormulario.appendChild(celdaBoton);
    let boton = document.createElement("button");
    boton.setAttribute("type", "click");
    boton.setAttribute("class", "botones");
    boton.setAttribute("onclick", "obtenRevista()");
    boton.innerHTML = "Continuar";
    celdaBoton.appendChild(boton);
    let boton2 = document.createElement("button");
    boton2.setAttribute("type", "reset");
    boton2.setAttribute("class", "botones");
    boton2.innerHTML = "Limpiar";
    celdaBoton.appendChild(boton2);
    let resultados = document.createElement("div");
    resultados.setAttribute("id", "resultadosId");
    padre.appendChild(resultados);
}


function obtenRevista() {
    let id = document.getElementById("isbnId").value;

    borraHijos("mainId");
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let revista = JSON.parse(this.responseText);
            if (Object.keys(revista).length === 0) {
                capturaRevista(id);
            } else {
                let titulo = "Revistas Repetida";
                let encabezados = ["ISBN", "Titulo", "Editorial", "Clasificacion", "Periocidad", "Fecha"];
                despliegaObjeto("mainId", titulo, encabezados, revista);
            }
        }
    };
    xhttp.open("GET", 'ObtenRevista?isbn=' + id);
    xhttp.send();
}


function despliegaRevistas() {
    borraHijos("mainId");
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let revistas = JSON.parse(this.responseText);
            if (Object.keys(revistas).length === 0) {
                capturaIsbn();
            } else {
                let titulo = "Revistas de la Biblioteca Web ";
                let encabezados = ["ISBN", "Titulo", "Editorial", "Clasificacion", "Periocidad", "Fecha"];
                despliegaTabla("mainId", titulo, encabezados, revistas);
            }
        }
    };
    xhttp.open("GET", 'ObtenRevistas');
    xhttp.send();
}
function muestraError(err) {
    console.log('Error: ', err);
}