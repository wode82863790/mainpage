package com.ykd.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ykd.dao.JoinDao;
import com.ykd.entity.Banner;
import com.ykd.entity.Join;
import com.ykd.service.JoinService;
@Service("joinService")
public class JoinServiceImpl implements JoinService{
	@Resource
	private JoinDao joinDao;
	@Transactional
	public Banner queryJoinBanner() {
		Banner queryJoinBanner = joinDao.queryJoinBanner();
		return queryJoinBanner;
	}

	@Transactional
	public List<Join> queryAll() {
		List<Join> queryAll = joinDao.queryAll();
		return queryAll;
	}

	@Transactional
	public Join queryJoinInner(String id) {
		Join queryJoinInner = joinDao.queryJoinInner(id);
		return queryJoinInner;
	}

	@Transactional
	public void insertjoin(String join_title, String join_num, String join_back, String join_date, String join_time,
			String join_class, String join_place, String join_inner, String join_need) {
		joinDao.insertjoin( join_title,  join_num,  join_back,  join_date,  join_time,
				 join_class,  join_place,  join_inner,  join_need);
		
	}

	@Transactional
	public void deletejoin(String joinid) {
		joinDao.deletejoin(joinid);
		
	}

	@Transactional
	public Banner queryJoin_banner() {
		Banner queryJoin_banner = joinDao.queryJoin_banner();
		return queryJoin_banner;
	}

	@Transactional
	public void insertjoin_banner(String src) {
		joinDao.insertjoin_banner(src);
		
	}

	@Transactional
	public void updatejoin_banner(String src) {
		joinDao.updatejoin_banner(src);
		
	}

	@Transactional
	public void updatejoin(String id,String join_title, String join_num, String join_back, String join_date, String join_time,
			String join_class, String join_place, String join_inner, String join_need) {
		joinDao.updatejoin( id,join_title,  join_num,  join_back,  join_date,  join_time,
				 join_class,  join_place,  join_inner,  join_need);
		
	}

	

}
