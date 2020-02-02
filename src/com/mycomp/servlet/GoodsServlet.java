package com.mycomp.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.mycomp.domain.Goods;
import com.mycomp.utils.JDBCUtil;

@WebServlet("/GoodsServlet")
public class GoodsServlet extends HttpServlet {

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
        String sql = "select * from goods";
        List<Goods> allGoods = null;
        try {
            allGoods = runner.query(sql,
                    new BeanListHandler<Goods>(Goods.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("allGoods", allGoods);
        request.getRequestDispatcher("/goods_list.jsp").forward(request,
                response);
    }

}
