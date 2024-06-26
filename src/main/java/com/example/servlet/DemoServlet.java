package com.example.servlet;


import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DemoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        System.out.println("Username: " + username);
        System.out.println("Password: " + password);
        System.out.println("中文会乱码吗，我请问了");
//        resp.setContentType("text/html;charset=UTF-8");
//        resp.setCharacterEncoding("UTF-8");
//
//        PrintWriter writer = resp.getWriter();
//        writer.println("<html><body>");
//        writer.println("<h2>Form submitted successfully</h2>");
//        writer.println("<p>Username: " + username + "</p>");
//        writer.println("</body></html>");
//        writer.close();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("count", 1000L);
        resp.getWriter().write(jsonResponse.toString());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
