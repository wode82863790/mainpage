package com.ykd.dao;

import java.util.List;

import com.ykd.entity.Banner;
import com.ykd.entity.CommonwithGoods;
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

	void insertdown(String name, String inner, String src, String url1, String url2);

	void delete_down(String downid);

	void updategoodsbanner(String id, String src);

	void insertgoods(String name, String src);

	void delete_goods(String goodsid);

	void insertgoodsintro(String goodsintroinner, String id, String src);

	void insertgoodsmain(String id, String goodsmain);

	void insert3banner(String id, String filename, String src);

	void delete_goodsbanner(String bannerid);

	void insertgoodsbanner(String id, String filename, String src);

	Banner queryGoodsBannerById(String bannerid);

	List<Banner> queryGoodsBannerByOutId(String goodsid);

	Down queryDownById(String downid);

	Banner queryGoodsInnerBanner(String id);

	Banner queryGoodsBannerByOutId1(String id);

	List<Banner> queryAllGoodsBanner();

	void updatedown(String id, String name, String inner, String src, String url1, String url2);

	Banner querygoodSbG();

	void updategoodSbG(String src);

	void insertgoodSbG(String src);

	List<CommonwithGoods> queryCommonWithGoods();

	void updategoodsintromain(String oid, String goodsintro_inner);

	void updategoods(String id, String goods_name, String src);

	List<CommonwithGoods> queryCommonWithGoods2();

	Goods_intro queryGoodsIntroById(String oid);

	void updategoodsintro(String id, String goodsintro_inner, String src);

	void delete_goodsintro(String goodsintroid);

	List<Banner> queryGoodsFouthBanner();



}
