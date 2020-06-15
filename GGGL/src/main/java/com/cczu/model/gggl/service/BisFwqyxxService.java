package com.cczu.model.gggl.service;

import com.cczu.model.gggl.dao.BisFwqyxxDao;
import com.cczu.model.gggl.entity.BIS_FwqyxxEntity;
import com.cczu.sys.comm.mapper.JsonMapper;
import com.cczu.sys.comm.utils.DateUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 服务企业信息
 *
 * @author YZH
 */
@Transactional(readOnly = true)
@Service("BisFwqyxxService")
public class BisFwqyxxService {

  @Resource private BisFwqyxxDao bisFwqyxxDao;

  public Map<String, Object> dataGrid(Map<String, Object> mapData) {
    List<Map<String, Object>> list = bisFwqyxxDao.dataGrid(mapData);
    int getTotalCount = bisFwqyxxDao.getTotalCount(mapData);
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("rows", list);
    map.put("total", getTotalCount);
    return map;
  }

  public void addInfo(BIS_FwqyxxEntity entity) {
    Timestamp t = DateUtils.getSysTimestamp();
    entity.setS1(t);
    entity.setS2(t);
    entity.setS3(0);
    bisFwqyxxDao.save(entity);
  }

  public void updateInfo(BIS_FwqyxxEntity entity) {
    Timestamp t = DateUtils.getSysTimestamp();
    entity.setS2(t);
    bisFwqyxxDao.saveUp(entity);
  }

  // 删除
  public void deleteInfo(long id) {
    // TODO Auto-generated method stub
    bisFwqyxxDao.deleteInfo(id);
  }

  public BIS_FwqyxxEntity findById(Long id) {
    return bisFwqyxxDao.find(id);
  }

  /*
   * @Description      : 查询服务企业数据 (json) id  text
   * @Author           : WangMeng
   * @Date             : 2020-06-15 21:42
   * @Param            : [map]
   * @Return           : java.lang.String
   **/
  public String getQyIdjson(Map<String, Object> map) {
    List<Map<String, Object>> list = bisFwqyxxDao.getQyIdjson(map);
    return JsonMapper.getInstance().toJson(list);
  }
}
