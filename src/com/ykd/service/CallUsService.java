package com.ykd.service;

import java.util.List;

import com.ykd.entity.Ally;
import com.ykd.entity.Banner;
import com.ykd.entity.Callus_img;
import com.ykd.entity.Help;

public interface CallUsService {

	Banner queryCallBanner();
	List<Callus_img> queryBank();

	List<Callus_img> queryStore();
	List<Help> queryHelp();
	List<Ally> queryAlly();
	void insertbank(String filename, String src);
	void deletebank(String bankid);
	void insertstore(String filename, String src);
	void deletestore(String storeid);
	void inserthelp(String helpask, String helpans);
	void deletehelp(String helpid);
	void insertally(String allyname, String allycall);
	void deleteally(String allyid);
	Callus_img queryCallUsImgById(String bankid);
	void updatehelp(String id, String helpask, String helpans);
	void updateally(String id, String allyname, String allycall);

}
