/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package revista;

import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.DeliverCallback;
import datos.RevistasDAO;
import datosInterfaces.IRevistaDAO;
import entidades.Peticion;
import entidades.Prioridad;
import entidades.Revista;
import entidades.TipoPeticion;
import java.io.ByteArrayOutputStream;
import java.io.ObjectOutputStream;
import java.util.List;
import org.apache.commons.lang3.SerializationUtils;

/**
 *
 * @author josej
 */
public class RevistaRMQ {

    private static final String RPC_QUEUE_NAME = "rpc_queue";

    public static void main(String[] argv) throws Exception {
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("localhost");

        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();
        channel.queueDeclare(RPC_QUEUE_NAME, false, false, false, null);
        channel.queuePurge(RPC_QUEUE_NAME);

        channel.basicQos(1);

        System.out.println(" [x] Awaiting RPC requests, revistas");

        DeliverCallback deliverCallback = (var consumerTag, var delivery) -> {
            AMQP.BasicProperties replyProps = new AMQP.BasicProperties.Builder()
                    .correlationId(delivery.getProperties().getCorrelationId())
                    .build();
            Peticion peticion = null;
            try {
                peticion = (Peticion) SerializationUtils.deserialize(delivery.getBody());
                System.out.println("Tipo peticion; " + peticion.getTipoPeticion() + ", id; " + peticion.getId());
            } catch (RuntimeException e) {
                System.out.println(" [.] " + e);
            } finally {
                if (peticion.getTipoPeticion() == TipoPeticion.CONSULTA_REVISTAS) {
                    IRevistaDAO conexion = new RevistasDAO();

                    List<Revista> productos = conexion.consultarTodos();
                    if (!productos.isEmpty()) {
                        Object[] objetos = new Object[productos.size()];
                        for (int i = 0; i < productos.size(); i++) {
                            Revista get = productos.get(i);
                            objetos[i] = get;
                        }
                        peticion.setCuerpo(objetos);
                        peticion.setPrioridad(Prioridad.BAJA);
                    } else {
                        peticion.setCuerpo(null);
                        peticion.setPrioridad(Prioridad.ALTA);
                    }
                    ByteArrayOutputStream bos = new ByteArrayOutputStream();
                    ObjectOutputStream oos = new ObjectOutputStream(bos);
                    oos.writeObject(peticion);
                    byte[] bytes = bos.toByteArray();
                    channel.basicPublish("", delivery.getProperties().getReplyTo(), replyProps, bytes);
                    channel.basicAck(delivery.getEnvelope().getDeliveryTag(), false);
                } else if (peticion.getTipoPeticion() == TipoPeticion.CONSULTA_REVISTA) {
                    IRevistaDAO conexion = new RevistasDAO();

                    Revista productoObtener = conexion.consultar((long) (peticion.getCuerpo()[0]));
                    if (productoObtener != null) {
                        Object[] objetos = new Object[1];
                        objetos[0] = productoObtener;
                        peticion.setCuerpo(objetos);
                        peticion.setPrioridad(Prioridad.BAJA);
                    } else {
                        peticion.setCuerpo(null);
                        peticion.setPrioridad(Prioridad.ALTA);
                    }
                    ByteArrayOutputStream bos = new ByteArrayOutputStream();
                    ObjectOutputStream oos = new ObjectOutputStream(bos);
                    oos.writeObject(peticion);
                    byte[] bytes = bos.toByteArray();
                    channel.basicPublish("", delivery.getProperties().getReplyTo(), replyProps, bytes);
                    channel.basicAck(delivery.getEnvelope().getDeliveryTag(), false);
                } //Terminar a partir de aqui
                else if (peticion.getTipoPeticion() == TipoPeticion.ACTUALIZAR_REVISTA) {
                    IRevistaDAO conexion = new RevistasDAO();
                    boolean actualizado = conexion.actualizar((Revista) peticion.getCuerpo()[0]);
                    if (actualizado) {
                        Object[] objetos = new Object[2];
                        objetos[0] = true;
                        objetos[1] = (Revista) peticion.getCuerpo()[0];

                        peticion.setCuerpo(objetos);
                        peticion.setPrioridad(Prioridad.BAJA);
                    } else {
                        Object[] objetos = new Object[2];
                        objetos[0] = false;
                        objetos[1] = (Revista) peticion.getCuerpo()[0];
                        peticion.setCuerpo(objetos);
                        peticion.setPrioridad(Prioridad.ALTA);
                    }
                    ByteArrayOutputStream bos = new ByteArrayOutputStream();
                    ObjectOutputStream oos = new ObjectOutputStream(bos);
                    oos.writeObject(peticion);
                    byte[] bytes = bos.toByteArray();
                    channel.basicPublish("", delivery.getProperties().getReplyTo(), replyProps, bytes);
                    channel.basicAck(delivery.getEnvelope().getDeliveryTag(), false);

                } else if (peticion.getTipoPeticion() == TipoPeticion.AGREGAR_REVISTA) {
                    IRevistaDAO conexion = new RevistasDAO();
                    boolean agregado = conexion.agregar(((Revista) peticion.getCuerpo()[0]));
                    if (agregado) {
                        Object[] objetos = new Object[2];
                        objetos[0] = true;
                        objetos[1] = (Revista) peticion.getCuerpo()[0];
                        peticion.setCuerpo(objetos);
                        peticion.setPrioridad(Prioridad.BAJA);
                    } else {
                        Object[] objetos = new Object[2];
                        objetos[0] = false;
                        objetos[1] = (Revista) peticion.getCuerpo()[0];
                        peticion.setCuerpo(objetos);
                        peticion.setPrioridad(Prioridad.ALTA);
                    }
                    ByteArrayOutputStream bos = new ByteArrayOutputStream();
                    ObjectOutputStream oos = new ObjectOutputStream(bos);
                    oos.writeObject(peticion);
                    byte[] bytes = bos.toByteArray();
                    channel.basicPublish("", delivery.getProperties().getReplyTo(), replyProps, bytes);
                    channel.basicAck(delivery.getEnvelope().getDeliveryTag(), false);
                } else if (peticion.getTipoPeticion() == TipoPeticion.ELIMINAR_REVISTA) {
                    IRevistaDAO conexion = new RevistasDAO();
                    boolean eliminado = conexion.eliminar(((long) peticion.getCuerpo()[0]));
                    if (eliminado) {
                                      Object[] objetos = new Object[2];
                        objetos[0] = true;
                        objetos[1] = (Revista) peticion.getCuerpo()[0];

                        peticion.setCuerpo(objetos);
                        peticion.setPrioridad(Prioridad.BAJA);
                    } else {
                                   Object[] objetos = new Object[2];
                        objetos[0] = false;
                        objetos[1] = (Revista) peticion.getCuerpo()[0];
                        peticion.setCuerpo(objetos);
                        peticion.setPrioridad(Prioridad.BAJA);
                    }
                    ByteArrayOutputStream bos = new ByteArrayOutputStream();
                    ObjectOutputStream oos = new ObjectOutputStream(bos);
                    oos.writeObject(peticion);
                    byte[] bytes = bos.toByteArray();
                    channel.basicPublish("", delivery.getProperties().getReplyTo(), replyProps, bytes);
                    channel.basicAck(delivery.getEnvelope().getDeliveryTag(), false);
                }
            }
        };

        channel.basicConsume(RPC_QUEUE_NAME, false, deliverCallback, (consumerTag -> {
        }));
    }
}
