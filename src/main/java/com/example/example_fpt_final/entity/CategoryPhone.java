package com.example.example_fpt_final.entity;

import com.example.example_fpt_final.annotation.Column;
import com.example.example_fpt_final.annotation.Entity;
import com.example.example_fpt_final.annotation.Id;
import com.example.example_fpt_final.util.SQLDataTypes;

@Entity(tableName = "categories")
public class CategoryPhone {
    @Id(autoIncrement = true)
    @Column(columnName = "id", columnType = SQLDataTypes.INTEGER)
    private int id;
    @Column(columnName = "cateName", columnType = SQLDataTypes.VARCHAR50)
    private String cateName;

    public CategoryPhone() {
    }

    public CategoryPhone(String cateName) {
        this.cateName = cateName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }
}
