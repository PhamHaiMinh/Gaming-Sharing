/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Dao;

import Model.Cancel;
import Model.Category;
import java.util.ArrayList;

/**
 *
 * @author haimi
 */
public interface CancelDao extends BaseDao<Cancel> {

    public ArrayList<Cancel> getAll(int page);
}
