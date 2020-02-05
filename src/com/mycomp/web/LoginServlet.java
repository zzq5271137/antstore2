package com.mycomp.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.mycomp.domain.User;
import com.mycomp.utils.JDBCUtil;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
        String sql = "select * from user where username = ? and password = ?";
        User user = null;
        try {
            user = runner.query(sql, new BeanHandler<User>(User.class),
                    username, password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        if (user == null) {
            response.getWriter().write("<h1>用户名或密码错误</h1>");
            response.setHeader("refresh", "3;/AntStore2/login.jsp");
        } else {
            response.getWriter().write("<h1>登录成功！</h1>");
            
            // 把用户保存起来
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            response.setHeader("refresh", "3;/AntStore2/index.jsp");
        }
    }

}
