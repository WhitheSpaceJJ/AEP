package ws;

import entidades.Peticion;
import entidades.Prioridad;
import entidades.Revista;
import entidades.TipoPeticion;
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

@Path("revista")
public class RevistaResource {

    @Context
    private UriInfo context;

    public RevistaResource() {
    }

    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response obtenerProductoPorID(@PathParam("id") String id) {
        try {
            Consumidor consumidor = new Consumidor();
            Object[] objetos = new Object[1];
            objetos[0] = Long.valueOf(id);
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.CONSULTA_REVISTA, Calendar.getInstance().getTime(), Prioridad.ALTA, objetos));

            if (peticion == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            } else if (peticion.getCuerpo() != null && peticion != null) {
                Revista revista = (Revista) peticion.getCuerpo()[0];
                System.out.println(revista);

                JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
                JsonObjectBuilder revistaJsonBuilder = Json.createObjectBuilder()
                        .add("isbn", ((Revista) revista).getIsbn())
                        .add("titulo", ((Revista) revista).getTitulo())
                        .add("editorial", ((Revista) revista).getEditorial())
                        .add("clasificacion", ((Revista) revista).getClasificacion());
                jsonArrayBuilder.add(revistaJsonBuilder.build());
                JsonArray jsonArray = jsonArrayBuilder.build();
                System.out.println(jsonArray.toString());
                return Response.ok().entity(jsonArray.toString()).build();
            } else {
                return Response.status(Response.Status.NOT_FOUND).build();
            }
        } catch (Exception e) {
            System.out.println("Error; " + e.getMessage());
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response obtenerRevistas() {
        try {
            Consumidor consumidor = new Consumidor();
            Object[] objetos2 = new Object[1];
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.CONSULTA_REVISTAS, Calendar.getInstance().getTime(),
                            Prioridad.ALTA, objetos2));
            if (peticion == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            } else if (peticion != null && peticion.getCuerpo() != null) {
                Object[] objetos = peticion.getCuerpo();
                JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
                for (Object revista : objetos) {
                    JsonObjectBuilder revistaJsonBuilder = Json.createObjectBuilder()
                            .add("isbn", ((Revista) revista).getIsbn())
                            .add("titulo", ((Revista) revista).getTitulo())
                            .add("editorial", ((Revista) revista).getEditorial())
                            .add("clasificacion", ((Revista) revista).getClasificacion());
                    jsonArrayBuilder.add(revistaJsonBuilder.build());
                }
                JsonArray jsonArray = jsonArrayBuilder.build();
                System.out.println(jsonArray.toString());
                return Response.ok().entity(jsonArray.toString()).build();
            } else {
                return Response.status(Response.Status.NOT_FOUND).build();
            }
        } catch (Exception e) {
            System.out.println("Error; " + e.getMessage());
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
    }

    @PUT
    @Path("{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response actualizarRevista(@PathParam("id") String id, Revista revistaActualizado) {
        try {
            Consumidor consumidor = new Consumidor();
            Object[] objetos = new Object[1];
            objetos[0] = revistaActualizado;
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.ACTUALIZAR_REVISTA, Calendar.getInstance().getTime(),
                            Prioridad.ALTA, objetos));
            if (peticion == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            } else if (peticion.getCuerpo() != null && peticion.getCuerpo().length > 0 && peticion.getCuerpo()[0] instanceof Boolean && (boolean) peticion.getCuerpo()[0] == true ) {
                Revista revista = (Revista) peticion.getCuerpo()[1];
                System.out.println(revista);
                JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
                JsonObjectBuilder revistaJsonBuilder = Json.createObjectBuilder()
                        .add("isbn", ((Revista) revista).getIsbn())
                        .add("titulo", ((Revista) revista).getTitulo())
                        .add("editorial", ((Revista) revista).getEditorial())
                        .add("clasificacion", ((Revista) revista).getClasificacion());
                jsonArrayBuilder.add(revistaJsonBuilder.build());
                JsonArray jsonArray = jsonArrayBuilder.build();
                System.out.println(jsonArray.toString());
                return Response.ok().entity(jsonArray.toString()).build();
            } else {
                return Response.status(Response.Status.NOT_FOUND).build();
            }
        } catch (Exception e) {
            System.out.println("Error; " + e.getMessage());
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
    }

    @DELETE
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response eliminarRevista(@PathParam("id") String id) {
        try {
            Consumidor consumidor = new Consumidor();
            Object[] objetos = new Object[1];
            objetos[0] = Long.valueOf(id);
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.ELIMINAR_REVISTA, Calendar.getInstance().getTime(),
                            Prioridad.ALTA, objetos));
            if (peticion == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            } else if (peticion.getCuerpo() != null && peticion.getCuerpo().length > 0 && peticion.getCuerpo()[0] instanceof Boolean && (boolean) peticion.getCuerpo()[0] == true && peticion != null) {
                Revista revista = (Revista) peticion.getCuerpo()[1];
                System.out.println(revista);

                JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
                JsonObjectBuilder revistaJsonBuilder = Json.createObjectBuilder()
                        .add("isbn", ((Revista) revista).getIsbn())
                        .add("titulo", ((Revista) revista).getTitulo())
                        .add("editorial", ((Revista) revista).getEditorial())
                        .add("clasificacion", ((Revista) revista).getClasificacion());
                jsonArrayBuilder.add(revistaJsonBuilder.build());
                JsonArray jsonArray = jsonArrayBuilder.build();
                System.out.println(jsonArray.toString());
                return Response.ok().entity(jsonArray.toString()).build();
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
    public Response revistaProducto(Revista producto) {
        try {
            Consumidor consumidor = new Consumidor();
            Object[] objetos = new Object[1];
            objetos[0] = producto;
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.AGREGAR_REVISTA, Calendar.getInstance().getTime(),
                            Prioridad.ALTA, objetos));
            if (peticion == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            } else if (peticion.getCuerpo() != null && peticion.getCuerpo().length > 0 && peticion.getCuerpo()[0] instanceof Boolean && (boolean) peticion.getCuerpo()[0] == true && peticion != null) {
                           Revista revista = (Revista) peticion.getCuerpo()[1];
                System.out.println(revista);
                JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
                JsonObjectBuilder revistaJsonBuilder = Json.createObjectBuilder()
                        .add("isbn", ((Revista) revista).getIsbn())
                        .add("titulo", ((Revista) revista).getTitulo())
                        .add("editorial", ((Revista) revista).getEditorial())
                        .add("clasificacion", ((Revista) revista).getClasificacion());
                jsonArrayBuilder.add(revistaJsonBuilder.build());
                JsonArray jsonArray = jsonArrayBuilder.build();
                System.out.println(jsonArray.toString());
                return Response.ok().entity(jsonArray.toString()).build();
            } else {
                return Response.status(Response.Status.NOT_FOUND).build();
            }
        } catch (Exception e) {
            System.out.println("Error; " + e.getMessage());
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
    }
}
