package com.ykd.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ykd.dao.AboutUsDao;
import com.ykd.entity.AboutUs;
import com.ykd.entity.AboutUs_Img;
import com.ykd.entity.Banner;
import com.ykd.entity.Blog;
import com.ykd.entity.Blog_img;
import com.ykd.entity.CommonwithBlog;
import com.ykd.entity.Honor;
import com.ykd.entity.News;
import com.ykd.entity.News_img;
import com.ykd.entity.Timeline;
import com.ykd.service.AboutUsService;
@Service("aboutUsService")
public class AboutUsServiceImpl implements AboutUsService{
	@Resource
	private AboutUsDao aboutUsDao;
	@Transactional
	public AboutUs queryAboutUsIntro() {
		AboutUs queryAboutUsIntro = aboutUsDao.queryAboutUsIntro();
		return queryAboutUsIntro;
	}

	@Transactional
	public Banner queryAboutUsBanner() {
		Banner queryAboutUsBanner = aboutUsDao.queryAboutUsBanner();
		return queryAboutUsBanner;
	}

	@Transactional
	public List<AboutUs_Img> queryAboutUsIntroImg() {
		List<AboutUs_Img> queryAboutUsIntroImg = aboutUsDao.queryAboutUsIntroImg();
		return queryAboutUsIntroImg;
	}

	@Transactional
	public List<AboutUs_Img> queryAboutUsIntroImgLit() {
		List<AboutUs_Img> queryAboutUsIntroImgLit = aboutUsDao.queryAboutUsIntroImgLit();
		return queryAboutUsIntroImgLit;
	}

	@Transactional
	public List<Timeline> queryTimeline() {
		List<Timeline> queryTimeline = aboutUsDao.queryTimeline();
		return queryTimeline;
	}

	@Transactional
	public List<News> queryNews() {
		List<News> queryNews = aboutUsDao.queryNews();
		return queryNews;
	}

	@Transactional
	public News queryNewsInner(String id) {
		News queryNewsInner = aboutUsDao.queryNewsInner(id);
		return queryNewsInner;
	}

	@Transactional
	public List<News_img> queryNewsInnerImg(String id) {
		List<News_img> queryNewsInnerImg = aboutUsDao.queryNewsInnerImg(id);
		return queryNewsInnerImg;
	}

	@Transactional
	public List<Honor> queryHonor() {
		List<Honor> queryHonor = aboutUsDao.queryHonor();
		return queryHonor;
	}

	@Transactional
	public List<Blog> queryBlog() {
		List<Blog> queryBlog = aboutUsDao.queryBlog();
		return queryBlog;
	}

	@Transactional
	public List<Blog_img> queryBlogInner(String id) {
		List<Blog_img> queryBlogInner = aboutUsDao.queryBlogInner(id);
		return queryBlogInner;
	}

	@Transactional
	public void updateaboutUsinner(String text) {
		aboutUsDao.updateaboutUsinner(text);
	}

	@Transactional
	public void updateaboutus_in(String src) {
		aboutUsDao.updateaboutus_in(src);
		
	}

	@Transactional
	public void updateaboutus_out(String src) {
		aboutUsDao.updateaboutus_out(src);
	}

	@Transactional
	public void updateaboutus_lit(String filename,String src) {
		aboutUsDao.updateaboutus_lit(filename,src);
	}

	@Transactional
	public void delete_lit(String litid) {
		aboutUsDao.delete_lit(litid);
		
	}

	@Transactional
	public void inserttimeline(String timelinetitle, String timelinedate, String timelineinner) {
		aboutUsDao.inserttimeline(timelinetitle,timelinedate,timelineinner);
	}

	@Transactional
	public void delete_timeline(String timelineid) {
		aboutUsDao.delete_timeline(timelineid);
		
	}

	@Transactional
	public void insertnews(String newstitle, String newsdate, String newslit,String newsinner) {
		aboutUsDao.insertnews(newstitle,newsdate,newslit,newsinner);
		
	}

	@Transactional
	public void delete_news(String newsid) {
		aboutUsDao.delete_news(newsid);
		
	}

	@Transactional
	public void insertnewsimg(String filename, String src, String id) {
		aboutUsDao.insertnewsimg( filename,  src,  id);
		
	}

	@Transactional
	public void inserthonor(String title, String inner, String date, String src) {
		aboutUsDao.inserthonor( title,  inner,  date,  src);
		
	}

	@Transactional
	public void delete_honor(String honorid) {
		aboutUsDao.delete_honor(honorid);
		
	}

	@Transactional
	public AboutUs_Img queryAboutUsImgById(String litid) {
		AboutUs_Img queryAboutUsImgById = aboutUsDao.queryAboutUsImgById(litid);
		return queryAboutUsImgById;
	}

	@Transactional
	public Honor queryHonorById(String honorid) {
		Honor queryHonorById = aboutUsDao.queryHonorById(honorid);
		return queryHonorById;
	}

	@Transactional
	public void insertaboutUsinner(String text) {
		aboutUsDao.insertaboutUsinner(text);
		
	}

	@Transactional
	public AboutUs_Img queryAboutUsIntroImgIn() {
		AboutUs_Img queryAboutUsIntroImgIn = aboutUsDao.queryAboutUsIntroImgIn();
		return queryAboutUsIntroImgIn;
	}
	@Transactional
	public AboutUs_Img queryAboutUsIntroImgOut() {
		AboutUs_Img queryAboutUsIntroImgOut = aboutUsDao.queryAboutUsIntroImgOut();
		return queryAboutUsIntroImgOut;
	}
	@Transactional
	public void insertaboutus_in(String src) {
		aboutUsDao.insertaboutus_in(src);
	}
	@Transactional
	public void insertaboutus_out(String src) {
		aboutUsDao.insertaboutus_out(src);
	}

	@Transactional
	public void insertblog(String title, String date, String src) {
		aboutUsDao.insertblog(title,date,src);
		
	}

	@Transactional
	public Blog queryBlogById(String blogid) {
		Blog queryBlogById = aboutUsDao.queryBlogById(blogid);
		return queryBlogById;
		
	}

	@Transactional
	public void delete_blog(String blogid) {
		aboutUsDao.delete_blog(blogid);
		
	}

	@Transactional
	public void insertblogimg(String filename, String intro, String id, String src) {
		aboutUsDao.insertblogimg( filename,  intro, id, src);
		
	}

	@Transactional
	public List<News_img> queryAllNewsImg() {
		List<News_img> queryAllNewsImg = aboutUsDao.queryAllNewsImg();
		return queryAllNewsImg;
	}

	@Transactional
	public List<Blog_img> queryAllBlogImg() {
		List<Blog_img> queryAllBlogImg = aboutUsDao.queryAllBlogImg();
		return queryAllBlogImg;
	}


	@Transactional
	public List<CommonwithBlog> queryCommonWithBlog() {
		List<CommonwithBlog> queryCommonWithBlog = aboutUsDao.queryCommonWithBlog();
		return queryCommonWithBlog;
	}

	@Transactional
	public List<Blog_img> queryBlogImgById(String blogimgid) {
		List<Blog_img> queryBlogImgById = aboutUsDao.queryBlogImgById(blogimgid);
		return queryBlogImgById;
	}

	@Transactional
	public void delete_blogimg(String blogimgid) {
		aboutUsDao.delete_blogimg(blogimgid);
		
	}
}
