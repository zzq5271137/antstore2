package com.mycomp.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mycomp.domain.Goods;
import com.mycomp.service.GoodsService;

@WebServlet("/GoodsServlet")
public class GoodsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        GoodsService goodsService = new GoodsService();
        List<Goods> allGoods = goodsService.findAllGoods();
        request.setAttribute("allGoods", allGoods);
        request.getRequestDispatcher("/goods_list.jsp").forward(request,
                response);
    }

}
