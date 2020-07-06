package com.cczu.model.gggl.service;

import com.cczu.model.gggl.dao.BisGlsjxxDao;
import com.cczu.model.gggl.entity.BIS_GlsjxxEntity;
import com.cczu.sys.comm.utils.DateUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName BisGljsxxService @Author wangmeng @Description 管廊数据信息--数据服务层 @Data 2020-06-12
 * 22:38 @Version 1.0
 */
@Transactional(readOnly = true)
@Service("BisGljsxxService")
public class BisGljsxxService {

  @Resource private BisGlsjxxDao bisGlsjxxDao;

  /*
   * @Description      : 添加管廊信息
   * @Author           : WangMeng
   * @Date             : 2020-06-12 22:46
   * @Param            : [entity]
   * @Return           : void
   **/
  public void addInfo(BIS_GlsjxxEntity entity) {
    Timestamp t = DateUtils.getSysTimestamp();
    entity.setS1(t);
    entity.setS2(t);
    entity.setS3(0);
    bisGlsjxxDao.save(entity);
  }

  public Map<String, Object> dataGrid(Map<String, Object> mapData) {
    List<Map<String, Object>> list = bisGlsjxxDao.dataGrid(mapData);
    int getTotalCount = bisGlsjxxDao.getTotalCount(mapData);
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("rows", list);
    map.put("total", getTotalCount);
    return map;
  }

  /*
   * @Description      : 删除管廊信息
   * @Author           : WangMeng
   * @Date             : 2020-06-12 22:46
   * @Param            : [id]
   * @Return           : void
   **/
  public void deleteInfo(long id) {
    // TODO Auto-generated method stub
    bisGlsjxxDao.delete(id);
  }

  /*
   * @Description      : 更新管廊信息
   * @Author           : WangMeng
   * @Date             : 2020-06-12 22:47
   * @Param            : [entity]
   * @Return           : void
   **/
  public void updateInfo(BIS_GlsjxxEntity entity) {
    Timestamp t = DateUtils.getSysTimestamp();
    entity.setS2(t);
    bisGlsjxxDao.saveUp(entity);
  }

  /*
   * @Description      : 根据id查询管廊信息
   * @Author           : WangMeng
   * @Date             : 2020-06-12 22:47
   * @Param            : [id]
   * @Return           : com.cczu.model.gggl.entity.BIS_GdsjxxEntity
   **/
  public BIS_GlsjxxEntity findById(Long id) {
    return bisGlsjxxDao.find(id);
  }
}
