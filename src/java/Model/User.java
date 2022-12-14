/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author LENOVO
 */
public class User {

    private Account account;
    private int id;
    private String last_name;
    private String middle_name;
    private String first_name;
    private boolean gender;
    private String phone;
    private Address address;
    private String avt;

    public User() {
    }

    public User(Account account, int id, String last_name, String middle_name, String first_name, boolean gender, String phone, Address address, String avt) {
        this.account = account;
        this.id = id;
        this.last_name = last_name;
        this.middle_name = middle_name;
        this.first_name = first_name;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.avt = avt;
    }

    public User(Account account, int id, String last_name, String middle_name, String first_name, boolean gender, String phone, String avt) {
        this.account = account;
        this.id = id;
        this.last_name = last_name;
        this.middle_name = middle_name;
        this.first_name = first_name;
        this.gender = gender;
        this.phone = phone;
        this.avt = avt;
    }
    
    public User(Account account, int id, String last_name, String middle_name, String first_name, boolean gender, String phone, Address address) {
        this.account = account;
        this.id = id;
        this.last_name = last_name;
        this.middle_name = middle_name;
        this.first_name = first_name;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getMiddle_name() {
        return middle_name;
    }

    public void setMiddle_name(String middle_name) {
        this.middle_name = middle_name;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getAvt() {
        return avt;
    }

    public void setAvt(String avt) {
        this.avt = avt;
    }

}
