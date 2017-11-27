package com.ykd.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ykd.dao.CallUsDao;
import com.ykd.entity.Ally;
import com.ykd.entity.Banner;
import com.ykd.entity.Callus_img;
import com.ykd.entity.Help;
import com.ykd.service.CallUsService;
@Service("callUsService")
public class CallUsServiceImpl implements CallUsService{
	@Resource
	private CallUsDao callUsDao;
	@Transactional
	public Banner queryCallBanner() {
		Banner queryCallBanner = callUsDao.queryCallBanner();
		return queryCallBanner;
	}
	@Transactional
	public List<Callus_img> queryBank() {
		List<Callus_img> queryBank = callUsDao.queryBank();
		return queryBank;
	}

	@Transactional
	public List<Callus_img> queryStore() {
		List<Callus_img> queryStore = callUsDao.queryStore();
		return queryStore;
	}
	@Transactional
	public List<Help> queryHelp() {
		List<Help> queryHelp = callUsDao.queryHelp();
		return queryHelp;
	}
	@Transactional
	public List<Ally> queryAlly() {
		List<Ally> queryAlly = callUsDao.queryAlly();
		return queryAlly;
	}
	@Transactional
	public void insertbank(String filename, String src) {
		callUsDao.insertbank(filename,src);
		
	}
	@Transactional
	public void deletebank(String bankid) {
		callUsDao.deletebank(bankid);
		
	}
	@Transactional
	public void insertstore(String filename, String src) {
		callUsDao.insertstore(filename,src);
		
	}
	@Transactional
	public void deletestore(String storeid) {
		callUsDao.deletestore(storeid);
		
	}
	@Transactional
	public void inserthelp(String helpask, String helpans) {
		callUsDao.inserthelp(helpask,helpans);
		
	}
	@Transactional
	public void deletehelp(String helpid) {
		callUsDao.deletehelp(helpid);
		
	}
	@Transactional
	public void insertally(String allyname, String allycall) {
		callUsDao.insertally(allyname,allycall);
	}
	@Transactional
	public void deleteally(String allyid) {
		callUsDao.deleteally(allyid);
		
	}
	@Transactional
	public Callus_img queryCallUsImgById(String bankid) {
		Callus_img queryCallUsImgById = callUsDao.queryCallUsImgById(bankid);
		return queryCallUsImgById;
	}
	@Transactional
	public void updatehelp(String id, String helpask, String helpans) {
		callUsDao.updatehelp(id,helpask,helpans);
		
	}
	@Transactional
	public void updateally(String id, String allyname, String allycall) {
		callUsDao.updateally(id,allyname,allycall);
		
	}
	

}
