/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function borraHijos(elementoID) {
    let elemento = document.getElementById(elementoID);
    while (elemento.hasChildNodes()) {
        elemento.removeChild(elemento.firstChild);
    }
}

function despliegaMenu(padreId, items, funciones) {
    let padre = document.getElementById(padreId);
    for (let i = 0; i < items.length; i++) {
        let boton = document.createElement("button");
        boton.setAttribute("type", "button");
        boton.setAttribute("onclick", funciones[i]);
        boton.innerHTML = items[i];
        padre.appendChild(boton);
    }
}

function despliegaTabla(padreId, titulo, encabezados, datos) {
    let padre = document.getElementById(padreId);
    let titulo2 = document.createElement("h1");
    titulo2.innerHTML = titulo;
    padre.appendChild(titulo2);
    let tabla = document.createElement("table");
    tabla.setAttribute("class", "bicolor");
    padre.appendChild(tabla);
    let renglon = document.createElement("tr");
    tabla.appendChild(renglon);
    for (var i = 0; i < encabezados.length; i++) {
        let celdaEncabezado = document.createElement("th");
        celdaEncabezado.innerHTML = encabezados[i];
        renglon.appendChild(celdaEncabezado);
    }
    for (let dato of datos) {
        let renglon = document.createElement("tr");
        tabla.appendChild(renglon);
        for (let llave in dato) {
            let celda = document.createElement("td");
            celda.innerHTML = dato[llave];
            renglon.appendChild(celda);
        }
    }
}
function despliegaListaSel(padreId, listaId, opciones, valores, sel) {
//    let padre = document.getElementById(padreId);
//    let lista = document.createElement("select");
//    lista.setAttribute("id", listaId);
//    padre.appendChild(lista);
//    for (let i = 0; i < opciones.length; i++) {
//        let opcion = document.createElement("option");
//        opcion.innerHTML = opciones[i];
//        opcion.setAttribute("value", valores[i]);
//        if ((sel !== null) && (sel === valores[i])) {
//            opcion.setAttribute("selected", "selected");
//        }
//        lista.appendChild(opcion);
//    }
    let padre = document.getElementById(padreId);
    let lista = document.createElement("select");
    lista.setAttribute("id", listaId);
    padre.appendChild(lista);

    for (let valor of valores) {
        for (let llave in valor) {
            let opcion = document.createElement("option");
            opcion.innerHTML = opciones[0] + " " + valor[llave];
            opcion.setAttribute("value", valor[llave]);
            if ((sel !== null) && (sel === valor[llave])) {
                opcion.setAttribute("selected", "selected");
            }
            lista.appendChild(opcion);
            break;
        }
    }
}


function despliegaObjeto(padreId, titulo, encabezados, objeto) {
    let padre = document.getElementById(padreId);
    let tabla = document.createElement("table");
    tabla.setAttribute("class", "bicolor");
    padre.appendChild(tabla);
    let tituloTabla = document.createElement("caption");
    tituloTabla.innerHTML = titulo;
    tabla.appendChild(tituloTabla);
    let i = 0;
    for (let miembro in objeto) {
        let renglon = document.createElement("tr");
        tabla.appendChild(renglon);
        let celdaEncabezado = document.createElement("th");
        celdaEncabezado.innerHTML = encabezados[i];
        renglon.appendChild(celdaEncabezado);
        let celdaMiembro = document.createElement("td");
        celdaMiembro.innerHTML = objeto[miembro];
        renglon.appendChild(celdaMiembro);
        i++;
    }
}
