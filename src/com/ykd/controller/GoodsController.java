package com.ykd.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ykd.entity.Banner;
import com.ykd.entity.CommonwithGoods;
import com.ykd.entity.Down;
import com.ykd.entity.Goods;
import com.ykd.entity.Goods_intro;
import com.ykd.entity.Logo;
import com.ykd.service.CommonService;
import com.ykd.service.GoodsService;

@Component
@RequestMapping()
public class GoodsController {
	@Resource
	private GoodsService goodsService;
	@Resource
	private CommonService commonService;
	@RequestMapping(value="queryGoods",method=RequestMethod.GET)
	public String queryGoods(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Logo queryLogo = commonService.queryLogo();
		List<Banner> queryGoodsThirdBanner = goodsService.queryGoodsThirdBanner();
		List<Goods> queryGoods = goodsService.queryGoods();
		Banner querygoodSbG = goodsService.querygoodSbG();
		if (queryLogo==null) {
			request.setAttribute("logo_src", "");
		} else {
			String logo_src = queryLogo.getLogo_src();
			request.setAttribute("logo_src", logo_src);
		}
		if (querygoodSbG==null) {
			request.setAttribute("banner_src2", "");
		}else {
			String banner_src2 = querygoodSbG.getBanner_src();
			request.setAttribute("banner_src2", banner_src2);
		}
		request.setAttribute("queryGoodsThirdBanner", queryGoodsThirdBanner);
		request.setAttribute("queryGoods", queryGoods);
		return "goods";
	}

	@RequestMapping(value="queryGoodsInner",method=RequestMethod.GET)
	public String queryGoodsInner(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		Goods queryGoodsById = goodsService.queryGoodsById(id);
		String goods_mainimg = queryGoodsById.getGoods_mainimg();
		String goods_name = queryGoodsById.getGoods_name();
		Goods_intro queryGoodsMian = goodsService.queryGoodsMian(id);
		if (queryGoodsMian==null) {
			return "index";
		}else {
			String getGoodsintro_inner = queryGoodsMian.getGoodsintro_inner();
			List<Goods_intro> queryGoodsIntro = goodsService.queryGoodsIntro(id);
			Banner queryGoodsInnerBanner = goodsService.queryGoodsInnerBanner(id);
			String banner_src = queryGoodsInnerBanner.getBanner_src();
			Logo queryLogo = commonService.queryLogo();
			String logo_src = queryLogo.getLogo_src();
			List<Goods> queryGoods = goodsService.queryGoods();

			request.setAttribute("getGoodsintro_inner", getGoodsintro_inner);
			request.setAttribute("queryGoodsIntro", queryGoodsIntro);

			request.setAttribute("goods_mainimg", goods_mainimg);
			request.setAttribute("goods_name", goods_name);
			request.setAttribute("queryGoods", queryGoods);
			request.setAttribute("logo_src", logo_src);
			request.setAttribute("banner_src", banner_src);
			return "goodsInner";}
	}

