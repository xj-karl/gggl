package com.cczu.model.gggl.dao;

import com.cczu.model.gggl.entity.GlgdxxEntity;
import com.cczu.util.dao.BaseDao;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 管廊管道信息
 */
@Repository("GlgdxxDao")
public class GlgdxxDao extends BaseDao<GlgdxxEntity, Long> {

    /**
     * 分页查询
     *
     * @param mapData
     * @return
     */
    public List<Map<String, Object>> dataGrid(Map<String, Object> mapData) {
        String content = content(mapData);
        String ordercont = setSortWay(mapData, "", "ORDER BY a.gid ");
        String sql = " SELECT top " + mapData.get("pageSize") + " * FROM ( SELECT ROW_NUMBER() OVER ("
                        + ordercont + ") AS RowNumber,a.* FROM glgdxx a "
                        + " WHERE 1=1  " + content
                        + " ) " + "as a WHERE RowNumber > " + mapData.get("pageSize") + "*(" + mapData.get("pageNo") + "-1) ";
        List<Map<String, Object>> list = findBySql(sql, null, Map.class);
        return list;
    }

    /**
     * 分页统计
     * @param mapData
     * @return
     */
    public int getTotalCount(Map<String, Object> mapData) {
        String content = content(mapData);
        String queryString = "select count(*) from glgdxx a  WHERE 1=1 " + content;
        List<Object> list = findBySql(queryString);

        return (int) list.get(0);
    }

    public String content(Map<String, Object> mapData) {
        String content = "";
        if (mapData.get("m1") != null && mapData.get("m1") != "") {
            content += " and a.m1 like '%" + mapData.get("m1") + "%'";
        }
        return content;
    }

}
