package com.ykd.dao;

import java.util.List;

import com.ykd.entity.Banner;
import com.ykd.entity.Down;
import com.ykd.entity.Goods;
import com.ykd.entity.Goods_intro;

public interface GoodsDao {

	Banner queryGoodsBanner();

	List<Banner> queryGoodsThirdBanner();

	List<Goods> queryGoods();

	Goods queryGoodsById(String id);

	Goods_intro queryGoodsMian(String id);
	
	List<Goods_intro> queryGoodsIntro(String id);
	

	List<Down> queryDown();

	void inserthonor(String name, String inner, String src, String url);

	void delete_down(String downid);

	void updategoodsbanner(String src);

	void insertgoods(String name, String src);

	void delete_goods(String goodsid);

	void insertgoodsintro(String goodsintroinner, String id, String src);

	void insertgoodsmain(String id, String goodsmain);

	void insert3banner(String id, String filename, String src);

	void delete_goodsbanner(String bannerid);

	void insertgoodsbanner(String src);

	Banner queryGoodsBannerById(String bannerid);

	List<Banner> queryGoodsBannerByOutId(String goodsid);

	Down queryDownById(String downid);

}
