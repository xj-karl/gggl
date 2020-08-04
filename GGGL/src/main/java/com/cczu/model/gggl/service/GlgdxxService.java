package com.cczu.model.gggl.service;

import com.cczu.model.gggl.dao.GlgdxxDao;
import com.cczu.model.gggl.entity.GlgdxxEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 管廊管道信息
 *
 * @author YZH
 */
@Transactional(readOnly = true)
@Service("GlgdxxService")
public class GlgdxxService {

    @Resource
    private GlgdxxDao glgdxxDao;

    public Map<String, Object> dataGrid(Map<String, Object> mapData) {
        List<Map<String, Object>> list = glgdxxDao.dataGrid(mapData);
        int getTotalCount = glgdxxDao.getTotalCount(mapData);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("rows", list);
        map.put("total", getTotalCount);
        return map;
    }

    public void add(GlgdxxEntity entity) {
        glgdxxDao.save(entity);
    }

    public GlgdxxEntity findById(Long id) {
        return glgdxxDao.find(id);
    }

}
