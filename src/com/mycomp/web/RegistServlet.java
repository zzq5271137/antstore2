package com.mycomp.web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;

import com.mycomp.domain.User;
import com.mycomp.utils.JDBCUtil;

@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String code = request.getParameter("code");
        String checkCode = (String) this.getServletContext()
                .getAttribute("checkCode");
        if (code.equals(checkCode)) {
            // 接收所有参数
            Map<String, String[]> parameterMap = request.getParameterMap();
            User user = new User();

            // 使用BeanUtils把接收的参数封装成对象
            try {
                BeanUtils.populate(user, parameterMap);
            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
            }
            System.out.println(user);

            // 生成并设置uid
            String uid = UUID.randomUUID().toString();
            user.setUid(uid);

            // 写入数据库
            QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
            String sql = "insert into user values(?,?,?,?)";
            try {
                runner.update(sql, user.getUid(), user.getUsername(),
                        user.getPassword(), user.getPhone());
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            // 跳转到登录页面
            response.setHeader("refresh", "3;url=/AntStore2/login.jsp");

            response.getWriter().write("<h1>注册成功！</h1>");
        } else {
            response.getWriter().write("验证码错误");
            response.setHeader("refresh", "3;url=/AntStore2/regist.jsp");
        }
    }

}
