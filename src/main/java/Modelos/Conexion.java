/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author A_Montoya
 */
public class Conexion {

    public Connection conn;
    private String host = "localhost:3306";
    private String dataBase = "moscolandia";
    private String user = "root";
    private String password = "";

    public void conectar() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://" + this.host + "/" + this.dataBase + "?zeroDateTimeBehavior=CONVERT_TO_NULL", this.user, this.password);
            System.out.println("RETROCHIMBA DE CONEXION!!");
        } catch (Exception error) {
            System.out.println("FALLO LA CONEXION !!" + error);
        }
    }

    public void desconectar() {
        conn = null;
    }

}
