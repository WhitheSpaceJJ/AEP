package datosInterfaces;

import entidades.Revista;
import java.util.List;

public interface IRevistaDAO {

    public boolean agregar(Revista revista);

    public boolean actualizar(Revista revista);

    public boolean eliminar(long id);

    public Revista consultar(long id);


    public List<Revista> consultarTodos();

}
