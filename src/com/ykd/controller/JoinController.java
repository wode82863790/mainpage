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
import com.ykd.entity.Join;
import com.ykd.entity.Logo;
import com.ykd.service.CommonService;
import com.ykd.service.JoinService;

@Component
@RequestMapping()
public class JoinController {

	@Resource
	private JoinService joinService;
	@Resource
	private CommonService commonService;
	@RequestMapping(value="queryJoin",method=RequestMethod.GET)
	public String queryJoin(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Banner queryJoinBanner = joinService.queryJoinBanner();
		Logo queryLogo = commonService.queryLogo();
		if (queryJoinBanner==null) {
			request.setAttribute("banner_src", "");
		} else {
			String banner_src = queryJoinBanner.getBanner_src();
			request.setAttribute("banner_src", banner_src);
		}
		if (queryLogo==null) {
			request.setAttribute("logo_src", "");
		}else {
			String logo_src = queryLogo.getLogo_src();
			request.setAttribute("logo_src", logo_src);
		}
		List<Join> queryAll = joinService.queryAll();
		request.setAttribute("queryAll", queryAll);
		return "callUs_join";

	}

	@RequestMapping(value="queryJoinInner",method=RequestMethod.GET)
	public String queryJoinInner(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		Join queryJoinInner = joinService.queryJoinInner(id);

		String join_title = queryJoinInner.getJoin_title();
		String join_place = queryJoinInner.getJoin_place();
		String join_date = queryJoinInner.getJoin_date();
		String join_num = queryJoinInner.getJoin_num();
		String join_class = queryJoinInner.getJoin_class();
		String join_back = queryJoinInner.getJoin_back();
		String join_time = queryJoinInner.getJoin_time();
		String join_need = queryJoinInner.getJoin_need();
		String join_inner = queryJoinInner.getJoin_inner();
		Banner queryJoinBanner = joinService.queryJoinBanner();
		String banner_src = queryJoinBanner.getBanner_src();
		Logo queryLogo = commonService.queryLogo();
		String logo_src = queryLogo.getLogo_src();
		request.setAttribute("join_title", join_title);
		request.setAttribute("join_place", join_place);
		request.setAttribute("join_date", join_date);
		request.setAttribute("join_num", join_num);
		request.setAttribute("join_class", join_class);
		request.setAttribute("join_back", join_back);
		request.setAttribute("logo_src", logo_src);
		request.setAttribute("banner_src", banner_src);
		request.setAttribute("join_time", join_time);
		request.setAttribute("join_need", join_need);
		request.setAttribute("join_inner", join_inner);
		return "callUs_joininner";
	}
	@RequestMapping(value="insertjoin",method=RequestMethod.POST)
	@ResponseBody
	public boolean insertjoin(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String join_title = request.getParameter("join_title");
		String join_num = request.getParameter("join_num");
		String join_back = request.getParameter("join_back");
		String join_date = request.getParameter("join_date");
		String join_time = request.getParameter("join_time");
		String join_class = request.getParameter("join_class");
		String join_place = request.getParameter("join_place");
		String join_inner = request.getParameter("join_inner");
		String join_need = request.getParameter("join_need");
		joinService.insertjoin(join_title,join_num,join_back,join_date,join_time,join_class,join_place,join_inner,join_need);
		return true;
	}

	@RequestMapping(value="updatejoin",method=RequestMethod.POST)
	@ResponseBody
	public boolean updatejoin(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		String join_title = request.getParameter("join_title");
		String join_num = request.getParameter("join_num");
		String join_back = request.getParameter("join_back");
		String join_date = request.getParameter("join_date");
		String join_time = request.getParameter("join_time");
		String join_class = request.getParameter("join_class");
		String join_place = request.getParameter("join_place");
		String join_inner = request.getParameter("join_inner");
		String join_need = request.getParameter("join_need");
		joinService.updatejoin(id,join_title,join_num,join_back,join_date,join_time,join_class,join_place,join_inner,join_need);
		return true;
	}



	@RequestMapping(value="deletejoin",method=RequestMethod.POST)
	@ResponseBody
	public boolean deletejoin(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String joinid = request.getParameter("joinid");
		joinService.deletejoin(joinid);
		return true;
	}
	@RequestMapping(value="querybackjoin",method=RequestMethod.GET)
	public String querybackjoin(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<Join> queryAll = joinService.queryAll();
		request.setAttribute("queryAll", queryAll);
		Banner queryJoinBanner = joinService.queryJoinBanner();
		if (queryJoinBanner==null) {
			String banner_src="";
			request.setAttribute("banner_src", banner_src);
		}else {
			String banner_src = queryJoinBanner.getBanner_src();
			request.setAttribute("banner_src", banner_src);
		}
		return "manager/JoinUs";

	}
	@RequestMapping(value="updatejoin_banner",method=RequestMethod.POST)
	@ResponseBody
	public boolean updates_banner(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			//上传文件路径
			String path = updateServer();
			//上传文件名
			String filename = "join_banner.jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			Banner queryJoin_banner = joinService.queryJoin_banner();
			if (queryJoin_banner==null) {
				joinService.insertjoin_banner(src);
			}else {
				joinService.updatejoin_banner(src);
			}
			return true;
		} else {
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
