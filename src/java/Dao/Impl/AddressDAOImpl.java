/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao.Impl;

import Dao.AddressDAO;
import Dao.DBContext;
import Model.District;
import Model.Province;
import Model.Ward;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class AddressDAOImpl implements AddressDAO {

    @Override
    public ArrayList<Province> getAllProvinces() {
        String sql = "SELECT [code]\n"
                + "      ,[full_name]\n"
                + "  FROM [dbo].[provinces]";
        ArrayList<Province> provinces = new ArrayList<>();
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Province p = new Province();
                p.setCode(rs.getString("code"));
                p.setFull_name(rs.getString("full_name"));
                provinces.add(p);
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            System.out.println("Error at address");
        }
        return provinces;
    }

    @Override
    public ArrayList<District> getAllDistricts() {
        String sql = "SELECT [code]\n"
                + "      ,[full_name]\n"
                + "      ,[province_code]\n"
                + "  FROM [dbo].[districts]";
        ArrayList<District> districts = new ArrayList<>();
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                District d = new District();
                d.setCode(rs.getString("code"));
                d.setFull_name(rs.getString("full_name"));
                d.setProvince_code(rs.getString("province_code"));
                districts.add(d);
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            System.out.println("Error at address");
        }
        return districts;
    }

    @Override
    public ArrayList<Ward> getAllWards() {
        String sql = "SELECT w.[code]\n"
                + "      ,w.[full_name]\n"
                + "      ,[district_code]\n"
                + "	  ,d.province_code\n"
                + "  FROM [dbo].[wards] w left join districts d\n"
                + "  on w.district_code = d.code";
        ArrayList<Ward> wards = new ArrayList<>();
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ward w = new Ward();
                w.setCode(rs.getString("code"));
                w.setFull_name(rs.getString("full_name"));
                w.setDistrict_code(rs.getString("district_code"));
                w.setProvince_code(rs.getString("province_code"));
                wards.add(w);
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            System.out.println("Error at address");
        }
        return wards;
    }

    @Override
    public boolean isWardValid(String ward_code) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean isDistrictValid(String district_code) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean isProvinceValid(String province_code) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean updateAddressDetail(int user_id, String address_detail) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "UPDATE [dbo].[Address]\n"
                    + "      set [address_detail] = ?\n"
                    + " WHERE user_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, address_detail);
            ps.setInt(2, user_id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
            return true;
        } catch (SQLException e) {
            System.out.println("Error at address");
        }
        return false;
    }

}
