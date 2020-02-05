package com.mycomp.service;

import java.util.List;

import com.mycomp.dao.GoodsDao;
import com.mycomp.domain.Goods;

public class GoodsService {

    public List<Goods> findAllGoods() {
        GoodsDao goodsDao = new GoodsDao();
        return goodsDao.findAllGoods();
    }

}
