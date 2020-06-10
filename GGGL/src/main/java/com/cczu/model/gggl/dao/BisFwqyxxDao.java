package com.cczu.model.gggl.dao;

import com.cczu.model.gggl.entity.BIS_FwqyxxEntity;
import com.cczu.util.dao.BaseDao;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 服务企业信息
 */
@Repository("BisFwqyxxDao")
public class BisFwqyxxDao extends BaseDao<BIS_FwqyxxEntity, Long> {

	/**
	 * 分页查询
	 * @param mapData
	 * @return
	 */
	public List<Map<String, Object>> dataGrid(Map<String, Object> mapData) {
		String content=content(mapData);
		String ordercont=setSortWay(mapData,"","ORDER BY a.id desc");
		String sql =" SELECT top "+mapData.get("pageSize")+" * FROM ( SELECT ROW_NUMBER() OVER ("+ordercont+") AS RowNumber,a.* FROM bis_fwqyxx a "
				+ " left join bis_enterprise b on a.id1=b.id "
				+ " WHERE a.S3=0 and b.S3=0 "+content+" ) "
				+ "as a WHERE RowNumber > "+mapData.get("pageSize")+"*("+mapData.get("pageNo")+"-1) " ;
		List<Map<String, Object>> list=findBySql(sql, null,Map.class); 
		return list;
	}
	
    /**
     * 分页统计
     * @param mapData
     * @return
     */
	public int getTotalCount(Map<String,Object> mapData) {
		String content = content(mapData);
		String queryString = "select count(*) from bis_fwqyxx a "
							+ " left join bis_enterprise b on a.id1=b.id "
							+ " WHERE a.S3=0 and b.S3=0 "+content;
		List<Object> list = findBySql(queryString);

		return (int) list.get(0);
	}
	
    /**
     * 删除
     * @param id
     */
    public void deleteInfo(Long id) {
		String sql=" UPDATE bis_fwqyxx SET S3=1 WHERE ID="+id;
		updateBySql(sql);
	}

	public String content(Map<String,Object> mapData) {
		String content = "";
		if (mapData.get("qyid") != null && mapData.get("qyid") != "") {
			content += " and b.id=" + mapData.get("qyid");
		}
		if (mapData.get("m1") != null && mapData.get("m1") != "") {
			content += " and a.m1 like '%" + mapData.get("m1") + "%'";
		}
		return content;
	}
}
