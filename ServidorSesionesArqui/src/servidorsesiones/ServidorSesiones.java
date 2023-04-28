/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package servidorsesiones;

import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.DeliverCallback;
import datos.RevistasDAO;
import datos.UsuariossDAO;
import datosInterfaces.IRevistaDAO;
import datosInterfaces.IUsuarioDAO;
import entidades.Peticion;
import entidades.Prioridad;
import entidades.Revista;
import entidades.TipoPeticion;
import entidades.Usuario;
import java.io.ByteArrayOutputStream;
import java.io.ObjectOutputStream;
import java.util.List;
import org.apache.commons.lang3.SerializationUtils;

/**
 *
 * @author josej
 */
public class ServidorSesiones {

    private static final String RPC_QUEUE_NAME = "rpc_queueSesiones";

    public static void main(String[] argv) throws Exception {
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("localhost");

        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();
        channel.queueDeclare(RPC_QUEUE_NAME, false, false, false, null);
        channel.queuePurge(RPC_QUEUE_NAME);

        channel.basicQos(1);

        System.out.println(" [x] Awaiting RPC requests,sesiones.");

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
                if (peticion.getTipoPeticion() == TipoPeticion.REGISTRAR_USUARIO) {
                    IUsuarioDAO conexion = new UsuariossDAO();
                    boolean agregado = conexion.agregar(((Usuario) peticion.getCuerpo()[0]));
                    if (agregado) {
                        Object[] objetos = new Object[1];
                        objetos[0] = true;
                        peticion.setCuerpo(objetos);
                        peticion.setPrioridad(Prioridad.BAJA);
                    } else {
                        Object[] objetos = new Object[1];
                        objetos[0] = false;
                        peticion.setCuerpo(objetos);
                        peticion.setPrioridad(Prioridad.ALTA);
                    }
                    ByteArrayOutputStream bos = new ByteArrayOutputStream();
                    ObjectOutputStream oos = new ObjectOutputStream(bos);
                    oos.writeObject(peticion);
                    byte[] bytes = bos.toByteArray();
                    channel.basicPublish("", delivery.getProperties().getReplyTo(), replyProps, bytes);
                    channel.basicAck(delivery.getEnvelope().getDeliveryTag(), false);
                } else if (peticion.getTipoPeticion() == TipoPeticion.SESSION_USUARIO) {
                    IUsuarioDAO conexion = new UsuariossDAO();
                    Usuario agregado = conexion.consultar((String) peticion.getCuerpo()[0], (String) peticion.getCuerpo()[1]);
                    if (agregado != null) {
                        Object[] objetos = new Object[1];
                        objetos[0] = agregado;
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
                }
            }
        };

        channel.basicConsume(RPC_QUEUE_NAME, false, deliverCallback, (consumerTag -> {
        }));
    }
}
