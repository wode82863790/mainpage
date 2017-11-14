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

import com.ykd.entity.Ally;
import com.ykd.entity.Banner;
import com.ykd.entity.Callus_img;
import com.ykd.entity.Help;
import com.ykd.entity.Logo;
import com.ykd.service.CallUsService;
import com.ykd.service.CommonService;

@Component
@RequestMapping()
public class CallUsController {

	@Resource
	private CallUsService callUsService;
	@Resource
	private CommonService commonService;
	@RequestMapping(value="queryCall",method=RequestMethod.GET)
	public String queryCallUs(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<Callus_img> queryBank = callUsService.queryBank();
		List<Callus_img> queryStore = callUsService.queryStore();
		Logo queryLogo = commonService.queryLogo();
		String logo_src = queryLogo.getLogo_src();
		Banner queryCallBanner=callUsService.queryCallBanner();
		String banner_src = queryCallBanner.getBanner_src();
		request.setAttribute("queryBank", queryBank);
		request.setAttribute("queryStore", queryStore);
		request.setAttribute("banner_src", banner_src);
		request.setAttribute("logo_src", logo_src);
		return "callUs";

	}
	@RequestMapping(value="queryHelp",method=RequestMethod.GET)
	public String queryHelp(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Logo queryLogo = commonService.queryLogo();
		String logo_src = queryLogo.getLogo_src();
		Banner queryCallBanner=callUsService.queryCallBanner();
		String banner_src = queryCallBanner.getBanner_src();
		List<Help> queryHelp = callUsService.queryHelp();
		request.setAttribute("banner_src", banner_src);
		request.setAttribute("logo_src", logo_src);
		request.setAttribute("queryHelp", queryHelp);
		return "callUs_help";

	}

	@RequestMapping(value="queryAlly",method=RequestMethod.GET)
	public String queryAlly(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Logo queryLogo = commonService.queryLogo();
		String logo_src = queryLogo.getLogo_src();
		Banner queryCallBanner=callUsService.queryCallBanner();
		List<Ally> queryAlly = callUsService.queryAlly();
		String banner_src = queryCallBanner.getBanner_src();
		request.setAttribute("banner_src", banner_src);
		request.setAttribute("queryAlly1", queryAlly);
		request.setAttribute("logo_src", logo_src);
		return "callUs_ally";

	}
	@RequestMapping(value="querybackcall",method=RequestMethod.GET)
	public String querybackcall(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<Callus_img> queryBank = callUsService.queryBank();
		List<Callus_img> queryStore = callUsService.queryStore();
		List<Ally> queryAlly = callUsService.queryAlly();
		List<Help> queryHelp = callUsService.queryHelp();
		request.setAttribute("queryAlly", queryAlly);
		request.setAttribute("queryHelp", queryHelp);
		request.setAttribute("queryBank", queryBank);
		request.setAttribute("queryStore", queryStore);
		return "manager/CallUs";
	}
	@RequestMapping(value="insertbank",method=RequestMethod.POST)
	@ResponseBody
	public boolean insertbank(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			//上传文件路径
			String path=updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "banklogo"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			callUsService.insertbank(filename,src);
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping(value="deletebank",method=RequestMethod.POST)
	@ResponseBody
	public boolean deletebank(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String bankid = request.getParameter("bankid");
		String deleteServer = deleteServer();
		Callus_img queryBankById = callUsService.queryCallUsImgById(bankid);
		String callusimg_src = queryBankById.getCallusimg_src();
		boolean deleteimg = deleteimg(deleteServer, callusimg_src);
		if (deleteimg==true) {
			callUsService.deletebank(bankid);
			return true;
		}else {
			return false;
		}


	}
	@RequestMapping(value="insertstore",method=RequestMethod.POST)
	@ResponseBody
	public boolean insertstore(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			//上传文件路径
			String path=updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "storelogo"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			callUsService.insertstore(filename,src);
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping(value="deletestore",method=RequestMethod.POST)
	@ResponseBody
	public boolean deletestore(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String storeid = request.getParameter("storeid");
		String deleteServer = deleteServer();
		Callus_img queryBankById = callUsService.queryCallUsImgById(storeid);
		String callusimg_src = queryBankById.getCallusimg_src();
		boolean deleteimg = deleteimg(deleteServer, callusimg_src);
		if (deleteimg==true) {
			callUsService.deletestore(storeid);
			return true;
		}else {
			return false;
		}

	}
	@RequestMapping(value="inserthelp",method=RequestMethod.POST)
	@ResponseBody
	public boolean inserthelp(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String helpask = request.getParameter("helpask");
		String helpans = request.getParameter("helpans");
		callUsService.inserthelp(helpask,helpans);
		return true;
	}
	@RequestMapping(value="deletehelp",method=RequestMethod.POST)
	@ResponseBody
	public boolean deletehelp(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String helpid = request.getParameter("helpid");
		callUsService.deletehelp(helpid);
		return true;

	}
	@RequestMapping(value="insertally",method=RequestMethod.POST)
	@ResponseBody
	public boolean insertally(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String allyname = request.getParameter("allyname");
		String allycall = request.getParameter("allycall");
		callUsService.insertally(allyname,allycall);
		return true;
	}
	@RequestMapping(value="deleteally",method=RequestMethod.POST)
	@ResponseBody
	public boolean deleteally(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String allyid = request.getParameter("allyid");
		callUsService.deleteally(allyid);
		return true;

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
