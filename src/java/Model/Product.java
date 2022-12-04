/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author LENOVO
 */
public class Product {

    private int id;
    private String name;
    private int price;
    private int viewed;
    private int quantity;
    private String description;
    private int categoryId;
    private String image;
    private Category category;

    public Product() {
    }

    public Product(int id, String name, int price, int viewed, int quantity, String description, int categoryId, String image, Category category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.viewed = viewed;
        this.quantity = quantity;
        this.description = description;
        this.categoryId = categoryId;
        this.image = image;
        this.category = category;
    }

    public Product(int id, String name, int price, int viewed, int quantity, String description, int categoryId, String image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.viewed = viewed;
        this.quantity = quantity;
        this.description = description;
        this.categoryId = categoryId;
        this.image = image;
    }

    public Product(int id, String name, int price, int quantity, String description, int categoryId, String image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.categoryId = categoryId;
        this.image = image;
    }

    public Product(int id, String name, int price, int quantity, String description, int categoryId) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.categoryId = categoryId;
    }

    public Product(String name, int price, int quantity, String description, int categoryId) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.categoryId = categoryId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getViewed() {
        return viewed;
    }

    public void setViewed(int viewed) {
        this.viewed = viewed;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", viewed=" + viewed + ", quantity=" + quantity + ", description=" + description + ", categoryId=" + categoryId + ", image=" + image + ", category=" + category + '}';
    }

}
