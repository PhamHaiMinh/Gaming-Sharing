/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class Province {
    private String code;
    private String full_name;
    private ArrayList<String> district_code = new ArrayList<>();

    public Province() {
    }

    public Province(String code, String full_name) {
        this.code = code;
        this.full_name = full_name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }
    
    
}
