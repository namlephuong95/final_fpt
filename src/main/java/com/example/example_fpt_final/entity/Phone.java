package com.example.example_fpt_final.entity;

import com.example.example_fpt_final.annotation.Column;
import com.example.example_fpt_final.annotation.Entity;
import com.example.example_fpt_final.annotation.Id;
import com.example.example_fpt_final.util.SQLDataTypes;

import java.util.HashMap;

@Entity(tableName = "phones")
public class Phone {
    @Id(autoIncrement = true)
    @Column(columnName = "id", columnType = SQLDataTypes.INTEGER)
    private int id;
    @Column(columnName = "name", columnType = SQLDataTypes.VARCHAR50)
    private String name;
    @Column(columnName = "brand_id", columnType = SQLDataTypes.INTEGER)
    private int brand_id;
    @Column(columnName = "price", columnType = SQLDataTypes.DOUBLE)
    private double price;
    @Column(columnName = "description", columnType = SQLDataTypes.VARCHAR255)
    private String description;


    public Phone() {
        this.name = "";
        this.description = "";
    }

    public Phone(String name, int brand_id, double price, String description) {
        this.name = name;
        this.brand_id = brand_id;
        this.price = price;
        this.description = description;
    }

    public boolean isValid(){
        return getErrors().size() == 0;
    }

    public HashMap<String, String> getErrors(){
        HashMap<String, String> errors = new HashMap<>();
        if(name == null || name.trim().length() < 5){
            errors.put("name", "Name khong duoc bo trong va it hon 5 ky tu");
        }
        return errors;
    }

    @Override
    public String toString() {
        return "Phone{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", brand_id=" + brand_id +
                ", price=" + price +
                ", description='" + description + '\'' +
                '}';
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

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
