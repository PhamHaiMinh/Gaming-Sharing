/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Pagination {

    final int ROW_COUNT_ADMIN = 2;
    final int ROW_COUNT_PUBLIC = 5;

    public int getRowCountAdmin() {
        return ROW_COUNT_ADMIN;
    }

    public int getRowCountPublic() {
        return ROW_COUNT_PUBLIC;
    }

    public int getOffset(int current_page, int row_count) {
        return (current_page - 1) * row_count;
    }

    public int getPages(int total, int row_count) {
        return (int) Math.ceil((float) total / row_count);
    }

}
