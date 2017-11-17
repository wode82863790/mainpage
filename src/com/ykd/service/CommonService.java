package com.ykd.service;


import java.util.List;

import com.ykd.entity.BackManager;
import com.ykd.entity.Banner;
import com.ykd.entity.Logo;

public interface CommonService {

	Logo queryLogo();

	BackManager login(String account, String pass);

	void insertLogo(String src);

	void updates_banner(String src);

	void updateLogo(String src);

	Banner queryS_banner();

	void inserts_banner(String src);

	List<Banner> queryBanner();

	Banner queryMBanner();

	void insertMbanner(String src);

	void updateMbanner(String src);

	void updatebanner(String filename, String src);

	Banner queryBannerById(String bannerid);

	void delete_banner(String bannerid);

	BackManager queryMnagerById(String uid);

	
}
