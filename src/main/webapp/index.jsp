<%-- 
    Document   : index
    Created on : 11 may 2024, 21:28:47
    Author     : USUARIO
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <title>Hello</title>
    </head>
    <body>

        <div class ="container mt-5">
            <div class="row" >
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="4" class="text-center">Empleados</th>
                                <th scope="col">
                                    <a href="crear.jsp"> <i class="fa-solid fa-user-plus" arial-hidden="true"></i></a>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Nombre </th>
                                <th scope="col">Apellido</th>
                                <th scope="col">Edad</th>
                                <th scope="col">Cargo</th>
                                <th scope="col">Salario</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%// Datos de conexión a la base de datos
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
                                        // Aquí puedes realizar operaciones con la base de datos

                                        // Consulta SQL
                                        String consulta = "SELECT * FROM empleados";

                                        // Preparar la consulta
                                        PreparedStatement statement = conexion.prepareStatement(consulta);

                                        // Ejecutar la consulta
                                        ResultSet resultado = statement.executeQuery();
                                        // Iterar sobre los resultados
                                        while (resultado.next()) {
                            %>
                            <tr>
                                <th scope="row"><%=resultado.getString(1)%></th>
                                <td><%=resultado.getString(2)%></td>
                                <td><%=resultado.getString(3)%></td>
                                <td><%=resultado.getString(4)%></td>
                                <td><%=resultado.getString(5)%></td>
                                <td><%=resultado.getString(6)%></td>
                                <td><a href="editar.jsp?nombre=<%=resultado.getString(2)%>&id=<%=resultado.getString(1)%>&apellido=<%=resultado.getString(3)%>&edad=<%=resultado.getString(4)%>&cargo=<%=resultado.getString(5)%>&salario=<%=resultado.getString(6)%>"
                                       "><i class="fa-solid fa-user-pen"></i>  </a>

                                    <a href="eliminar.jsp?id=<%=resultado.getString(1)%>
                                       "><i class="fa-solid fa-trash"></i>  </a>
                                       
                                       

                            </tr>


                            <%
                                        }

                                    }

                                } catch (ClassNotFoundException e) {
                                    System.out.println("No se pudo encontrar la clase del controlador: " + e.getMessage());
                                } catch (SQLException e) {
                                    System.out.println("Error al establecer la conexión: " + e.getMessage());
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
                            %>



                        </tbody>
                    </table>

                </div>
            </div>

        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/684d1197df.js" crossorigin="anonymous"></script>
    </body>
</html>