	@RequestMapping(value="queryDown",method=RequestMethod.GET)
	public String queryDown(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Banner queryGoodsBanner = goodsService.queryGoodsBanner();
		List<Down> queryDown = goodsService.queryDown();
		Logo queryLogo = commonService.queryLogo();
		if (queryGoodsBanner==null) {
			request.setAttribute("banner_src", "");
		}else {
			String banner_src = queryGoodsBanner.getBanner_src();
			request.setAttribute("banner_src", banner_src);
		}
		if (queryLogo==null) {
			request.setAttribute("logo_src", "");
		}else {
			String logo_src = queryLogo.getLogo_src();
			request.setAttribute("logo_src", logo_src);
		}
		request.setAttribute("queryDown", queryDown);
		return "download";
	}
	@RequestMapping(value="querybackdown",method=RequestMethod.GET)
	public String querybackdown(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<Down> queryDown = goodsService.queryDown();
		request.setAttribute("queryDown", queryDown);
		return "manager/Download";
	}
	@RequestMapping(value="insertdown",method=RequestMethod.POST)
	@ResponseBody
	public boolean insertdown(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String name = request.getParameter("name");
		String inner = request.getParameter("inner");
		String url1 = request.getParameter("url1");
		System.out.println(url1);
		String url2 = request.getParameter("url2");
		System.out.println(url2);
		if(!file.isEmpty()) {
			//上传文件路径
			String path=updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "down"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			goodsService.insertdown(name,inner,src,url1,url2);
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping(value="updatedown",method=RequestMethod.POST)
	@ResponseBody
	public boolean updatedown(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String inner = request.getParameter("inner");
		String url1 = request.getParameter("url1");
		String url2 = request.getParameter("url2");
		Down queryDownById2 = goodsService.queryDownById(id);
		String src = queryDownById2.getDown_img();
		if(!file.isEmpty()) {
			//先把老的删了
			String deleteServer = deleteServer();
			Down queryDownById = goodsService.queryDownById(id);
			String down_img = queryDownById.getDown_img();
			deleteimg(deleteServer, down_img);
			//上传文件路径
			String path=updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "down"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			src="images/"+filename;
			goodsService.updatedown(id,name,inner,src,url1,url2);
		} else {
			goodsService.updatedown(id,name,inner,src,url1,url2);

		}
		return true;
	}
	@RequestMapping(value="updategoods",method=RequestMethod.POST)
	@ResponseBody
	public boolean updategoods(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		String oid = request.getParameter("oid");
		String goods_name = request.getParameter("goods_name");
		String goodsintro_inner = request.getParameter("goodsintro_inner");
		Goods queryGoodsById = goodsService.queryGoodsById(id);
		String src = queryGoodsById.getGoods_mainimg();
		if (goodsintro_inner!=null) {
			System.out.println(goodsintro_inner);
			goodsService.updategoodsintromain(oid,goodsintro_inner);
		}
		if(!file.isEmpty()) {
			//先把老的删了
			String deleteServer = deleteServer();
			deleteimg(deleteServer, src);
			//上传文件路径
			String path=updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "goodsmain"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			src="images/"+filename;
			goodsService.updategoods(id,goods_name,src);
		} else {
			goodsService.updategoods(id,goods_name,src);

		}
		return true;
	}
	@RequestMapping(value="updategoodsintro",method=RequestMethod.POST)
	@ResponseBody
	public boolean updategoodsintro(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String oid = request.getParameter("oid");
		String goods_intro = request.getParameter("goods_intro");
		Goods_intro queryGoodsIntroById = goodsService.queryGoodsIntroById(oid);
		String src = queryGoodsIntroById.getGoodsintro_img();
		if(!file.isEmpty()) {
			//先把老的删了
			String deleteServer = deleteServer();
			deleteimg(deleteServer, src);
			//上传文件路径
			String path=updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "goodsintro"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			src="images/"+filename;
			goodsService.updategoodsintro(oid,goods_intro,src);
		} else {
			goodsService.updategoodsintro(oid,goods_intro,src);

		}
		return true;
	}
	@RequestMapping(value="delete_down",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete_down(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String deleteServer = deleteServer();
		String downid = request.getParameter("downid");
		Down queryDownById = goodsService.queryDownById(downid);
		String down_img = queryDownById.getDown_img();
		boolean deleteimg = deleteimg(deleteServer, down_img);
		if (deleteimg==true) {
			goodsService.delete_down(downid);
			return true;
		}else {
			return false;
		}

	}
	@RequestMapping(value="querybackgoods",method=RequestMethod.GET)
	public String querybackgoods(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<Banner> queryGoodsThirdBanner = goodsService.queryGoodsThirdBanner();
		List<Banner> queryAllGoodsBanner = goodsService.queryAllGoodsBanner();
		List<CommonwithGoods> queryCommonWithGoods = goodsService.queryCommonWithGoods();
		List<CommonwithGoods> queryCommonWithGoods2 = goodsService.queryCommonWithGoods2();
		List<Banner> queryGoodsFouthBanner = goodsService.queryGoodsFouthBanner();
		List<Goods> queryGoods = goodsService.queryGoods();
		Banner querygoodSbG = goodsService.querygoodSbG();
		if (querygoodSbG==null) {
			request.setAttribute("banner_src", "");
		}else {
			String banner_src = querygoodSbG.getBanner_src();
			request.setAttribute("banner_src", banner_src);
		}
		request.setAttribute("queryAllGoodsBanner", queryAllGoodsBanner);
		request.setAttribute("queryCommonWithGoods", queryCommonWithGoods);
		request.setAttribute("queryGoodsThirdBanner", queryGoodsThirdBanner);
		request.setAttribute("queryGoodsFouthBanner", queryGoodsFouthBanner);
		request.setAttribute("queryCommonWithGoods2", queryCommonWithGoods2);
		request.setAttribute("queryGoods", queryGoods);
		return "manager/Goods";
	}
	@RequestMapping(value="updategoodsbanner",method=RequestMethod.POST)
	@ResponseBody
	public boolean updategoodsbanner(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		if(!file.isEmpty()) {
			//上传文件路径
			String path=updateServer();
			//上传文件名
			String filename = "secend_banner_goods"+id+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			Banner queryGoodsBanner = goodsService.queryGoodsBannerByOutId1(id);
			if (queryGoodsBanner!=null) {
				goodsService.updategoodsbanner(id,src);
			}else {
				goodsService.insertgoodsbanner(id,filename,src);
			}

			return true;
		} else {
			return false;
		}
	}
	@RequestMapping(value="updategoodSbG",method=RequestMethod.POST)
	@ResponseBody
	public boolean updategoodSbG(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if(!file.isEmpty()) {
			//上传文件路径
			String path=updateServer();
			//上传文件名
			String filename = "secend_banner_SbG"+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			Banner querygoodSbG = goodsService.querygoodSbG();
			if (querygoodSbG!=null) {
				filename=querygoodSbG.getBanner_name();
				goodsService.updategoodSbG(src);
			}else {
				goodsService.insertgoodSbG(src);
			}

			return true;
		} else {
			return false;
		}
	}
	@RequestMapping(value="insertgoods",method=RequestMethod.POST)
	@ResponseBody
	public boolean insertgoods(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String name = request.getParameter("name");
		if(!file.isEmpty()) {
			//上传文件路径
			String path=updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "goods"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			goodsService.insertgoods(name,src);
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping(value="delete_goods",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete_goods(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String goodsid = request.getParameter("goodsid");
		String deleteServer = deleteServer();
		Goods queryGoodsById = goodsService.queryGoodsById(goodsid);
		String goods_mainimg = queryGoodsById.getGoods_mainimg();
		@SuppressWarnings("unused")
		boolean deleteimg = deleteimg(deleteServer, goods_mainimg);
		List<Banner> queryGoodsBannerByOutId = goodsService.queryGoodsBannerByOutId(goodsid);
		if (queryGoodsBannerByOutId.isEmpty()==false) {
			for (Banner banner : queryGoodsBannerByOutId) {
				String banner_src = banner.getBanner_src();
				System.out.println("近来来");
				deleteimg(deleteServer, banner_src);
			}
		}
		List<Goods_intro> queryGoodsIntro = goodsService.queryGoodsIntro(goodsid);
		if (queryGoodsIntro.isEmpty()==false) {
			for (Goods_intro goods_intro : queryGoodsIntro) {
				String goodsintro_img = goods_intro.getGoodsintro_img();
				deleteimg(deleteServer, goodsintro_img);
			}
		}
		goodsService.delete_goods(goodsid);
		return true;
	}
	@RequestMapping(value="delete_goodsintro",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete_goodsintro(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String goodsintroid = request.getParameter("goodsintroid");
		String deleteServer = deleteServer();
		Goods_intro queryGoodsIntroById = goodsService.queryGoodsIntroById(goodsintroid);
		String goodsintro_img = queryGoodsIntroById.getGoodsintro_img();
		@SuppressWarnings("unused")
		boolean deleteimg = deleteimg(deleteServer, goodsintro_img);
		goodsService.delete_goodsintro(goodsintroid);
		return true;
	}
	@RequestMapping(value="insertgoodsintro",method=RequestMethod.POST)
	@ResponseBody
	public boolean insertgoodsintro(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String goodsintro = request.getParameter("goodsintro");
		String id = request.getParameter("id");
		if(!file.isEmpty()) {
			//上传文件路径
			String path=updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "goodsintro"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			goodsService.insertgoodsintro(goodsintro,id,src);
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping(value="insertgoodsmain",method=RequestMethod.POST)
	@ResponseBody
	public boolean insertgoodsmain(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String goodsmain = request.getParameter("goodsmain");
		String id = request.getParameter("id");
		goodsService.insertgoodsmain(id,goodsmain);
		return true;
	}
	@RequestMapping(value="insert3banner",method=RequestMethod.POST)
	@ResponseBody
	public boolean insert3banner(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		if(!file.isEmpty()) {
			//上传文件路径
			String path=updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "goodsbanner"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			goodsService.insert3banner(id,filename,src);
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping(value="insert4banner",method=RequestMethod.POST)
	@ResponseBody
	public boolean insert4banner(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		if(!file.isEmpty()) {
			//上传文件路径
			String path=updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "goodsfloat"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			goodsService.insert4banner(id,filename,src);
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping(value="delete_goodsbanner",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete_goodsbanner(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String bannerid = request.getParameter("bannerid");
		String deleteServer = deleteServer();
		Banner queryGoodsBannerById = goodsService.queryGoodsBannerById(bannerid);
		String banner_src = queryGoodsBannerById.getBanner_src();
		boolean deleteimg = deleteimg(deleteServer, banner_src);
		if (deleteimg==true) {
			goodsService.delete_goodsbanner(bannerid);
			return true;
		}else {
			return false;
		}
	}
	@RequestMapping(value="delete_4banner",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete_4banner(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String bannerid = request.getParameter("id");
		String deleteServer = deleteServer();
		Banner queryGoodsBannerById = goodsService.queryGoodsBannerById(bannerid);
		String banner_src = queryGoodsBannerById.getBanner_src();
		boolean deleteimg = deleteimg(deleteServer, banner_src);
		if (deleteimg==true) {
			goodsService.delete_goodsbanner(bannerid);
			return true;
		}else {
			return false;
		}
	}


	////////
	public  String updateServer() {
		return "/Library/Tomcat/res/images";
	}
	public String deleteServer() {
		return "/Library/Tomcat/res";
	}
	public boolean deleteimg(String path,String filename) {
		File file = new File(path + File.separator+ filename);
		if (file.exists()) {
			file.delete();
			return true;
		}else {
			return false;
		}
	}
}
