package com.cczu.model.dao;

import com.cczu.model.entity.Tdic_GbtbusinessEntity;

import java.util.List;

public interface ITdicGBTDao {

	/**
	 * 获取所有
	 * @return 集合
	 */
	public List<Tdic_GbtbusinessEntity> findListAll();
	
}
