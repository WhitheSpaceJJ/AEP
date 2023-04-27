/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package datos;

import datosInterfaces.IUsuarioDAO;
import usuarios.Usuario;

/**
 *
 * @author josej
 */
public class Prueba {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        IUsuarioDAO usuarios=new UsuariossDAO();
//        System.out.println("Agrego usuario; "+usuarios.agregar(new Usuario("admin", "admin","ADMIN")));
//            System.out.println("Agrego usuario; "+usuarios.agregar(new Usuario("cliente", "cliente","CLIENTE")));
//        System.out.println("Todos; "+usuarios.consultarTodos());
System.out.println("Consulta; "+usuarios.consultar("admin","admin"));
    }
    
}
