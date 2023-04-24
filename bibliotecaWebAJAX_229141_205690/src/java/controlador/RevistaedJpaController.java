/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import controlador.exceptions.IllegalOrphanException;
import controlador.exceptions.NonexistentEntityException;
import controlador.exceptions.PreexistingEntityException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import entidades.Revista;
import entidades.Revistaed;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Jose Jesus
 */
public class RevistaedJpaController implements Serializable {

    public RevistaedJpaController() {
        this.emf = Persistence.createEntityManagerFactory("APWPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Revistaed revistaed) throws IllegalOrphanException, PreexistingEntityException, Exception {
        List<String> illegalOrphanMessages = null;
        Revista revistaOrphanCheck = revistaed.getRevista();
        if (revistaOrphanCheck != null) {
            Revistaed oldRevistaedOfRevista = revistaOrphanCheck.getRevistaed();
            if (oldRevistaedOfRevista != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<>();
                }
                illegalOrphanMessages.add("The Revista " + revistaOrphanCheck + " already has an item of type Revistaed whose revista column cannot be null. Please make another selection for the revista field.");
            }
        }
        if (illegalOrphanMessages != null) {
            throw new IllegalOrphanException(illegalOrphanMessages);
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Revista revista = revistaed.getRevista();
            if (revista != null) {
                revista = em.getReference(revista.getClass(), revista.getIsbn());
                revistaed.setRevista(revista);
            }
            em.persist(revistaed);
            if (revista != null) {
                revista.setRevistaed(revistaed);
                revista = em.merge(revista);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findRevistaed(revistaed.getIsbnrevista()) != null) {
                throw new PreexistingEntityException("Revistaed " + revistaed + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Revistaed revistaed) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Revistaed persistentRevistaed = em.find(Revistaed.class, revistaed.getIsbnrevista());
            Revista revistaOld = persistentRevistaed.getRevista();
            Revista revistaNew = revistaed.getRevista();
            List<String> illegalOrphanMessages = null;
            if (revistaNew != null && !revistaNew.equals(revistaOld)) {
                Revistaed oldRevistaedOfRevista = revistaNew.getRevistaed();
                if (oldRevistaedOfRevista != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Revista " + revistaNew + " already has an item of type Revistaed whose revista column cannot be null. Please make another selection for the revista field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (revistaNew != null) {
                revistaNew = em.getReference(revistaNew.getClass(), revistaNew.getIsbn());
                revistaed.setRevista(revistaNew);
            }
            revistaed = em.merge(revistaed);
            if (revistaOld != null && !revistaOld.equals(revistaNew)) {
                revistaOld.setRevistaed(null);
                revistaOld = em.merge(revistaOld);
            }
            if (revistaNew != null && !revistaNew.equals(revistaOld)) {
                revistaNew.setRevistaed(revistaed);
                revistaNew = em.merge(revistaNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = revistaed.getIsbnrevista();
                if (findRevistaed(id) == null) {
                    throw new NonexistentEntityException("The revistaed with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Long id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Revistaed revistaed;
            try {
                revistaed = em.getReference(Revistaed.class, id);
                revistaed.getIsbnrevista();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The revistaed with id " + id + " no longer exists.", enfe);
            }
            Revista revista = revistaed.getRevista();
            if (revista != null) {
                revista.setRevistaed(null);
                revista = em.merge(revista);
            }
            em.remove(revistaed);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Revistaed> findRevistaedEntities() {
        return findRevistaedEntities(true, -1, -1);
    }

    public List<Revistaed> findRevistaedEntities(int maxResults, int firstResult) {
        return findRevistaedEntities(false, maxResults, firstResult);
    }

    private List<Revistaed> findRevistaedEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Revistaed.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Revistaed findRevistaed(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Revistaed.class, id);
        } finally {
            em.close();
        }
    }

    public int getRevistaedCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Revistaed> rt = cq.from(Revistaed.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
