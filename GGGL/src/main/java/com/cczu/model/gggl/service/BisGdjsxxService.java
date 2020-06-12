package com.cczu.model.gggl.service;

import com.cczu.model.gggl.dao.BisGdsjxxDao;
import com.cczu.model.gggl.entity.BIS_GdsjxxEntity;
import com.cczu.sys.comm.utils.DateUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName BisGdjsxxService @Author wangmeng @Description 管道数据信息--数据服务层 @Data 2020-06-12
 * 22:38 @Version 1.0
 */
@Transactional(readOnly = true)
@Service("BisGdjsxxService")
public class BisGdjsxxService {

  @Resource private BisGdsjxxDao bisGdsjxxDao;

  /*
   * @Description      : 管道index页面的数据获取
   * @Author           : WangMeng
   * @Date             : 2020-06-12 23:28
   * @Param            : [mapData]
   * @Return           : java.util.Map<java.lang.String,java.lang.Object>
   **/
  public Map<String, Object> dataGrid(Map<String, Object> mapData) {
    List<Map<String, Object>> list = bisGdsjxxDao.dataGrid(mapData);
    int getTotalCount = bisGdsjxxDao.getTotalCount(mapData);
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("rows", list);
    map.put("total", getTotalCount);
    return map;
  }
  /*
   * @Description      : 添加管道信息
   * @Author           : WangMeng
   * @Date             : 2020-06-12 22:46
   * @Param            : [entity]
   * @Return           : void
   **/
  public void addInfo(BIS_GdsjxxEntity entity) {
    Timestamp t = DateUtils.getSysTimestamp();
    entity.setS1(t);
    entity.setS2(t);
    entity.setS3(0);
    bisGdsjxxDao.save(entity);
  }

  /*
   * @Description      : 删除管道信息
   * @Author           : WangMeng
   * @Date             : 2020-06-12 22:46
   * @Param            : [id]
   * @Return           : void
   **/
  public void deleteInfo(long id) {
    // TODO Auto-generated method stub
    bisGdsjxxDao.delete(id);
  }

  /*
   * @Description      : 更新管道信息
   * @Author           : WangMeng
   * @Date             : 2020-06-12 22:47
   * @Param            : [entity]
   * @Return           : void
   **/
  public void updateInfo(BIS_GdsjxxEntity entity) {
    Timestamp t = DateUtils.getSysTimestamp();
    entity.setS2(t);
    bisGdsjxxDao.saveUp(entity);
  }

  /*
   * @Description      : 根据id查询管道信息
   * @Author           : WangMeng
   * @Date             : 2020-06-12 22:47
   * @Param            : [id]
   * @Return           : com.cczu.model.gggl.entity.BIS_GdsjxxEntity
   **/
  public BIS_GdsjxxEntity findById(Long id) {
    return bisGdsjxxDao.find(id);
  }
}
