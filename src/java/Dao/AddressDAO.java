/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Dao;

import Model.District;
import Model.Province;
import Model.Ward;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public interface AddressDAO {
    public ArrayList<Province> getAllProvinces();
    public ArrayList<District> getAllDistricts();
    public ArrayList<Ward> getAllWards();
    public boolean isWardValid(String ward_code);
    public boolean isDistrictValid(String district_code);
    public boolean isProvinceValid(String province_code);
    public boolean updateAddressDetail(int user_id, String address_detail);
}
