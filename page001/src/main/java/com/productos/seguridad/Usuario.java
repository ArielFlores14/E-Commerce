package com.productos.seguridad;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.productos.datos.Conexion;
import com.productos.seguridad.ConexionUsuario;

public class Usuario {
	private int id;
	private int perfil;
	private int estadoCivil;
	private String cedula;
	private String nombre;
	private String correo;
	private String Clave;
	public Usuario() {
		// TODO Auto-generated constructor stub
	
	}
	public Usuario(int nperfiles, String nnombre, String ncedula, int nestado, String ncorreo, String nclave) {
		// TODO Auto-generated constructor stub
		this.nombre = nnombre;
		this.cedula = ncedula;
		this.estadoCivil = nestado;
		this.correo = ncorreo;
		this.Clave = nclave;
		this.perfil = nperfiles;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPerfil() {
		return perfil;
	}
	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}
	public int getEstadoCivil() {
		return estadoCivil;
	}
	public void setEstadoCivil(int estadoCivil) {
		this.estadoCivil = estadoCivil;
	}
	public String getCedula() {
		return cedula;
	}
	public void setCedula(String cedula) {
		this.cedula = cedula;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getClave() {
		return Clave;
	}
	public void setClave(String clave) {
		Clave = clave;
	}
	public boolean verificarUsuario(String ncorreo, String nclave) 
	{ 
	boolean respuesta=false; 
	String sentencia= "Select * from tb_usuario where correo_us='"+ncorreo+ 
	   "' and clave_us='"+nclave+"';"; 
	 //System.out.print(sentencia); 
	 try 
	 { 
	 ResultSet rs; 
	 Conexion clsCon=new Conexion(); 
	 rs=clsCon.Consulta(sentencia); 
	  
	 if(rs.next()) 
	 { 
	  respuesta=true; 
	  this.setCorreo(ncorreo); 
	  this.setClave(nclave); 
	  this.setPerfil(rs.getInt(2));  
	  this.setNombre(rs.getString(3)); 
	 } 
	 else 
	 { 
	  respuesta=false; 
	  rs.close(); 
	 } 
	 } 
	 catch(Exception ex) 
	 { 
	 System.out.println( ex.getMessage()); 
	 } 
	return respuesta; 
	}
	public boolean registrarUsuario(int perfil, String nombre, String cedula, String correo, String clave) {
	    boolean registrado = false;
	    
	    String sql = "INSERT INTO tb_usuario (id_per, nombre_us, cedula_us, correo_us, clave_us, id_est) " +
	                 "VALUES (" + perfil + ", '" + nombre + "', '" + cedula + "', '" + correo + "', '" + clave + "', 1)";
	    
	    try {
	        ConexionUsuario con = new ConexionUsuario();
	        String resultado = con.Ejecutar(sql);
	        
	        if (resultado.contains("Insertado correctamente")) {
	            registrado = true;
	        }
	    } catch (Exception e) {
	        System.out.println("Error al registrar el usuario: " + e.getMessage());
	    }
	    
	    return registrado;
	}
	public boolean verificarClave(String correo, String aclave) {
	    boolean resultado = false;
	    String sql = "SELECT clave_us FROM tb_usuario WHERE correo_us = '" + correo + "'";
	    try {
	        ConexionUsuario con = new ConexionUsuario();
	        ResultSet rs = con.Consulta(sql);
	        if (rs.next()) {
	            String claveActual = rs.getString("clave_us");
	            resultado = claveActual.equals(aclave);
	        }
	    } catch (Exception e) {
	        System.out.println("Error al verificar clave: " + e.getMessage());
	    }
	    return resultado;
	}

	public boolean coincidirClaves(String nclave, String repetir) {
	    return nclave != null && nclave.equals(repetir);
	}
	public boolean cambiarClave(String correo, String nuevaClave) {
	    boolean actualizado = false;
	    String sql = "UPDATE tb_usuario SET clave_us = '" + nuevaClave + "' WHERE correo_us = '" + correo + "'";
	    try {
	        ConexionUsuario con = new ConexionUsuario();
	        String resultado = con.Ejecutar(sql);
	        actualizado = resultado.contains("Insertado correctamente") || resultado.contains("registro");
	    } catch (Exception e) {
	        System.out.println("Error al cambiar clave: " + e.getMessage());
	    }
	    return actualizado;
	}
	
	public String cambioClave (String pwd, String user)
	{
		String result = "";
		Conexion con = new Conexion ();
		PreparedStatement pr = null;
		String sql = "UPDATE tb_usuario SET clave_us = ? WHERE correo_us = ?";
	    try {
	        pr = con.getConexion().prepareStatement(sql);
	        pr.setString (1,pwd);
	        pr.setString(2, user);

	        int filasAfectadas = pr.executeUpdate();
	        if (filasAfectadas == 1) {
	            result = "Cambio de clave exitoso.";
	        } else {
	            result = "No se encontró el usuario o no se realizó el cambio.";
	        }
	    } catch (Exception ex) {
	        result = "Error: " + ex.getMessage();
	        System.out.println(result);
	    } finally {
	        try {
	            if (pr != null) pr.close();
	            if (con.getConexion() != null) con.getConexion().close();
	        } catch (Exception ex) {
	            System.out.println("Error al cerrar conexión: " + ex.getMessage());
	        }
	    }
	    return result;
	}
	
	
	
	
	
	/* if (nombre != null && cedula != null && correo != null && clave != null) {
    Usuario user = new Usuario();
    
    // Intentar registrar al usuario
    boolean registrado = user.registrarUsuario(perfil, nombre, cedula, correo, clave);*/
	
}
