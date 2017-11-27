package com.ykd.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ykd.dao.GoodsDao;
import com.ykd.entity.Banner;
import com.ykd.entity.CommonwithGoods;
import com.ykd.entity.Down;
import com.ykd.entity.Goods;
import com.ykd.entity.Goods_intro;
import com.ykd.service.GoodsService;
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	@Resource
	private GoodsDao goodsDao;

	@Transactional
	public Banner queryGoodsBanner() {
		Banner queryGoodsBanner = goodsDao.queryGoodsBanner();
		return queryGoodsBanner;
	}

	@Transactional
	public List<Banner> queryGoodsThirdBanner() {
		List<Banner> queryGoodsThirdBanner = goodsDao.queryGoodsThirdBanner();
		return queryGoodsThirdBanner;
	}

	@Transactional
	public List<Goods> queryGoods() {
		List<Goods> queryGoods = goodsDao.queryGoods();
		return queryGoods;
	}

	@Transactional
	public Goods queryGoodsById(String id) {
		Goods queryGoodsById = goodsDao.queryGoodsById(id);
		return queryGoodsById;
	}

	@Transactional
	public List<Goods_intro> queryGoodsIntro(String id) {
		List<Goods_intro> queryGoodsIntro = goodsDao.queryGoodsIntro(id);
		return queryGoodsIntro;
	}



	@Transactional
	public Goods_intro queryGoodsMian(String id) {
		Goods_intro queryGoodsMian = goodsDao.queryGoodsMian(id);
		return queryGoodsMian;
	}


	@Transactional
	public List<Down> queryDown() {
		List<Down> queryDown = goodsDao.queryDown();
		return queryDown;
	}

	@Transactional
	public void insertdown(String name, String inner, String src,String url1,String url2) {
		goodsDao.insertdown(name,inner,src,url1,url2);

	}

	@Transactional
	public void delete_down(String downid) {
		goodsDao.delete_down(downid);
	}

	@Transactional
	public void updategoodsbanner(String id,String src) {
		goodsDao.updategoodsbanner(id,src);

	}

	@Transactional
	public void insertgoods(String name, String src) {
		goodsDao.insertgoods(name,src);
		
	}

	@Transactional
	public void delete_goods(String goodsid) {
		goodsDao.delete_goods(goodsid);
		
	}

	@Transactional
	public void insertgoodsintro(String goodsintroinner, String id, String src) {
		goodsDao.insertgoodsintro( goodsintroinner,  id,  src);
	}

	@Transactional
	public void insertgoodsmain(String id,String goodsmain) {
		goodsDao.insertgoodsmain(id,goodsmain);
		
	}

	@Transactional
	public void insert3banner(String id, String filename, String src) {
		goodsDao.insert3banner( id,  filename,  src); 
	}

	@Transactional
	public void delete_goodsbanner(String bannerid) {
		goodsDao.delete_goodsbanner(bannerid);
		
	}

	@Transactional
	public void insertgoodsbanner(String id,String filename,String src) {
		goodsDao.insertgoodsbanner(id,filename,src);
	}

	@Transactional
	public Banner queryGoodsBannerById(String bannerid) {
		Banner queryGoodsBannerById = goodsDao.queryGoodsBannerById(bannerid);
		return queryGoodsBannerById;
	}

	@Transactional
	public List<Banner> queryGoodsBannerByOutId(String goodsid) {
		List<Banner> queryGoodsBannerByOutId = goodsDao.queryGoodsBannerByOutId(goodsid);
		return queryGoodsBannerByOutId;
	}

	@Transactional
	public Down queryDownById(String downid) {
		Down queryDownById = goodsDao.queryDownById(downid);
		return queryDownById;
	}

	@Transactional
	public Banner queryGoodsInnerBanner(String id) {
		Banner queryGoodsInnerBanner = goodsDao.queryGoodsInnerBanner(id);
		return queryGoodsInnerBanner;
	}

	@Transactional
	public Banner queryGoodsBannerByOutId1(String id) {
		Banner queryGoodsBannerById = goodsDao.queryGoodsBannerByOutId1(id);
		return queryGoodsBannerById;
	}

	@Transactional
	public List<Banner> queryAllGoodsBanner() {
		List<Banner> queryAllGoodsBanner = goodsDao.queryAllGoodsBanner();
		return queryAllGoodsBanner;
	}

	@Transactional
	public void updatedown(String id, String name, String inner, String src, String url1, String url2) {
		goodsDao.updatedown( id,  name,  inner,  src,  url1,  url2);
		
	}

	@Transactional
	public Banner querygoodSbG() {
		Banner querygoodSbG = goodsDao.querygoodSbG();
		return querygoodSbG;
	}

	@Transactional
	public void updategoodSbG(String src) {
		goodsDao.updategoodSbG(src);
		
	}

	@Transactional
	public void insertgoodSbG(String src) {
		goodsDao.insertgoodSbG(src);
		
	}

	@Transactional
	public List<CommonwithGoods> queryCommonWithGoods() {
		List<CommonwithGoods> queryCommonWithGoods = goodsDao.queryCommonWithGoods();
		return queryCommonWithGoods;
	}

	@Transactional
	public void updategoodsintromain(String oid, String goodsintro_inner) {
		goodsDao.updategoodsintromain(oid,goodsintro_inner);
		
	}

	@Transactional
	public void updategoods(String id, String goods_name, String src) {
		goodsDao.updategoods(id,goods_name,src);
		
	}

	@Transactional
	public List<CommonwithGoods> queryCommonWithGoods2() {
		List<CommonwithGoods> queryCommonWithGoods2 = goodsDao.queryCommonWithGoods2();
		return queryCommonWithGoods2;
	}

	@Transactional
	public Goods_intro queryGoodsIntroById(String oid) {
		Goods_intro queryGoodsIntroById = goodsDao.queryGoodsIntroById(oid);
		return queryGoodsIntroById;
	}

	@Transactional
	public void updategoodsintro(String id, String goodsintro_inner, String src) {
		goodsDao.updategoodsintro(id,goodsintro_inner,src);
		
	}

	@Transactional
	public void delete_goodsintro(String goodsintroid) {
		goodsDao.delete_goodsintro(goodsintroid);
		
	}

	@Transactional
	public void insert4banner(String id, String filename, String src) {
		goodsDao.insert3banner(id,filename,src);
		
	}

	@Transactional
	public List<Banner> queryGoodsFouthBanner() {
		List<Banner> queryGoodsFouthBanner = goodsDao.queryGoodsFouthBanner();
		return queryGoodsFouthBanner;
	}



}
