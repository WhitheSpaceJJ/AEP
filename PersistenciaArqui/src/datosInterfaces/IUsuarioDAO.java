package datosInterfaces;

import entidades.Revista;
import java.util.List;
import entidades.Usuario;

public interface IUsuarioDAO {

    public boolean agregar(Usuario usuario);

    public boolean actualizar(Usuario usuario);

    public boolean eliminar(String email);

    public Usuario  consultar(String email,String password);


    public List<Usuario> consultarTodos();

}
