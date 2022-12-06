/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author haimi
 */
public class Page {

    int page;
    int endPage;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public Page(int page, int endPage) {
        this.page = page;
        this.endPage = endPage;
    }

    public List<String> listPage() {
        List<String> pages = new ArrayList<String>();
        if (this.endPage > 5) {
            switch (this.page) {
                case 1:
                    pages.add("1");
                    pages.add("2");
                    pages.add("disabled");
                    pages.add(this.endPage + "");
                    break;
                case 2:
                    pages.add("1");
                    pages.add("2");
                    pages.add("3");
                    pages.add("disabled");
                    pages.add(this.endPage + "");
                    break;
                case 3:
                    pages.add("1");
                    pages.add("2");
                    pages.add("3");
                    pages.add("4");
                    pages.add("disabled");
                    pages.add(this.endPage + "");
                    break;
                default:
                    if (this.page == this.endPage) {
                        pages.add("1");
                        pages.add("disabled");
                        pages.add(this.page - 1 + "");
                        pages.add(this.page + "");
                    } else if (this.page == this.endPage - 1) {
                        pages.add("1");
                        pages.add("disabled");
                        pages.add(this.page - 1 + "");
                        pages.add(this.page + "");
                        pages.add(this.endPage + "");
                    } else if (this.page == this.endPage - 2) {
                        pages.add("1");
                        pages.add("disabled");
                        pages.add(this.page - 1 + "");
                        pages.add(this.page + "");
                        pages.add(this.page + 1 + "");
                        pages.add(this.endPage + "");
                    } else {
                        pages.add("1");
                        pages.add("disabled");
                        pages.add(this.page - 1 + "");
                        pages.add(this.page + "");
                        pages.add(this.page + 1 + "");
                        pages.add("disabled");
                        pages.add(this.endPage + "");
                    }
                    break;
            }

        } else {
            for (int i = 1; i <= this.endPage; i++) {
                pages.add(i + "");
            }
        }
        return pages;
    }
}
