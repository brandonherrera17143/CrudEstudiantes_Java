<%@page import="modelo.Sangre" %>
<%@page import="modelo.Estudiantes" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estudiantes</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
        <a class="navbar-brand" href="#">Brandon Herrera</a>
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Perfil</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="#">Contacto</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link active dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Juegos
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="#">Free Fire</a></li>
                  <li><a class="dropdown-item" href="#">Age of Empires</li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">otros</a></li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link active">Log in</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
        
        <h1>Formulario Estudiantes</h1>
        <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_estudiante" onclick="limpiar()">Nuevo</button>
        
    <div class="container">
         
        <div class="modal fade" id="modal_estudiante" role="dialog">
    <div class="modal-dialog">
   
      <div class="modal-content">
        <div class="modal-body">
             <form action="sr_empleados" method="post" class="form-group">
               <label for="lbl_id" ><b>ID</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 
                <label for="lbl_carne" ><b>Carne</b></label>
                <input type="text" name="txt_carne" id="txt_carne" class="form-control" placeholder="Ejemplo: E001" pattern="[E]{1}[0-9]{3}" required>
                <label for="lbl_nombres" ><b>Nombres</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombres" required>
                <label for="lbl_apellidos" ><b>Apellidos</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellidos" required>
                <label for="lbl_direccion" ><b>Direccion</b></label>
                <input type="text"  name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: #calle donde vives" required>
                <label for="lbl_correo" ><b>Gmail</b></label>
                <input type="text"  name="txt_correo" id="txt_correo" class="form-control" placeholder="ejemplo@gmail.com" required>
                <label for="lbl_telefono" ><b>Telefono</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 12345678" required>
                <label for="lbl_fn" ><b>Nacimiento</b></label>
                <input type="date"  name="txt_fn" id="txt_fn" class="form-control" required>
                
                
                <label for="lbl_sangre" ><b>Tipo Sangre</b></label>
                <select name="drop_sangre" id="drop_sangre" class="form-control">
                    <% 
                        Sangre sangre = new Sangre();
                        HashMap<String,String> drop = sangre.drop_sangre();
                         for (String i:drop.keySet()){
                             out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                         }
                         
                    
                    %>
                </select>
                <br>
                <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary btn-lg">Agregar</button>
                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-lg">Modificar</button>
                <button name="btn_eliminar" id="btn_modificar"  value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>
                <button type="button" class="btn btn-warning btn-lg" data-dismiss="modal">Cerrar</button>
            </form>
        </div>
      </div>
      
    </div>
  </div>
        
         
        
        
        
           
    <table class="table table-striped">
    <thead>
      <tr>
        <th>Codigo</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>Correo</th>
        <th>Nacimiento</th>
        <th>Tipo Sangre</th>
      </tr>
    </thead>
    <tbody id="tbl_estudiantes">
        <% 
        Estudiante estudiante = new Estudiantes();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = estudiante.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_p=" + tabla.getValueAt(t,8) + ">");
            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,7) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,8) + "</td>");
            out.println("</tr>");
        
        }
        %>
      
    </tbody>
  </table>
  </div>
      

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script type="text/javascript">
    function limpiar(){
        $("#txt_id").val(0);
       $("#txt_carne").val('');
       $("#txt_nombres").val('');
       $("#txt_apellidos").val('');
       $("#txt_direccion").val('');
       $("#txt_telefono").val('');
       $("#txt_correo").val('');
       $("#txt_fn").val('');
       $("#drop_sangre").val(1);
    }
   
    $('#tbl_estudiantes').on('click','tr td',function(evt){
       var target,id,id_sangre,carne,nombres,apellidos,direccion,telefono,correo,nacimiento; 
       target = $(event.target);
       id = target.parent().data('id');
       id_sangre = target.parent().data('id_sangre'); 
       carne = target.parent("tr").find("td").eq(0).html();
       nombres= target.parent("tr").find("td").eq(1).html();
       apellidos = target.parent("tr").find("td").eq(2).html();
       direccion = target.parent("tr").find("td").eq(3).html();
       telefono = target.parent("tr").find("td").eq(4).html();
       correo = target.parent("tr").find("td").eq(5).html();
       nacimiento = target.parent("tr").find("td").eq(6).html();
       $("#txt_id").val(id);
       $("#txt_carne").val(carne);
       $("#txt_nombres").val(nombres);
       $("#txt_apellidos").val(apellidos);
       $("#txt_direccion").val(direccion);
       $("#txt_telefono").val(telefono);
       $("#txt_correo").val(correo);
       $("#txt_fn").val(nacimiento);
       $("#drop_puesto").val(id_p);
       $("#modal_empleado").modal('show');
    });
    
</script>
    </body>
</html>
