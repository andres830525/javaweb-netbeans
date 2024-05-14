<%-- 
    Document   : eliminar
    Created on : 12 may 2024, 14:11:45
    Author     : USUARIO
--%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // Datos de conexión a la base de datos
            String url = "jdbc:postgresql://localhost:5432/jsp";
            String usuario = "postgres";
            String contraseña = "postgres";

            // Objeto Connection para establecer la conexión
            Connection conexion = null;

            try {
                // Registrar el controlador JDBC
                Class.forName("org.postgresql.Driver");

                // Establecer la conexión
                conexion = DriverManager.getConnection(url, usuario, contraseña);

                if (conexion != null) {
                    System.out.println("Conexión exitosa a la base de datos PostgreSQL");

                    // ID del empleado que se desea eliminar
                    String idEmpleado = request.getParameter("id"); // Supongamos que queremos eliminar el empleado con ID 1

                    // Consulta SQL para eliminar un empleado
                    String consulta = "DELETE FROM empleados WHERE id = " + idEmpleado;

                    // Preparar la consulta
                    PreparedStatement statement = conexion.prepareStatement(consulta);

                    // Ejecutar la consulta de eliminación
                    int filasEliminadas = statement.executeUpdate();

                    if (filasEliminadas > 0) {
                        System.out.println("Empleado eliminado correctamente.");
                    } else {
                        System.out.println("No se pudo eliminar el empleado. Verifica el ID del empleado.");
                    }

                    // Cerrar el PreparedStatement
                    statement.close();
                }

            } catch (ClassNotFoundException e) {
                System.out.println("No se pudo encontrar la clase del controlador: " + e.getMessage());
            } catch (SQLException e) {
                System.out.println("Error al ejecutar la consulta: " + e.getMessage());
            } finally {
                try {
                    // Cerrar la conexión
                    if (conexion != null) {
                        conexion.close();
                    }
                } catch (SQLException e) {
                    System.out.println("Error al cerrar la conexión: " + e.getMessage());
                }
            }

 //Redireccionar a index
            request.getRequestDispatcher("index.jsp").forward(request, response);

        %>
</html>
