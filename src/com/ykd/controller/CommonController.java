package com.ykd.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import com.ykd.jwt.TokenState;
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
import com.ykd.entity.Logo;
import com.ykd.jwt.Jwt;
import com.ykd.service.CommonService;


@Component
@RequestMapping()
public class CommonController {
	@Resource
	private CommonService commonService;
	@RequestMapping(value="updatelogo",method=RequestMethod.POST)
	@ResponseBody
	public boolean updatelogo(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			//上传文件路径
			String path = updateServer();
			//上传文件名
			String filename = "logo.jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			Logo queryLogo = commonService.queryLogo();
			if (queryLogo==null) {
				commonService.insertLogo(src);
			}else {
				commonService.updateLogo(src);
			}
			return true;
		} else {
			return false;
		}

	}
	@RequestMapping(value="updates_banner",method=RequestMethod.POST)
	@ResponseBody
	public boolean updates_banner(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			//上传文件路径
			String path = updateServer();
			//上传文件名
			String filename = "s_banner1.jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			Banner queryS_banner = commonService.queryS_banner();
			if (queryS_banner==null) {
				commonService.inserts_banner(src);
			}else {
				commonService.updates_banner(src);
			}
			return true;
		} else {
			return false;
		}

	}
	@RequestMapping(value="update_qr",method=RequestMethod.POST)
	@ResponseBody
	public boolean update_qr(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			//上传文件路径
			String path = updateServer();
			//上传文件名
			String filename = "qr.jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			return true;
		} else {
			return false;
		}

	}
	@RequestMapping(value="update_mbanner",method=RequestMethod.POST)
	@ResponseBody
	public boolean update_mbanner(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			//上传文件路径
			String path = updateServer();
			//上传文件名
			String filename = "mbanner.jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			Banner queryMbanner = commonService.queryMBanner();
			if (queryMbanner==null) {
				commonService.insertMbanner(src);
			}else {
				commonService.updateMbanner(src);
			}
			return true;
		} else {
			return false;
		}

	}
	@RequestMapping(value="updatebanner",method=RequestMethod.POST)
	@ResponseBody
	public boolean updatebanner(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			//上传文件路径
			String path = updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "banner"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			commonService.updatebanner(filename,src);
			return true;
		} else {
			return false;
		}

	}

	@RequestMapping(value="index",method=RequestMethod.GET)
	public String index(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		Banner queryMBanner = commonService.queryMBanner();
		if (queryMBanner==null) {
			request.setAttribute("mbanner_src", "");
		}else {
			String mbanner_src = queryMBanner.getBanner_src();
			request.setAttribute("mbanner_src", mbanner_src);
		}
		List<Banner> queryBanner = commonService.queryBanner();
		request.setAttribute("queryBanner", queryBanner);
		return "index";
	}

	@RequestMapping(value="querycommon",method=RequestMethod.GET)
	public String queryCommon(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		List<Banner> queryBanner = commonService.queryBanner();
		Banner queryS_banner = commonService.queryS_banner();
		Logo queryLogo = commonService.queryLogo();
		Banner queryMBanner = commonService.queryMBanner();
		if (queryLogo==null) {
			request.setAttribute("logo_src", null);
		}else {
			String logo_src = queryLogo.getLogo_src();
			request.setAttribute("logo_src", logo_src);
		}
		if (queryS_banner==null) {
			request.setAttribute("banner_src", null);
		}else {
			String banner_src = queryS_banner.getBanner_src();
			request.setAttribute("banner_src", banner_src);
		}
		if (queryMBanner==null) {
			request.setAttribute("queryMBanner", null);
		}else {
			String banner_src2 = queryMBanner.getBanner_src();
			request.setAttribute("banner_src2", banner_src2);
		}
		request.setAttribute("queryBanner", queryBanner);
		return "manager/Common";
	}
	@RequestMapping(value="delete_banner",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete_bannr(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String bannerid = request.getParameter("bannerid");
		String deleteServer = deleteServer();
		Banner queryBannerById = commonService.queryBannerById(bannerid);
		String banner_src = queryBannerById.getBanner_src();
		boolean deleteimg = deleteimg(deleteServer, banner_src);
		if (deleteimg==true) {
			commonService.delete_banner(bannerid);
			return true;
		}else{
			return false;
		}
	}
	@RequestMapping(value="judgeToken",method=RequestMethod.POST)
	@ResponseBody
	public boolean judgeToken(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String token = request.getParameter("token");
		Map<String, Object> resultMap = Jwt.validToken(token);
		TokenState tokenState = TokenState.getTokenState((String)resultMap.get("state"));
		String flag=null;
		switch (tokenState) {
		case VALID:
			flag="true";
			break;
		case EXPIRED:
		case INVALID:
			break;
		}
		if (flag!=null) {
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
