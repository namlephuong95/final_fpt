package com.example.example_fpt_final.controller;

import com.example.example_fpt_final.entity.CategoryPhone;
import com.example.example_fpt_final.entity.Phone;
import com.example.example_fpt_final.repository.JpaRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class ListPhoneServlet extends HttpServlet {
    private JpaRepository<Phone> phoneJpaRepository = new JpaRepository<>(Phone.class);
    private JpaRepository<CategoryPhone> categoryPhoneJpaRepository = new JpaRepository<>(CategoryPhone.class);
    public static ArrayList<Phone> list = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        list = (ArrayList<Phone>) phoneJpaRepository.findAll();
        HashMap<CategoryPhone, Phone> reulstList = new HashMap<>();
        for (Phone obj :
                list) {
            CategoryPhone category = categoryPhoneJpaRepository.findById(obj.getBrand_id());
            reulstList.put(category, obj);
        }

        req.setAttribute("list", reulstList);
        req.getRequestDispatcher("/admin/phone/list.jsp").forward(req, resp);
    }
}
