/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author Jose Jesus
 */
@Entity
@Table(name = "revistaed")
public class Revistaed implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "isbnrevista")
    private Long isbnrevista;
    @Column(name = "existencia")
    private Integer existencia;
    @Column(name = "disponibilidad")
    private Integer disponibilidad;
    @JoinColumn(name = "isbnrevista", referencedColumnName = "isbn", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Revista revista;

    public Revistaed() {
    }

    public Revistaed(Long isbnrevista) {
        this.isbnrevista = isbnrevista;
    }

    public Revistaed(Long isbnrevista, Integer existencia, Integer disponibilidad, Revista revista) {
        this.isbnrevista = isbnrevista;
        this.existencia = existencia;
        this.disponibilidad = disponibilidad;
        this.revista = revista;
    }

    public Long getIsbnrevista() {
        return isbnrevista;
    }

    public void setIsbnrevista(Long isbnrevista) {
        this.isbnrevista = isbnrevista;
    }

    public Integer getExistencia() {
        return existencia;
    }

    public void setExistencia(Integer existencia) {
        this.existencia = existencia;
    }

    public Integer getDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(Integer disponibilidad) {
        this.disponibilidad = disponibilidad;
    }

    public Revista getRevista() {
        return revista;
    }

    public void setRevista(Revista revista) {
        this.revista = revista;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (isbnrevista != null ? isbnrevista.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Revistaed)) {
            return false;
        }
        Revistaed other = (Revistaed) object;
        if ((this.isbnrevista == null && other.isbnrevista != null) || (this.isbnrevista != null && !this.isbnrevista.equals(other.isbnrevista))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Revistaed[ isbnrevista=" + isbnrevista + " ]";
    }
    
}
