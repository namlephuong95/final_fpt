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
import java.util.List;

public class CreatePhoneServlet extends HttpServlet {
    private static JpaRepository<CategoryPhone> categoryPhoneJpaRepository = new JpaRepository<>(CategoryPhone.class);
    private static JpaRepository<Phone> phoneJpaRepository = new JpaRepository<>(Phone.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryPhone> categoryList;
        categoryList = categoryPhoneJpaRepository.findAll();
        req.setAttribute("categories", categoryList);
        req.getRequestDispatcher("/admin/phone/create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
//            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            double price = Double.parseDouble(req.getParameter("price"));
            String description = req.getParameter("description");
            int category_id = Integer.parseInt(req.getParameter("category_id"));
            Phone phone = new Phone(name, category_id, price, description);
            if(phone.isValid()){
                phoneJpaRepository.save(phone);
                resp.sendRedirect("/admin/phone/list");
            }else {
                HashMap<String, String> errors = new HashMap<>();
                errors = phone.getErrors();
                req.setAttribute("errors", errors);
                req.setAttribute("coupon", phone);
                List<CategoryPhone> categoryList = new ArrayList<>();
                categoryList = categoryPhoneJpaRepository.findAll();
                req.setAttribute("categories", categoryList);
                req.getRequestDispatcher("/admin/phone/create.jsp").forward(req,resp);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
