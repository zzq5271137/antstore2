package com.mycomp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.mycomp.domain.Goods;
import com.mycomp.utils.JDBCUtil;

public class GoodsDao {

    public List<Goods> findAllGoods() {
        QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
        String sql = "select * from goods";
        List<Goods> allGoods = null;
        try {
            allGoods = runner.query(sql,
                    new BeanListHandler<Goods>(Goods.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allGoods;
    }

}
