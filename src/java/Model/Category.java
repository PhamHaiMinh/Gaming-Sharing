package Model;

/**
 *
 * @author Mr Tuan
 */
public class Category {

  private int id;
  private String name;
  private int totalOfProduct;

  public Category() {}

  public Category(int id, String name) {
    this.id = id;
    this.name = name;
  }

  public Category(String name) {
    this.name = name;
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

  public int getTotalOfProduct() {
    return totalOfProduct;
  }

  public void setTotalOfProduct(int totalOfProduct) {
    this.totalOfProduct = totalOfProduct;
  }

  public Category(int id, String name, int totalOfProduct) {
    this.id = id;
    this.name = name;
    this.totalOfProduct = totalOfProduct;
  }
}
    return totalOfProduct;
  }

  public void setTotalOfProduct(int totalOfProduct) {
    this.totalOfProduct = totalOfProduct;
  }

  public Category(int id, String name, int totalOfProduct) {
    this.id = id;
    this.name = name;
    this.totalOfProduct = totalOfProduct;
  }
}
