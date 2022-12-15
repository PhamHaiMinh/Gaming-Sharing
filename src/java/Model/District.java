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
public class District {
    private String code;
    private String full_name;
    private String province_code;
    private ArrayList<String> ward_codes = new ArrayList<>();

    public District() {
    }

    public District(String code, String full_name, String province_code) {
        this.code = code;
        this.full_name = full_name;
        this.province_code = province_code;
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

    public String getProvince_code() {
        return province_code;
    }

    public void setProvince_code(String province_code) {
        this.province_code = province_code;
    }
    
    
}