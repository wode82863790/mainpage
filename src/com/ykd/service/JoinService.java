package com.ykd.service;

import java.util.List;

import com.ykd.entity.Banner;
import com.ykd.entity.Join;

public interface JoinService {

	Banner queryJoinBanner();

	List<Join> queryAll();

	Join queryJoinInner(String id);

	void insertjoin(String join_title, String join_num, String join_back, String join_date, String join_time,
			String join_class, String join_place, String join_inner, String join_need);

	void deletejoin(String joinid);

	Banner queryJoin_banner();

	void insertjoin_banner(String src);

	void updatejoin_banner(String src);

	void updatejoin(String id,String join_title, String join_num, String join_back, String join_date, String join_time,
			String join_class, String join_place, String join_inner, String join_need);


}
