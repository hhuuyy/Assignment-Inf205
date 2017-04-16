/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Nguyen
 */
public class Product {
    private String code;
    private String name;
    private float price;
    private String image;
    private String detail;

    public Product() {
    }
    
    public Product(String code, String name, float price, String image, String detail) {
        this.code = code;
        this.name = name;
        this.price = price;
        this.image = image;
        this.detail = detail;
    }
    public Product(String code, String name, float price){
        this.code = code;
        this.name = name;
        this.price = price;
    }
    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getCode() {
        return code;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    
}
