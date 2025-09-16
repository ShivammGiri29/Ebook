package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;

@WebServlet("/updatePassword")
public class UpdatePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String newpass = request.getParameter("newpass");

        UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
        boolean f = dao.updatePassword(email, newpass);

        if (f) {
            request.setAttribute("msg", "Password updated successfully! Please login.");
            request.setAttribute("msgType", "success"); // for green color
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "Invalid email. Try again!");
            request.setAttribute("msgType", "error"); // for red color
            request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
        }
    }
}
