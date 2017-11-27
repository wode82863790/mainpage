package com.ykd.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ykd.entity.AboutUs;
import com.ykd.entity.AboutUs_Img;
import com.ykd.entity.BackManager;
import com.ykd.entity.Banner;
import com.ykd.entity.Blog;
import com.ykd.entity.Blog_img;
import com.ykd.entity.CommonwithBlog;
import com.ykd.entity.Honor;
import com.ykd.entity.Logo;
import com.ykd.entity.News;
import com.ykd.entity.News_img;
import com.ykd.entity.Timeline;
import com.ykd.jwt.Jwt;
import com.ykd.service.AboutUsService;
import com.ykd.service.CommonService;

import net.minidev.json.JSONObject;

@Component
@RequestMapping()
public class AboutUsController {
	@Resource
	private AboutUsService aboutUsService;
	@Resource
	private CommonService commonService;
	@RequestMapping(value="queryAboutUsIntro",method=RequestMethod.GET)
	public String queryAboutUsIntro(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		AboutUs queryAboutUsIntro = aboutUsService.queryAboutUsIntro();
		Banner queryAboutUsBanner = aboutUsService.queryAboutUsBanner();
		Logo queryLogo = commonService.queryLogo();
		if (queryAboutUsIntro==null||queryAboutUsBanner==null||queryLogo==null) {
			request.setAttribute("aboutus_inner", "");
			request.setAttribute("banner_src", "");
			request.setAttribute("logo_src", "");
		}else {
			String banner_src = queryAboutUsBanner.getBanner_src();
			String aboutus_inner = queryAboutUsIntro.getAboutus_inner();
			String logo_src = queryLogo.getLogo_src();
			request.setAttribute("aboutus_inner", aboutus_inner);
			request.setAttribute("banner_src", banner_src);
			request.setAttribute("logo_src", logo_src);
		}
		List<AboutUs_Img> queryAboutUsIntroImg = aboutUsService.queryAboutUsIntroImg();
		List<AboutUs_Img> queryAboutUsIntroImgLit=aboutUsService.queryAboutUsIntroImgLit();
		request.setAttribute("queryAboutUsIntroImg", queryAboutUsIntroImg);
		request.setAttribute("queryAboutUsIntroImgLit", queryAboutUsIntroImgLit);
		return "aboutUs";

	}
	@RequestMapping(value="queryAboutUsTimeline",method=RequestMethod.GET)
	public String queryAboutUsTimeline(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Banner queryAboutUsBanner = aboutUsService.queryAboutUsBanner();
		Logo queryLogo = commonService.queryLogo();
		List<Timeline> queryTimeline = aboutUsService.queryTimeline();
		if (queryAboutUsBanner==null||queryLogo==null) {
			request.setAttribute("logo_src","");
			request.setAttribute("banner_src", "");
		}else {
			String logo_src = queryLogo.getLogo_src();
			String banner_src = queryAboutUsBanner.getBanner_src();
			request.setAttribute("logo_src", logo_src);
			request.setAttribute("banner_src", banner_src);
		}
		request.setAttribute("queryTimeline", queryTimeline);
		return "aboutUs_timeline";
	}
	@RequestMapping(value="queryAboutUsNews",method=RequestMethod.GET)
	public String queryAboutUsNews(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Banner queryAboutUsBanner = aboutUsService.queryAboutUsBanner();
		Logo queryLogo = commonService.queryLogo();
		List<News> queryNews = aboutUsService.queryNews();
		if (queryAboutUsBanner==null||queryLogo==null) {
			request.setAttribute("logo_src", "");
			request.setAttribute("banner_src", "");
		}else {
			String banner_src = queryAboutUsBanner.getBanner_src();
			String logo_src = queryLogo.getLogo_src();
			request.setAttribute("logo_src", logo_src);
			request.setAttribute("banner_src", banner_src);
		}
		request.setAttribute("queryNews", queryNews);
		return "aboutUs_news";

	}
	@RequestMapping(value="queryAboutUsNewsInner",method=RequestMethod.GET)
	public String queryAboutUsNewsInner(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		Banner queryAboutUsBanner = aboutUsService.queryAboutUsBanner();
		String banner_src = queryAboutUsBanner.getBanner_src();
		Logo queryLogo = commonService.queryLogo();
		String logo_src = queryLogo.getLogo_src();
		News queryNews = aboutUsService.queryNewsInner(id);
		String news_date = queryNews.getNews_date();
		String news_inner = queryNews.getNews_inner();
		String news_title = queryNews.getNews_title();
		List<News_img> queryNewsInnerImg = aboutUsService.queryNewsInnerImg(id);
		request.setAttribute("news_date", news_date);
		request.setAttribute("news_inner", news_inner);
		request.setAttribute("news_title", news_title);
		request.setAttribute("queryNewsInnerImg", queryNewsInnerImg);
		request.setAttribute("logo_src", logo_src);
		request.setAttribute("banner_src", banner_src);
		return "aboutUs_newsinner";

	}
	@RequestMapping(value="queryAboutUsCulture",method=RequestMethod.GET)
	public String queryAboutUsCulture(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Banner queryAboutUsBanner = aboutUsService.queryAboutUsBanner();
		Logo queryLogo = commonService.queryLogo();
		if (queryAboutUsBanner==null||queryLogo==null) {
			request.setAttribute("logo_src", "");
			request.setAttribute("banner_src", "");
		}else {
			String banner_src = queryAboutUsBanner.getBanner_src();
			String logo_src = queryLogo.getLogo_src();
			request.setAttribute("logo_src", logo_src);
			request.setAttribute("banner_src", banner_src);
		}
		return "aboutUs_culture";

	}
	@RequestMapping(value="queryAboutUsHonor",method=RequestMethod.GET)
	public String queryAboutUsHonor(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Banner queryAboutUsBanner = aboutUsService.queryAboutUsBanner();
		Logo queryLogo = commonService.queryLogo();
		List<Honor> queryHonor = aboutUsService.queryHonor();
		if (queryAboutUsBanner==null||queryLogo==null) {
			request.setAttribute("logo_src", "");
			request.setAttribute("banner_src", "");
		}else {
			String banner_src = queryAboutUsBanner.getBanner_src();
			String logo_src = queryLogo.getLogo_src();
			request.setAttribute("logo_src", logo_src);
			request.setAttribute("banner_src", banner_src);
		}
		request.setAttribute("queryHonor", queryHonor);
		return "aboutUs_honor";

	}
	@RequestMapping(value="queryAboutUsBlog",method=RequestMethod.GET)
	public String queryAboutUsBlog(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Banner queryAboutUsBanner = aboutUsService.queryAboutUsBanner();
		Logo queryLogo = commonService.queryLogo();
		List<Blog> queryBlog = aboutUsService.queryBlog();
		if (queryAboutUsBanner==null||queryLogo==null) {
			request.setAttribute("logo_src", "");
			request.setAttribute("banner_src", "");
		}else {
			String banner_src = queryAboutUsBanner.getBanner_src();
			String logo_src = queryLogo.getLogo_src();
			request.setAttribute("logo_src", logo_src);
			request.setAttribute("banner_src", banner_src);
		}
		request.setAttribute("queryBlog", queryBlog);
		return "aboutUs_blog";

	}
	@RequestMapping(value="queryAboutUsBlogInner",method=RequestMethod.GET)
	public String queryAboutUsBlogInner(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		List<Blog_img> queryBlogInner = aboutUsService.queryBlogInner(id);
		Banner queryAboutUsBanner = aboutUsService.queryAboutUsBanner();
		Logo queryLogo = commonService.queryLogo();
		if (queryAboutUsBanner==null||queryLogo==null) {
			request.setAttribute("logo_src", "");
			request.setAttribute("banner_src", "");
		}else {
			String banner_src = queryAboutUsBanner.getBanner_src();
			String logo_src = queryLogo.getLogo_src();
			request.setAttribute("logo_src", logo_src);
			request.setAttribute("banner_src", banner_src);
		}
		request.setAttribute("queryBlogInner", queryBlogInner);
		return "aboutUs_bloginner";

	}
	@RequestMapping(value="back_login",method=RequestMethod.POST)
	@ResponseBody
	public void back_login(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String account = request.getParameter("userName");
		String pass = request.getParameter("password");
		JSONObject resultJSON=new JSONObject();
		BackManager login = commonService.login(account,pass);
		if (login==null) {
			resultJSON.put("success", false);
			resultJSON.put("msg","用户名密码不对");
			output(resultJSON.toJSONString(), response);
		}else {
			Map<String , Object> payload=new HashMap<String, Object>();
			Date date=new Date();
			payload.put("uid", login.getManager_id());//用户ID
			payload.put("iat", date.getTime());//生成时间
			payload.put("ext",date.getTime()+1000*60*60);//过期时间1小时
			String token=Jwt.createToken(payload);
			System.out.println(token);//查看产生的token
			resultJSON.put("success", true);
			resultJSON.put("msg","登陆成功");
			resultJSON.put("token", token);
			output(resultJSON.toJSONString(), response);
		}
	}
	public void output(String jsonStr,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=UTF-8;");
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
		out.flush();
		out.close();

	}
	@RequestMapping(value="updateaboutUsinner",method=RequestMethod.POST)
	@ResponseBody
	public boolean updateaboutUsinner(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String text = request.getParameter("text");
		System.out.println(text);
		if(!text.isEmpty()) {
			AboutUs queryAboutUsIntro = aboutUsService.queryAboutUsIntro();
			if (queryAboutUsIntro!=null) {
				aboutUsService.updateaboutUsinner(text);
			}else {
				aboutUsService.insertaboutUsinner(text);
			}
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping(value="update_news",method=RequestMethod.POST)
	@ResponseBody
	public boolean update_news(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("newsid");
		String title = request.getParameter("newstitle");
		String lit = request.getParameter("newslit");
		String date = request.getParameter("newsdate");
		String inner = request.getParameter("newsinner");
		aboutUsService.update_news(id,title,lit,date,inner);
		return true;
	}
	@RequestMapping(value="updateaboutus_in",method=RequestMethod.POST)
	@ResponseBody
	public boolean updateaboutus_in(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			//上传文件路径
			String path = updateServer();
			//上传文件名
			String filename = "aboutus_in.jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			AboutUs_Img queryAboutUsIntroImgIn = aboutUsService.queryAboutUsIntroImgIn();
			if (queryAboutUsIntroImgIn!=null) {
				aboutUsService.updateaboutus_in(src);
			}else {
				aboutUsService.insertaboutus_in(src);
			}
			return true;
		} else {
			return false;
		}

	}
	@RequestMapping(value="updateaboutus_out",method=RequestMethod.POST)
	@ResponseBody
	public boolean updateaboutus_out(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			//上传文件路径
			String path = updateServer();
			//上传文件名
			String filename = "aboutus_out.jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			AboutUs_Img queryAboutUsIntroImgOut = aboutUsService.queryAboutUsIntroImgOut();
			if (queryAboutUsIntroImgOut!=null) {
				aboutUsService.updateaboutus_out(src);
			}else {
				aboutUsService.insertaboutus_out(src);
			}
			return true;
		} else {
			return false;
		}

	}
	@RequestMapping(value="updateaboutus_lit",method=RequestMethod.POST)
	@ResponseBody
	public boolean updateaboutus_lit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			//上传文件路径
			String path = updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "aboutus_lit"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			aboutUsService.updateaboutus_lit(filename,src);
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping(value="delete_lit",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete_lit(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String litid = request.getParameter("litid");
		AboutUs_Img queryAboutUsImgById = aboutUsService.queryAboutUsImgById(litid);
		String aboutusimg_src = queryAboutUsImgById.getAboutusimg_src();
		String deleteServer = deleteServer();
		boolean deleteimg = deleteimg(deleteServer, aboutusimg_src);
		if (deleteimg==true) {
			aboutUsService.delete_lit(litid);
			return true;
		}else {
			return false;
		}
	}
	@RequestMapping(value="delete_newsimg",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete_newsimg(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		News_img queryNewsImgById = aboutUsService.queryNewsImgById(id);
		String newsimg_src = queryNewsImgById.getNewsimg_src();
		String deleteServer = deleteServer();
		boolean deleteimg = deleteimg(deleteServer, newsimg_src);
		if (deleteimg==true) {
			aboutUsService.delete_newsimg(id);
			return true;
		}else {
			return false;
		}
	}
	@RequestMapping(value="delete_timeline",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete_timeline(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String timelineid = request.getParameter("timelineid");
		aboutUsService.delete_timeline(timelineid);
		return true;
	}
	@RequestMapping(value="delete_news",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete_news(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String deleteServer = deleteServer();
		String newsid = request.getParameter("newsid");
		List<News_img> queryNewsInnerImg = aboutUsService.queryNewsInnerImg(newsid);
		if (queryNewsInnerImg.isEmpty()!=true) {
			for (News_img news_img : queryNewsInnerImg) {
				String newsimg_src = news_img.getNewsimg_src();
				deleteimg(deleteServer, newsimg_src);
			}
		}
		aboutUsService.delete_news(newsid);
		return true;
	}
	@RequestMapping(value="delete_honor",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete_honor(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String honorid = request.getParameter("honorid");
		String deleteServer = deleteServer();
		Honor queryHonorById = aboutUsService.queryHonorById(honorid);
		String honor_src = queryHonorById.getHonor_src();
		boolean deleteimg = deleteimg(deleteServer, honor_src);
		if (deleteimg==true) {
			aboutUsService.delete_honor(honorid);
			return true;
		}else{
			return false;
		}
	}
	@RequestMapping(value="delete_blog",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete_blog(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String blogid = request.getParameter("blogid");
		String deleteServer = deleteServer();
		Blog queryBlogById = aboutUsService.queryBlogById(blogid);
		String blog_banner = queryBlogById.getBlog_banner();
		List<Blog_img> queryAllBlogImgByOutId = aboutUsService.queryBlogInner(blogid);
		for (Blog_img blog_img : queryAllBlogImgByOutId) {
			String blogimg_src = blog_img.getBlogimg_src();
			deleteimg(deleteServer, blogimg_src);
		}
		boolean deleteimg = deleteimg(deleteServer, blog_banner);
		if (deleteimg==true) {
			aboutUsService.delete_blog(blogid);
			return true;
		}else{
			return false;
		}
	}
	@RequestMapping(value="delete_blogimg",method=RequestMethod.POST)
	@ResponseBody
	public boolean delete_blogimg(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String blogimgid = request.getParameter("blogimgid");
		String deleteServer = deleteServer();
		List<Blog_img> queryBlogInner = aboutUsService.queryBlogImgById(blogimgid);
		for (Blog_img blog_img : queryBlogInner) {
			String blogimg_src = blog_img.getBlogimg_src();
			deleteimg(deleteServer, blogimg_src);
		}
		aboutUsService.delete_blogimg(blogimgid);
		return true;
	}
	@RequestMapping(value="querylit",method=RequestMethod.GET)
	public String querylit(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<AboutUs_Img> queryAboutUsIntroImgLit=aboutUsService.queryAboutUsIntroImgLit();
		List<Timeline> queryTimeline = aboutUsService.queryTimeline();
		List<Honor> queryHonor = aboutUsService.queryHonor();
		List<News> queryNews = aboutUsService.queryNews();
		List<Blog> queryBlog = aboutUsService.queryBlog();
		List<News_img> queryAllNewsImg = aboutUsService.queryAllNewsImg();
		List<CommonwithBlog> queryCommonWithBlog = aboutUsService.queryCommonWithBlog();
		AboutUs_Img queryAboutUsIntroImgIn = aboutUsService.queryAboutUsIntroImgIn();
		AboutUs_Img queryAboutUsIntroImgOut = aboutUsService.queryAboutUsIntroImgOut();
		AboutUs queryAboutUsIntro = aboutUsService.queryAboutUsIntro();
		if (queryAboutUsIntroImgIn==null||queryAboutUsIntroImgOut==null||queryAboutUsIntro==null) {
			request.setAttribute("aboutusimg_src2", "");
			request.setAttribute("aboutusimg_src", "");
			request.setAttribute("aboutus_inner", "");
		}else {
			String aboutusimg_src = queryAboutUsIntroImgIn.getAboutusimg_src();
			String aboutusimg_src2 = queryAboutUsIntroImgOut.getAboutusimg_src();
			String aboutus_inner = queryAboutUsIntro.getAboutus_inner();
			request.setAttribute("aboutusimg_src2", aboutusimg_src2);
			request.setAttribute("aboutusimg_src", aboutusimg_src);
			request.setAttribute("aboutus_inner", aboutus_inner);
		}
		request.setAttribute("queryBlog", queryBlog);
		request.setAttribute("queryCommonWithBlog", queryCommonWithBlog);
		request.setAttribute("queryTimeline", queryTimeline);
		request.setAttribute("queryAllNewsImg", queryAllNewsImg);
		request.setAttribute("queryHonor", queryHonor);
		request.setAttribute("queryNews", queryNews);
		request.setAttribute("querylit", queryAboutUsIntroImgLit);
		return "manager/AboutUs";
	}
	@RequestMapping(value="inserttimeline",method=RequestMethod.POST)
	@ResponseBody
	public boolean inserttimeline(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String timelinetitle = request.getParameter("timelinetitle");
		String timelinedate = request.getParameter("timelinedate");
		String timelineinner = request.getParameter("timelineinner");
		aboutUsService.inserttimeline(timelinetitle,timelinedate,timelineinner);
		return true;
	}
	@RequestMapping(value="insertnews",method=RequestMethod.POST)
	@ResponseBody
	public boolean insertnews(HttpServletRequest request,HttpServletResponse response
			) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String newstitle = request.getParameter("newstitle");
		String newsdate = request.getParameter("newsdate");
		String newslit = request.getParameter("newslit");
		String newsinner = request.getParameter("newsinner");
		aboutUsService.insertnews(newstitle,newsdate,newslit,newsinner);
		return true;
	}
	@RequestMapping(value="insertnewsimg",method=RequestMethod.POST)
	@ResponseBody
	public boolean insertnewsimg(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		if(!file.isEmpty()) {
			//上传文件路径
			String path = updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "news"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			aboutUsService.insertnewsimg(filename,src,id);
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping(value="inserthonor",method=RequestMethod.POST)
	@ResponseBody
	public boolean inserthonor(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		String inner = request.getParameter("inner");
		if(!file.isEmpty()) {
			//上传文件路径
			String path = updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "honor"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			aboutUsService.inserthonor(title,inner,date,src);
			return true;
		} else {
			return false;
		}
	}
	@RequestMapping(value="update_honor",method=RequestMethod.POST)
	@ResponseBody
	public boolean update_honor(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		String inner = request.getParameter("inner");
		Honor queryHonorById = aboutUsService.queryHonorById(id);
		String src = queryHonorById.getHonor_src();
		if(!file.isEmpty()) {
			//先把老的删了
			String deleteServer = deleteServer();
			deleteimg(deleteServer, src);
			//上传文件路径
			String path = updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "honor"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			src="images/"+filename;
			aboutUsService.updatehonor(id,title,inner,date,src);
			return true;
		} else {
			aboutUsService.updatehonor(id,title,inner,date,src);
			return true;
		}
	}
	@RequestMapping(value="insertblog",method=RequestMethod.POST)
	@ResponseBody
	public boolean insertblog(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		if(!file.isEmpty()) {
			//上传文件路径
			String path = updateServer();
			//上传文件名
			long currentTimeMillis = System.currentTimeMillis();
			String filename = "blogbanner"+currentTimeMillis+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			aboutUsService.insertblog(title,date,src);
			return true;
		} else {
			return false;
		}
	}
	//	@RequestMapping(value="insertblogimg",method=RequestMethod.POST)
	//	@ResponseBody
	//	public boolean insertblogimg(HttpServletRequest request,HttpServletResponse response
	//			,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
	//		request.setCharacterEncoding("utf-8");
	//		response.setContentType("text/html;charset=utf-8");
	//		String id = request.getParameter("id");
	//		String intro = request.getParameter("intro");
	//		if(!file.isEmpty()) {
	//			//上传文件路径
	//			String path = updateServer();
	//			//上传文件名
	//			long currentTimeMillis = System.currentTimeMillis();
	//			String filename = "blogintro"+currentTimeMillis+".jpg";
	//			File filepath = new File(path,filename);
	//			//判断路径是否存在，如果不存在就创建一个
	//			if (!filepath.getParentFile().exists()) { 
	//				filepath.getParentFile().mkdirs();
	//			}
	//			//将上传文件保存到一个目标文件当中
	//			file.transferTo(new File(path + File.separator + filename));
	//			String src="images/"+filename;
	//			aboutUsService.insertblogimg(filename,intro,id,src);
	//			return true;
	//		} else {
	//			return false;
	//		}
	//	}
	@RequestMapping(value="insertblogimg",method=RequestMethod.POST)
	@ResponseBody
	public boolean insertblogimg(HttpServletRequest request,HttpServletResponse response
			,@RequestParam("file-zh") MultipartFile[] files) throws IllegalStateException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		String intro="";
		for (int i = 0; i < files.length; i++) {
			MultipartFile file=files[i];
			//上传文件路径
			String path = updateServer();
			//上传文件名
			int s = (int) (Math.random() * 90000) + 10000;
			String filename = "blogintro"+s+".jpg";
			File filepath = new File(path,filename);
			//判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) { 
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			file.transferTo(new File(path + File.separator + filename));
			String src="images/"+filename;
			aboutUsService.insertblogimg(filename,intro,id,src);
		}
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
