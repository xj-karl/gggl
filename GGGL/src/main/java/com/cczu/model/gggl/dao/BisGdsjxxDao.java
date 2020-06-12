package com.cczu.model.gggl.dao;

import com.cczu.model.gggl.entity.BIS_GdsjxxEntity;
import com.cczu.util.dao.BaseDao;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @ClassName BisGdsjxxDao @Author wangmeng @Description 管道数据信息--数据库操作层 @Data 2020-06-12
 * 22:14 @Version 1.0
 */
@Repository("BisGdsjxxDao")
public class BisGdsjxxDao extends BaseDao<BIS_GdsjxxEntity, Long> {

  /*
   * @Description      : 管道数据分页查询(index页面表格中数据的渲染)
   * @Author           : WangMeng
   * @Date             : 2020-06-12 23:30
   * @Param            : [mapData]
   * @Return           : java.util.List<java.util.Map<java.lang.String,java.lang.Object>>
   **/
  public List<Map<String, Object>> dataGrid(Map<String, Object> mapData) {
    String content = content(mapData);
    String ordercont = setSortWay(mapData, "", "ORDER BY a.id desc");
    String sql =
        " SELECT top "
            + mapData.get("pageSize")
            + " * FROM ( SELECT ROW_NUMBER() OVER ("
            + ordercont
            + ") AS RowNumber,a.* FROM bis_gdsjxx a "
            + " left join bis_enterprise b on a.id1=b.id "
            + " WHERE a.S3=0 and b.S3=0 "
            + content
            + " ) "
            + "as a WHERE RowNumber > "
            + mapData.get("pageSize")
            + "*("
            + mapData.get("pageNo")
            + "-1) ";
    List<Map<String, Object>> list = findBySql(sql, null, Map.class);
    return list;
  }

  /*
   * @Description      : 分页统计
   * @Author           : WangMeng
   * @Date             : 2020-06-12 23:34
   * @Param            : [mapData]
   * @Return           : int
   **/
  public int getTotalCount(Map<String, Object> mapData) {
    String content = content(mapData);
    String queryString =
        "select count(*) from bis_gdsjxx a "
            + " left join bis_enterprise b on a.id1=b.id "
            + " WHERE a.S3=0 and b.S3=0 "
            + content;
    List<Object> list = findBySql(queryString);

    return (int) list.get(0);
  }

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
    String sql = " UPDATE bis_gdsjxx SET S3=1 WHERE ID=" + id;
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
  /*
   * @Description      : mapData查询条件匹配
   * @Author           : WangMeng
   * @Date             : 2020-06-12 23:32
   * @Param            : [mapData]
   * @Return           : java.lang.String
   **/
  public String content(Map<String, Object> mapData) {
    String content = "";
    if (mapData.get("qyid") != null && mapData.get("qyid") != "") {
      content += " and b.id=" + mapData.get("qyid");
    }
    if (mapData.get("name") != null && mapData.get("name") != "") {
      content += " and a.name like '%" + mapData.get("name") + "%'";
    }
    return content;
  }
}
