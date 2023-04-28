package entidades;

import java.io.Serializable;

public enum TipoPeticion implements Serializable {
    CONSULTA_REVISTA,
    CONSULTA_REVISTAS,
    ACTUALIZAR_REVISTA,
    ELIMINAR_REVISTA,
    AGREGAR_REVISTA,
    SESSION_USUARIO,
    REGISTRAR_USUARIO
}
