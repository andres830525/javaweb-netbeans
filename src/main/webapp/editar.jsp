<%-- 
    Document   : editar
    Created on : 12 may 2024, 12:31:59
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
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <title>Editar Empleado</title>
    </head>
    <%
        String id = request.getParameter("id");
       
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String edad = request.getParameter("edad");
        String cargo = request.getParameter("cargo");
        String salario = request.getParameter("salario");

    %>
    <body>
        <div class ="container mt-5">
            <div class="row" >
                <div class="col-sm">

                    <form action="editar.jsp" method="get">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="<%= nombre%>" required="">

                        </div>
                        <div class="form-group">
                            <label for="apellido">Apellido</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido" value="<%= apellido%>" required="">
                        </div>
                        <div class="form-group">
                            <label for="edad">Edad</label>
                            <input type="number" class="form-control" id="edad"name="edad" placeholder="Edad" value="<%= edad%>" required="">
                        </div>
                        <div class="form-group">
                            <label for="cargo">Cargo</label>
                            <input type="text" class="form-control" id="cargo" name="cargo" placeholder="Cargo"  value="<%= cargo%>" required="">
                        </div>
                        <div class="form-group">
                            <label for="salario">Salario</label>
                            <input type="number" class="form-control" id="salario" name="salario" placeholder="Salario" value="<%= salario%>" required="">
                        </div>
                        <a href="index.jsp" class="btn btn-danger">Cancelar <i class="fa-solid fa-ban"></i></a>
                        <button type="submit" name="enviar" class="btn btn-primary"> Actializar  <i class="fa-solid fa-floppy-disk"></i></button>
                        <input type="hidden" value="<%= id %>" name="id" >
                    </form>

                </div>
            </div>
        </div>
        <%            if (request.getParameter("enviar") != null&&request.getParameter("id") != null) {
                
                
                try {

                    // Datos de conexión a la base de datos
                    String url = "jdbc:postgresql://localhost:5432/jsp";
                    String usuario = "postgres";
                    String contraseña = "postgres";
                    // Objeto Connection para establecer la conexión
                    Connection conn = null;
                    // Registrar el controlador JDBC
                    Statement st = null;
                    Class.forName("org.postgresql.Driver");

                    // Establecer la conexión
                    conn = DriverManager.getConnection(url, usuario, contraseña);

                    if (conn != null) {
                        // System.out.println("Conexión exitosa a la base de datos PostgreSQL");
                        // Aquí puedes realizar operaciones con la base de datos

                        // Consulta SQL
                        String consulta = "Update empleados set nombre='" + nombre + "', apellido='" + apellido + "', edad='" + edad + "' , cargo='" + cargo + "', salario='" + salario + "' WHERE  id='" + id + "' ";

                        // Preparar la consulta
                        PreparedStatement statement = conn.prepareStatement(consulta);

                        // Ejecutar la consulta de inserción
                        int filasInsertadas = statement.executeUpdate();

                        if (filasInsertadas > 0) {
                            System.out.println(" empleado actualizado correctamente.");
                        } else {
                            System.out.println("No se pudo actualizar el nuevo empleado.");
                        }

                        // Cerrar el PreparedStatement
                        statement.close();
                        //Redireccionar a index
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                } catch (ClassNotFoundException e) {
                    System.out.println("No se pudo encontrar la clase del controlador: " + e.getMessage());
                } catch (SQLException e) {
                    System.out.println("Error al establecer la conexión: " + e.getMessage());
                }
            }
        %>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/684d1197df.js" crossorigin="anonymous"></script>
    </body>
</html>

