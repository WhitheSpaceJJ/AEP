package ws;

import entidades.Peticion;
import entidades.Prioridad;
import entidades.Revista;
import entidades.TipoPeticion;
import entidades.Usuario;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObjectBuilder;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("sesion")
public class SesionResource {

    @Context
    private UriInfo context;

    public SesionResource() {
    }

    @GET
    @Path("/query")
    @Produces(MediaType.APPLICATION_JSON)
    public Response sesion(@QueryParam("email") String email, @QueryParam("password") String password) {
        Object[] consultas = new String[4];
        consultas[0] = email != null ? email.replace("\\n", "") : null;
        consultas[1] = password != null ? password.replace("\\n", "") : null;

        try {
            ConsumidorSesion consumidor = new ConsumidorSesion();
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.SESSION_USUARIO, Calendar.getInstance().getTime(), Prioridad.ALTA, consultas));
            if (peticion == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            } else if (peticion.getCuerpo() != null && peticion != null) {
                Usuario revistaABuscar = (Usuario) peticion.getCuerpo()[0];
                System.out.println(revistaABuscar);
                return Response.ok().entity(revistaABuscar).build();
            } else {
                return Response.status(Response.Status.NOT_FOUND).build();
            }
        } catch (Exception e) {
            System.out.println("Error; " + e.getMessage());
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response revistaProducto(Usuario usuario) {
        try {
            ConsumidorSesion consumidor = new ConsumidorSesion();
            Object[] objetos = new Object[1];
            objetos[0] = usuario;
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.REGISTRAR_USUARIO, Calendar.getInstance().getTime(),
                            Prioridad.ALTA, objetos));
            
            if (peticion == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            } else if (peticion.getCuerpo() != null && peticion.getCuerpo().length > 0 && peticion.getCuerpo()[0] instanceof Boolean && (boolean) peticion.getCuerpo()[0] == true && peticion != null) {
                Usuario productoABuscar = (Usuario) peticion.getCuerpo()[0];
                System.out.println(productoABuscar);
                return Response.ok().entity(productoABuscar).build();
            } else {
                return Response.status(Response.Status.NOT_FOUND).build();
            }
        } catch (Exception e) {
            System.out.println("Error; " + e.getMessage());
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
    }
}
