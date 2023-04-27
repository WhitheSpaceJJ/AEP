/*
 * Lista.java
 */

package objetosTransferencia;

import java.util.List;

/**

 *
 * @author Jose Jesus
 */
public class Lista<E> {
  private String tituloTabla;
  private List<E> lista;
  
  /**
   * Constructor vacio
   */
  public Lista() {
  }

  /**
   * Constructor que inicializa los miembros de la clase al valor de sus parametros
   * 
   * @param tituloTabla Titulo de la tabla
   * @param lista Lista con los eementos de la tabla
   */
  public Lista(String tituloTabla, List<E> lista) {
      this.tituloTabla = tituloTabla;
      this.lista = lista;
  }

  /**
   * Regresa el titulo de la tabla
   * @return  Titulo de la tabla
   */
  public String getTituloTabla() {
    return tituloTabla;
  }

  /**
   * Establece el titulo de la tabla
   * @param tituloTabla Titulo de la tabla
   */
  public void setTituloTabla(String tituloTabla) {
    this.tituloTabla = tituloTabla;
  }

  /**
   * Regresa la lista con los valores de la tabla
   * @return Lista con los valores de la tabla
   */
  public List<E> getLista() {
    return lista;
  }

  /**
   * Establece el atributo lista con la lista con los valores de la tabla
   * @param lista Lista con los valores de la tabla
   */
  public void setLista(List<E> lista) {
    this.lista = lista;
  }
}
