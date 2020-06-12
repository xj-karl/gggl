package com.cczu.model.gggl.dao;

import com.cczu.model.gggl.entity.BIS_GlsjxxEntity;
import com.cczu.util.dao.BaseDao;
import org.springframework.stereotype.Repository;

/**
 * @ClassName BisGlsjxxDao @Author wangmeng @Description 管廊数据信息--数据库操作层 @Data 2020-06-12
 * 22:33 @Version 1.0
 */
@Repository("BisGlsjxxDao")
public class BisGlsjxxDao extends BaseDao<BIS_GlsjxxEntity, Long> {

  /*
   * @Description      : 添加
   * @Author           : WangMeng
   * @Date             : 2020-06-12 22:19
   * @Param            : []
   * @Return           : int
   **/
  public int insert() {
    return 0;
  }

  /*
   * @Description      : 删除
   * @Author           : WangMeng
   * @Date             : 2020-06-12 22:20
   * @Param            : [id]
   * @Return           : int
   **/
  public void delete(Long id) {
    String sql = " UPDATE bis_glsjxx SET S3=1 WHERE ID=" + id;
    updateBySql(sql);
  }

  /*
   * @Description      : TOTO
   * @Author           : WangMeng
   * @Date             : 2020-06-12 22:21
   * @Param            : []
   * @Return           : int
   **/
  public int update() {
    return 0;
  }
}
