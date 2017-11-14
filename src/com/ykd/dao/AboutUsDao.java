package com.ykd.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ykd.entity.AboutUs;
import com.ykd.entity.AboutUs_Img;
import com.ykd.entity.Banner;
import com.ykd.entity.Blog;
import com.ykd.entity.Blog_img;
import com.ykd.entity.Honor;
import com.ykd.entity.News;
import com.ykd.entity.News_img;
import com.ykd.entity.Timeline;

@Repository("aboutUsDao")
public interface AboutUsDao {


	AboutUs queryAboutUsIntro();

	Banner queryAboutUsBanner();

	List<AboutUs_Img> queryAboutUsIntroImg();

	List<AboutUs_Img> queryAboutUsIntroImgLit();

	List<Timeline> queryTimeline();

	List<News> queryNews();

	News queryNewsInner(String id);

	List<News_img> queryNewsInnerImg(String id);

	List<Honor> queryHonor();

	List<Blog> queryBlog();

	List<Blog_img> queryBlogInner(String id);

	void updateaboutUsinner(String text);

	void updateaboutus_in(String src);

	void updateaboutus_out(String src);

	void updateaboutus_lit(String src, String src2);

	void delete_lit(String litid);

	void inserttimeline(String timelinetitle, String timelinedate, String timelineinner);

	void delete_timeline(String timelineid);

	void insertnews(String newstitle, String newsdate,String newslit,String newsinner);

	void delete_news(String newsid);

	void insertnewsimg(String filename, String src, String id);

	void inserthonor(String title, String inner, String date, String src);

	void delete_honor(String honorid);

	AboutUs_Img queryAboutUsImgById(String litid);

	Honor queryHonorById(String honorid);

	void insertaboutUsinner(String text);

	AboutUs_Img queryAboutUsIntroImgIn();

	void insertaboutus_in(String src);

	AboutUs_Img queryAboutUsIntroImgOut();

	void insertaboutus_out(String src);



}

