/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Dao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

/**
 *
 * @author haimi
 * @param <T>
 */
public interface BaseImageDao<T> {

    String uploadImage(Part filePart, HttpServletRequest request, T item);

    public void destroyImage(int id);
}
