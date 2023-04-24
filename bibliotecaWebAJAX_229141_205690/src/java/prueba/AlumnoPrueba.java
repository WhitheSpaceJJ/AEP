/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prueba;

import java.util.List;

public class AlumnoPrueba {
    private String nombre;
    private List<String> apellidos;

    public AlumnoPrueba(String nombre, List<String> apellidos) {
        this.nombre = nombre;
        this.apellidos = apellidos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<String> getApellidos() {
        return apellidos;
    }

    public void setApellidos(List<String> apellidos) {
        this.apellidos = apellidos;
    }

    @Override
    public String toString() {
        return "AlumnoPrueba{" + "nombre=" + nombre + ", apellidos=" + apellidos + '}';
    }
    
}
