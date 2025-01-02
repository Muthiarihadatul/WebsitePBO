/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author LENOVO
 */
public class DosenKoor extends Model<DosenKoor>{
    private String kodeDosen;
    private String matkulKoor;
    private String kontakKoor;
    private String email;
    
    public DosenKoor() {
        this.table = "dosenkoor";
        this.primaryKey = "matkulKoor";
    }
    
    public DosenKoor(String kodeDosen, String matkulKoor, String kontakKoor, String email) {
        this.table = "dosenkoor";
        this.primaryKey = "matkulKoor";
        this.kodeDosen = kodeDosen;
        this.matkulKoor = matkulKoor;
        this.kontakKoor = kontakKoor;
        this.email = email;
    }
    
    @Override
    public DosenKoor toModel(ResultSet rs) {
        try {
            return new DosenKoor(
                // (#1.4) Lakukan get resultSet dari tiap parameter kolom yang ada
                this.kodeDosen = rs.getString("kodeDosen"),
                this.matkulKoor = rs.getString("matkulKoor"),
                this.kontakKoor = rs.getString("kontakKoor"),
                this.email = rs.getString("email")
            );
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
    
    public String getKodeDosen() {
        return this.kodeDosen;
    }
    
    public String getMK() {
        return this.matkulKoor;
    }
    
    public String getKontak() {
        return this.kontakKoor;
    }
    
    public String getEmail() {
        return this.email;
    }
}
