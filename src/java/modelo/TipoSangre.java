
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class TipoSangre {
    private int id_sangre;
    private String tipoSangre;
    Conexion cn;
    public TipoSangre(){}
    public TipoSangre(int id_sangre, String tipoSangre) {
        this.id_sangre = id_sangre;
        this.tipoSangre = tipoSangre;
    }

    public int getId_sangre() {
        return id_sangre;
    }

    public void setId_sangre(int id_sangre) {
        this.id_sangre = id_sangre;
    }

    public String gettipoSangre() {
        return tipoSangre;
    }

    public void settipoSangre(String tipoSangre) {
        this.tipoSangre = tipoSangre;
    }
    public HashMap drop_sangre(){
    HashMap<String,String> drop = new HashMap();
    try{
        String query ="Select id_sangre as id,sangre from tipos_sangre";
         cn = new Conexion();
         cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()){
            drop.put(consulta.getString("id"),consulta.getString("sangre") );
            }
         cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    return drop;
    }
    
}
