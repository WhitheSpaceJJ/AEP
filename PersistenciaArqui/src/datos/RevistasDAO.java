package datos;

import conexion.ConexionBD;
import datosInterfaces.IConexionBD;
import datosInterfaces.IRevistaDAO;
import entidades.Revista;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class RevistasDAO implements IRevistaDAO {

    private final IConexionBD conexion;

    public RevistasDAO() {
        IConexionBD conexion2 = new ConexionBD();
        this.conexion = conexion2;
    }

    @Override
    public boolean agregar(Revista revista) {
        try {
            EntityManager em = this.conexion.crearConexion();
            em.getTransaction().begin();
            em.persist(revista);
            em.getTransaction().commit();
            return true;
        } catch (IllegalStateException ise) {
            System.err.println("No fue posible agregar el producto");
            return false;
        }
    }

    @Override
    public boolean actualizar(Revista revista) {
        try {
            EntityManager em = this.conexion.crearConexion();
            em.getTransaction().begin();
            em.merge(revista);
            em.getTransaction().commit();
            return true;
        } catch (IllegalStateException ise) {
            System.err.println("No fue posible actualizar el producto");
            return false;
        }

    }

    @Override
    public boolean eliminar(long id) {
        try {
            EntityManager em = this.conexion.crearConexion();
            Revista productoBD = em.find(Revista.class, id);
            em.getTransaction().begin();
            em.remove(productoBD);
            em.getTransaction().commit();
            return true;
        } catch (IllegalStateException ise) {
            System.err.println("No fue posible eliminar el producto");
            return false;
        }
    }

    @Override
    public Revista  consultar(long id) {

        try {
            EntityManager em = this.conexion.crearConexion();
            em.getTransaction().begin();
          Revista  productoBD = em.find(Revista.class, id);
            em.getTransaction().commit();
            return productoBD;
        } catch (IllegalStateException ise) {
            System.err.println("No se pudo consultar el producto");
            return null;
        }
    }

@Override
public List<Revista> consultarTodos() {
    try {
        EntityManager em = this.conexion.crearConexion();
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Revista> criteria = builder.createQuery(Revista.class);
        Root<Revista> root = criteria.from(Revista.class);
        criteria.select(root);
        TypedQuery<Revista> query = em.createQuery(criteria);
        return query.getResultList();
    } catch (IllegalStateException ise) {
        System.err.println("No se pudieron consultar los Productos");
        return null;
    }
}

}
