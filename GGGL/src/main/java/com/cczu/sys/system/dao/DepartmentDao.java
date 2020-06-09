package com.cczu.sys.system.dao;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import com.cczu.sys.comm.persistence.HibernateDao;
import com.cczu.sys.system.entity.Department;

/**
 * 部门管理DAO
 * @author jason
 */
@SuppressWarnings("unchecked")
@Repository
public class DepartmentDao extends HibernateDao<Department, Long>{
	
	public List<Department> dataGrid(Map<String, Object> map) {
		String content=content(map);
		String sql=" SELECT ROW_NUMBER() OVER (ORDER BY a.m2) AS RowNumber,a.* FROM t_department a left join t_user b on a.id1=b.id  WHERE 1=1 "+content ;
		SQLQuery sqlQuery=createSQLQuery(sql);
		sqlQuery.addEntity(Department.class);
		return sqlQuery.list();
	}

	public int getTotalCount(Map<String, Object> map) {
		String content=content(map);
		String sql=" SELECT COUNT(a.ID) sum  FROM t_department a left join t_user b on a.id1=b.id where 1=1 "+ content;
		SQLQuery sqlQuery=createSQLQuery(sql);
		return (int) sqlQuery.list().get(0);
	}

	//分管领导
	public List<Map<String, Object>> findSjLd(Long depid) {
		String sql=" select a.user_id ldid,b.name from t_comp_dep_upleader a left join t_user b on a.user_id=b.id where dep_id ="+depid;
		SQLQuery sqlQuery=createSQLQuery(sql);
		sqlQuery.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		return sqlQuery.list();
	}

	public void deletefgld(String bmid){
		String sql=" DELETE FROM t_comp_dep_upleader WHERE dep_id = " + bmid;
		createSQLQuery(sql).executeUpdate();
	}

	public void addfgld(String bmid,String userid){
		String sql=" INSERT INTO t_comp_dep_upleader (dep_id, user_id) VALUES ("+bmid+", "+userid+")";
		createSQLQuery(sql).executeUpdate();
	}

	/**
     * 查询条件判断
     * @return
	 * @throws ParseException 
     */
	public String content(Map<String, Object> mapData) {
		String content=" ";
		
		if(mapData.get("m1")!=null&&mapData.get("m1")!=""){
			content = content + "AND a.m1 like'%"+mapData.get("m1")+"%'"; 
		}
		if(mapData.get("flag")!=null&&mapData.get("flag")!=""){
			content = content + "AND a.flag ='"+mapData.get("flag")+"' "; 
		}
		if(mapData.get("id2")!=null&&mapData.get("id2")!=""){
			content = content + "AND a.id2 ='"+mapData.get("id2")+"' "; 
		}
		if(mapData.get("id3")!=null&&mapData.get("id3")!=""){
			content = content + "AND b.xzqy ='"+mapData.get("id3")+"' "; 
		}
		return content;
	}

	public List<Department> findJson(Map<String, Object> mapd) {
		String content=content(mapd);
		String sql=" SELECT  * FROM t_department a left join t_user b on a.id1=b.id WHERE 1=1 "+content;
		SQLQuery sqlQuery=createSQLQuery(sql);
		sqlQuery.addEntity(Department.class);
		return sqlQuery.list();
	}
	
	public List<Map<String,Object>> findJsonForApp(Map<String, Object> mapd) {
		String content=content(mapd);
		String sql=" SELECT  a.id,a.m1 FROM t_department a left join t_user b on a.id1=b.id WHERE 1=1 "+content;
		SQLQuery sqlQuery=createSQLQuery(sql);
		sqlQuery.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		return sqlQuery.list();
	}
	
	public Department findInfoById(long id) {
		String sql=" SELECT  * FROM t_department WHERE id= "+id;
		SQLQuery sqlQuery=createSQLQuery(sql);
		sqlQuery.addEntity(Department.class);
		return (Department)sqlQuery.list().get(0);
	}
	//根据部门id集合查询部门
	public List<Department> findListByBmids(String ids) {
		String sql=" SELECT  * FROM t_department WHERE ID IN ("+ids+")";
		SQLQuery sqlQuery=createSQLQuery(sql);
		sqlQuery.addEntity(Department.class);
		return sqlQuery.list();
	}
	
	public List<Department> findInfoByQyId(Long qyid) {
		String sql=" SELECT * FROM t_department WHERE ID2=" + qyid;
		SQLQuery sqlQuery=createSQLQuery(sql);
		sqlQuery.addEntity(Department.class);
		return sqlQuery.list();
	}
	
	public Department findInfoByName(String deptname, Long qyid) {
		String sql=" SELECT * FROM t_department WHERE m1= '" + deptname+ "' and id2="+qyid;
		SQLQuery sqlQuery=createSQLQuery(sql);
		sqlQuery.addEntity(Department.class);
		return (Department)sqlQuery.list().get(0);
	}
	
	/**
	 * 修改部门网格所属父级，及该网格下所有子网格的编码都要修改
	 * @param oldpcode
	 * @param newpcode
	 */
	public void updateFcode(String oldpcode,String newpcode){
		String sql=" update t_department set code=replace(code,'"+oldpcode+"','"+newpcode+"')";
		createSQLQuery(sql).executeUpdate();
	}

	/**
	 * 获取部门人员list
	 * @return
	 */
	public List<Map<String,Object>> findById(Map<String, Object> mapData) {
		String sql =" SELECT top "+mapData.get("pageSize")+" * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY cor.sort desc) AS RowNumber,"
					+ " a.*,cor.name role from t_user a left join t_comp_user_role cou on a.id = cou.user_id "
					+ " left join t_comp_role cor on cou.role_id = cor.id where 1=1 and a.departmen="+mapData.get("id")
					+ ")as a WHERE  RowNumber > "+mapData.get("pageSize")+"*("+mapData.get("pageNo")+"-1) " ;
		SQLQuery sqlQuery=createSQLQuery(sql);
		sqlQuery.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		return sqlQuery.list();
	}

	//获取部门人员数量
	public int getViewCount(Map<String, Object> mapData) {
		String sql=" select COUNT(a.ID) sum from t_user a left join t_comp_user_role cou on a.id = cou.user_id "
				+ " left join t_comp_role cor on cou.role_id = cor.id where 1=1 and a.departmen="+mapData.get("id");
		SQLQuery sqlQuery=createSQLQuery(sql);
		return (int) sqlQuery.list().get(0);
	}

	/**
	 * 根据id查看部门信息
	 */
	public Map<String,Object> findById2(Long id) {
		String sql=" select a.id,a.m1 bm,f.m1 sjbm,fg.name fgld from t_department a left join t_department f on a.fid=f.id "
					+ " left join t_comp_dep_upleader c on a.id=c.dep_id left join t_user fg on c.user_id=fg.id where 1=1 and a.id="+id;
		SQLQuery sqlQuery=createSQLQuery(sql);
		sqlQuery.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		return (Map<String, Object>) sqlQuery.list().get(0);

	}
}
