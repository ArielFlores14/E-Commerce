package com.productos.seguridad;

import java.sql.*;
import java.util.ArrayList;
import com.productos.datos.Conexion;

public class auditoria {
    private int id;
    private String tabla;
    private String operacion;
    private String valorAnterior;
    private String valorNuevo;
    private Date fecha;
    private String usuario;

 

    public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getTabla() {
		return tabla;
	}



	public void setTabla(String tabla) {
		this.tabla = tabla;
	}



	public String getOperacion() {
		return operacion;
	}



	public void setOperacion(String operacion) {
		this.operacion = operacion;
	}



	public String getValorAnterior() {
		return valorAnterior;
	}



	public void setValorAnterior(String valorAnterior) {
		this.valorAnterior = valorAnterior;
	}



	public String getValorNuevo() {
		return valorNuevo;
	}



	public void setValorNuevo(String valorNuevo) {
		this.valorNuevo = valorNuevo;
	}



	public Date getFecha() {
		return fecha;
	}



	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}



	public String getUsuario() {
		return usuario;
	}



	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}



	public static ArrayList<auditoria> obtenerBitacora() {
        ArrayList<auditoria> lista = new ArrayList<>();
        Conexion con = new Conexion();
        ResultSet rs = null;

        String sql = "SELECT id_aud, tabla_aud, operacion_aud, valoranterior_aud, valornuevo_aud, fecha_aud, usuario_aud " +
                     "FROM auditoria.tb_auditoria ORDER BY id_aud DESC";

        try {
            rs = con.Consulta(sql);
            if (rs != null) {
                while (rs.next()) {
                    auditoria a = new auditoria();
                    a.id = rs.getInt("id_aud");
                    a.tabla = rs.getString("tabla_aud");
                    a.operacion = rs.getString("operacion_aud");
                    a.valorAnterior = rs.getString("valoranterior_aud");
                    a.valorNuevo = rs.getString("valornuevo_aud");
                    a.fecha = rs.getDate("fecha_aud");
                    a.usuario = rs.getString("usuario_aud");
                    lista.add(a);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}
