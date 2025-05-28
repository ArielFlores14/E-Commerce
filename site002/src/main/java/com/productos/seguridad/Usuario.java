package com.productos.seguridad;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;

import com.productos.datos.Conexion;

public class Usuario {
    private int id;
    private int perfil;
    private int estadoCivil;
    private String cedula;
    private String nombre;
    private String correo;
    private String Clave;

    public Usuario() {
        // Constructor vacío
    }

    public Usuario(int nperfiles, String nnombre, String ncedula, int nestado, String ncorreo, String nclave) {
        this.nombre = nnombre;
        this.cedula = ncedula;
        this.estadoCivil = nestado;
        this.correo = ncorreo;
        this.Clave = nclave;
        this.perfil = nperfiles;
    }

    // Getters y Setters
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

    // Método de verificación de usuario
    public boolean verificarUsuario(String ncorreo, String nclave) {
        boolean respuesta = false;

        // Usamos Conexion para conectar a la base de datos USER
        String sentencia = "SELECT * FROM tb_usuario WHERE correo_us='" + ncorreo +
                "' AND clave_us='" + nclave + "';";

        try {
            // Crear una instancia de Conexion para consultar la base de datos USER
            Conexion clsConUser = new Conexion();
            ResultSet rs = clsConUser.Consulta(sentencia);

            if (rs.next()) {
                respuesta = true;
                this.setCorreo(ncorreo);
                this.setClave(nclave);
                this.setPerfil(rs.getInt("id_per")); // Asumimos que el perfil es el segundo campo
                this.setNombre(rs.getString("nombre_us")); // Asumimos que el nombre está en el tercer campo
            } else {
                respuesta = false;
                rs.close();
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return respuesta;
    }
    public String ingresarCliente()
	{
		String result="";
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_usuario (id_per, id_est, nombre_us,"
		+ "cedula_us,correo_us,clave_us) "
		+ "VALUES(?,?,?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,2);
			pr.setInt(2, this.getEstadoCivil());
			pr.setString(3, this.getNombre());
			pr.setString(4, this.getCedula());
			pr.setString(5, this.getCorreo());
			pr.setString(6, this.getClave());
			if(pr.executeUpdate()==1){
			result="Insercion correcta";
			}else{
			result="Error en insercion";
			}
		}catch(Exception ex){
			result=ex.getMessage();
			System.out.print(result);
		}finally{
			try{
				pr.close();
			 	con.getConexion().close();
			}catch(Exception ex){
				System.out.print(ex.getMessage());
			}
		}
		return result;
	}
    
    public String ingresarEmpleadoOAdministrador(String tipoPerfil) {
        String result = "";
        Conexion con = new Conexion();
        PreparedStatement pr = null;

        // Determinar el ID del perfil: 1 = Administrador, 2 = Empleado
        int idPerfil = tipoPerfil.equalsIgnoreCase("Administrador") ? 1 : 2;

        String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            pr = con.getConexion().prepareStatement(sql);
            pr.setInt(1, this.getPerfil());
            pr.setInt(2, this.getEstadoCivil());
            pr.setString(3, this.getNombre());
            pr.setString(4, this.getCedula());
            pr.setString(5, this.getCorreo());
            pr.setString(6, "654321"); // Clave fija

            if (pr.executeUpdate() == 1) {
                result = "Inserción correcta";
            } else {
                result = "Error en inserción";
            }
        } catch (Exception ex) {
            result = ex.getMessage();
            System.out.print(result);
        } finally {
            try {
                if (pr != null) pr.close();
                con.getConexion().close();
            } catch (Exception ex) {
                System.out.print(ex.getMessage());
            }
        }

        return result;
    }
    public boolean verificarClave(String nclave) {
        return this.Clave != null && this.Clave.equals(nclave);
    }
    public boolean coincidirClave(String nclave, String repetir) {
        return nclave != null && nclave.equals(repetir);
    }
    public boolean cambiarClave(String ncorreo, String nclave) {
        boolean cambiado = false;
        Conexion con = new Conexion();
        PreparedStatement pr = null;
        String sql = "UPDATE tb_usuario SET clave_us = ? WHERE correo_us = ?";
        
        try {
            pr = con.getConexion().prepareStatement(sql);
            pr.setString(1, nclave);
            pr.setString(2, ncorreo);
            int filas = pr.executeUpdate();
            if (filas == 1) {
                this.Clave = nclave; // Actualiza en el objeto también
                cambiado = true;
            }
        } catch (Exception e) {
            e.printStackTrace(); // puedes loguearlo
        } finally {
            try {
                if (pr != null) pr.close();
                con.getConexion().close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return cambiado;
    }

}

