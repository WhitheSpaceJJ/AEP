/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

let READY_STATE_UNINITIALIZED = 0;
let READY_STATE_CONNECTIO_ESTABLISHED = 1;
let READY_STATE_REQUEST_RECEIVED = 2;
let READY_STATE_PROCESSING_REQUEST = 3;
let READY_STATE_RESONSE_READY = 4;

let REQUEST_STATUS_OK = 200;

let peticion_http;

let menuPrincipalItems = ["Catalogo de Revistas", "Inventario de Revistas"];



let menuRevistasItems = ["Agregar", "Actualizar", "Eliminar", "Consultar", "Regresar"];
let menuRevistasFunciones = ["capturaIsbn()", "", "", "despliegaRevistas()", "despliegaMenuPrincipal()"];

let menuInventarioItems = ["Inventariar", "Desinventariar", "Consultar", "Regresar"];


let menuPrincipalFunciones = ["despliegaMenuRevistas()",
    "despliegaMenuInventario()"];


let menuInventarioFunciones = ["capturaRevistaInventariar()", "", "despliegaInventarioRevistas()", "despliegaMenuPrincipal()"];

function despliegaMenuPrincipal() {
    borraHijos("mainId");
    borraHijos("navId");
    despliegaMenu("navId", menuPrincipalItems, menuPrincipalFunciones);

    let padre = document.getElementById("mainId");
    let titulo = document.createElement("h1");
    titulo.innerHTML = "Bienvenida";
    padre.appendChild(titulo);

}

function despliegaMenuRevistas() {
    borraHijos("mainId");
    borraHijos("navId");
    despliegaMenu("navId", menuRevistasItems, menuRevistasFunciones);
}

function despliegaMenuInventario() {
    borraHijos("mainId");
    borraHijos("navId");
    despliegaMenu("navId", menuInventarioItems, menuInventarioFunciones);
}
