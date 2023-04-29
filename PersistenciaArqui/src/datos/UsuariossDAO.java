package datos;

import conexion.ConexionBD;
import datosInterfaces.IConexionBD;
import datosInterfaces.IUsuarioDAO;
import entidades.Peticion;
import entidades.Prioridad;
import entidades.Revista;
import entidades.TipoPeticion;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import entidades.Usuario;

public class UsuariossDAO implements IUsuarioDAO {

    private final IConexionBD conexion;

    public UsuariossDAO () {
        IConexionBD conexion2 = new ConexionBD();
        this.conexion = conexion2;
    }

    @Override
    public boolean agregar(Usuario usuario) {
        try {
            EntityManager em = this.conexion.crearConexion();
            em.getTransaction().begin();
            em.persist( usuario);
            em.getTransaction().commit();
            return true;
        } catch (IllegalStateException ise) {
            System.err.println("No fue posible agregar el producto");
            return false;
        }
    }

    @Override
    public boolean actualizar(  Usuario usuario) {
        try {
            EntityManager em = this.conexion.crearConexion();
            em.getTransaction().begin();
            em.merge( usuario);
            em.getTransaction().commit();
            return true;
        } catch (IllegalStateException ise) {
            System.err.println("No fue posible actualizar el producto");
            return false;
        }

    }

    @Override
    public boolean eliminar(String email) {
        try {
            EntityManager em = this.conexion.crearConexion();
            Revista productoBD = em.find(Revista.class, email);
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
public Usuario consultar(String email, String password) {
    try {
        EntityManager em = this.conexion.crearConexion();
        em.getTransaction().begin();
        Query query = em.createQuery("SELECT u FROM Usuario u WHERE u.email = :email AND u.password = :password");
        query.setParameter("email", email);
        query.setParameter("password", password);
        Usuario usuario = (Usuario) query.getSingleResult();
        em.getTransaction().commit();
        return usuario;
    } catch (NoResultException e) {
        return null;
    } catch (IllegalStateException e) {
        System.err.println("No se pudo consultar el usuario");
        return null;
    }
}


@Override
public List<Usuario> consultarTodos() {
    try {
        EntityManager em = this.conexion.crearConexion();
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Usuario> criteria = builder.createQuery(Usuario.class);
        Root<Usuario> root = criteria.from(Usuario.class);
        criteria.select(root);
        TypedQuery<Usuario> query = em.createQuery(criteria);
        return query.getResultList();
    } catch (IllegalStateException ise) {
        System.err.println("No se pudieron consultar los Productos");
        return null;
    }
}

}
