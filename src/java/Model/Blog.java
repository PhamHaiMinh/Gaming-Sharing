/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author LENOVO
 */
public class Blog {

    private String id;
    private String tittle;
    private String body;
    private String create_time;
    private String category;
    private String image;
    private String catId;
    private int viewed;
    private int prioritized;
    private String source;
    private String userId;
    private int browser;
    private String author;

    public Blog() {
    }

    public Blog(String id, String tittle, String body, String create_time, String category, String image, String catId, int viewed, int prioritized, String source, String userId, int browser, String author) {
        this.id = id;
        this.tittle = tittle;
        this.body = body;
        this.create_time = create_time;
        this.category = category;
        this.image = image;
        this.catId = catId;
        this.viewed = viewed;
        this.prioritized = prioritized;
        this.source = source;
        this.userId = userId;
        this.browser = browser;
        this.author = author;
    }

    public int getBrowser() {
        return browser;
    }

    public void setBrowser(int browser) {
        this.browser = browser;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCatId() {
        return catId;
    }

    public void setCatId(String catId) {
        this.catId = catId;
    }

    public int getViewed() {
        return viewed;
    }

    public void setViewed(int viewed) {
        this.viewed = viewed;
    }

    public int getPrioritized() {
        return prioritized;
    }

    public void setPrioritized(int prioritized) {
        this.prioritized = prioritized;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

}
