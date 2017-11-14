package com.ykd.serviceImpl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ykd.dao.CommonDao;
import com.ykd.entity.BackManager;
import com.ykd.entity.Banner;
import com.ykd.entity.Logo;
import com.ykd.service.CommonService;
@Service("commonService")
public class CommonServiceImpl implements CommonService{
	@Resource
	private CommonDao commonDao;

	@Transactional
	public Logo queryLogo() {
		Logo queryLogo = commonDao.queryLogo();
		return queryLogo;
	}

	@Transactional
	public BackManager login(String account, String pass) {
		BackManager login = commonDao.login(account,pass);
		if (login==null) {
			return null;
		}else {
			return login;}
	}

	@Transactional
	public void insertLogo(String src) {
		commonDao.insertLogo(src);
		
	}

	@Transactional
	public void updates_banner(String src) {
		commonDao.updates_banner(src);
		
	}

	@Transactional
	public void updateLogo(String src) {
		commonDao.updateLogo(src);	
	}

	@Transactional
	public Banner queryS_banner() {
		Banner queryS_banner = commonDao.queryS_banner();
		return queryS_banner;
	}

	@Transactional
	public void inserts_banner(String src) {
		commonDao.inserts_banner(src);
		
	}

	@Transactional
	public List<Banner> queryBanner() {
		List<Banner> queryBanner = commonDao.queryBanner();
		return queryBanner;
	}

	@Transactional
	public Banner queryMBanner() {
		Banner queryMBanner = commonDao.queryMBanner();
		return queryMBanner;
	}

	@Transactional
	public void insertMbanner(String src) {
		commonDao.insertMbanner(src);
		
	}

	@Transactional
	public void updateMbanner(String src) {
		commonDao.updateMbanner(src);
		
	}

	@Transactional
	public void updatebanner(String filename, String src) {
		commonDao.updatebanner( filename,src);
		
	}

	@Transactional
	public Banner queryBannerById(String bannerid) {
		Banner queryBannerById = commonDao.queryBannerById(bannerid);
		return queryBannerById;
	}

	@Transactional
	public void delete_banner(String bannerid) {
		commonDao.delete_banner(bannerid);
		
	}


}
