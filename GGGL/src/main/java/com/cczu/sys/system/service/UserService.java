package com.cczu.sys.system.service;

import com.cczu.model.dao.IBisQyjbxxDao;
import com.cczu.sys.comm.mapper.JsonMapper;
import com.cczu.sys.comm.persistence.HibernateDao;
import com.cczu.sys.comm.service.BaseService;
import com.cczu.sys.comm.utils.DateUtils;
import com.cczu.sys.comm.utils.ExinExcel;
import com.cczu.sys.comm.utils.security.Digests;
import com.cczu.sys.comm.utils.security.Encodes;
import com.cczu.sys.system.dao.*;
import com.cczu.sys.system.entity.*;
import com.cczu.sys.system.service.ShiroRealm.ShiroUser;
import com.cczu.sys.system.utils.UserUtil;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户service
 * @author jason
 * @date 2017年5月31日
 */
@Service
@Transactional(readOnly = true)
public class UserService extends BaseService<User, Integer> {
	
	/**加密方法*/
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;	//盐长度

	@Autowired
	private UserDao userDao;
	@Autowired
	private UserDefineDao userDefineDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private UserRoleDao userRoleDao;
	@Resource
	private IBisQyjbxxDao bisQyjbxx;
	@Autowired
	private CompUserRoleDao compuserRoleDao;
	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private CompRoleDao compRoleDao;

	@Override
	public HibernateDao<User, Integer> getEntityDao() {
		return userDao;
	}

	/**
	 * 保存用户
	 * @param user
	 */
	@Transactional(readOnly=false)
	public void save(User user) {
		entryptPassword(user);
		user.setCreateDate(DateUtils.getSysTimestamp());
		ShiroUser sessionuser= UserUtil.getCurrentShiroUser();
//		userDao.save(user);
		int i=userDao.saveback(user);//保存用户信息
		//用户保存成功添加，为用户添加角色
		if(i>0){
			Role role=new Role();
			UserRole ur = new UserRole();
			ur.setUser(new User(i));
			switch(sessionuser.getUsertype())
			{
				//如果是安监管理员添加的用户，设置添加的用户角色为安监普通用户
				case "0":
				role=roleDao.findRoleByRoleCode("ajcounty");
				ur.setRole(role);
				userRoleDao.save(ur);
				break;
				//如果是企业管理员添加的用户，设置添加的用户角色为企业普通用户
				case "1":
					role=roleDao.findRoleByRoleCode("company");
					ur.setRole(role);
					User user2=userDao.find(i);
					user2.setId2(sessionuser.getQyid());
					user2.setXzqy(sessionuser.getXzqy());
					userDao.save(user2);
					userRoleDao.save(ur);
					break;
				default:
					break;
			}
		}
		
		
	}

	/**
	 * 共通处理
	 * @param user
	 * @param sessionuser
	 * @param role
	 * @param ur
	 * @param i
	 * @param strRoleCode
	 * @param intRoleCode
	 */
//	public void setUserRoleFlg(User user,ShiroUser sessionuser,Role role,UserRole ur,int i,String strRoleCode,int intRoleCode){
//		if(user.getUsertype().equals("0")){
//			role=roleDao.findRoleByRoleCode(strRoleCode);
//			User user2=userDao.find(i);
//			user2.setXzqy(sessionuser.getXzqy());
//			userDao.save(user2);
//		}
//		else if(user.getUsertype().equals("1")){
//			role=roleDao.findRoleByRoleCode("companyadmin");
//			User user2=userDao.find(i);
//			user2.setXzqy(sessionuser.getXzqy());
//			userDao.save(user2);
//			
//		}
//		ur.setRole(new Role(role.getId()));
//		userRoleDao.save(ur);
//	}
	
	/**
	 * 修改密码
	 * @param user
	 */
	@Transactional(readOnly=false)
	public void updatePwd(User user) {
		entryptPassword(user);
		userDao.save(user);
	}
	
	
	/**
	 * 更新用户信息
	 * @param user
	 */
	@Transactional(readOnly=false)
	public void updateUser(User user) {
		//保存用户信息
		userDao.save(user);
	}
	
	/**
	 * 删除用户
	 * @param id
	 */
	@Transactional(readOnly=false)
	public void delete(Integer id){
		if(!isSupervisor(id)){
			if(compuserRoleDao.findCompRoleIds(id).size()>0){
				compuserRoleDao.deleteCompUR(id);
			}
			if(userRoleDao.findRoleIds(id).size()>0){
				userRoleDao.deleteUR(id);
			}
			userDao.delete(id);
		}
	}


	/**
	 * 禁用用户
	 * @param id
	 */
	@Transactional(readOnly=false)
	public void disable(Integer id){
		if(!isSupervisor(id)){
			User user = userDao.findById(id);
			if(user!=null){
				user.setDelFlag("1");//禁用
				userDao.saveUp(user);
			}
		}
	}
	/**
	 * 启用用户
	 * @param id
	 */
	@Transactional(readOnly=false)
	public void enable(Integer id){
		if(!isSupervisor(id)){
			User user = userDao.findById(id);
			if(user!=null){
				user.setDelFlag("0");//启用
				userDao.saveUp(user);
			}
		}
	}


	/**
	 * 按登录名查询用户
	 * @param loginName
	 * @return 用户对象
	 */
	public User getUser(String loginName) {
		return userDao.findUniqueBy("loginName", loginName);
	}
	/**
	 * 按ID查询用户
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly=false)
	public User getUserById(Integer id) {
		return userDao.find(id);
	}
	
	/**
	 * 按ID查询用户
	 * @param id
	 * @return 用户对象
	 */
	public User getUserSqlById(Integer id) {
		return userDao.findById(id);
	}
	
	/**
	 * 按UID查询用户
	 * @param uid
	 * @return 用户对象list
	 */
	public List<User> getUserList(Integer uid) {
		return userDao.findByuid(uid);
	}
	
	/**
	 * 判断是否超级管理员
	 * @param id
	 * @return boolean
	 */
	public boolean isSupervisor(Integer id) {
		if( ( id == 1 ) || ( id == 2 ) ){
			return true;
		}else{
			return false;
		}
		
	}
	
	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(User user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(),salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}
	
	/**
	 * 验证原密码是否正确
	 * @param user
	 * @param oldPassword
	 * @return
	 */
	public boolean checkPassword(User user,String oldPassword){
		byte[] salt =Encodes.decodeHex(user.getSalt()) ;
		byte[] hashPassword = Digests.sha1(oldPassword.getBytes(),salt, HASH_INTERATIONS);
		if(user.getPassword().equals(Encodes.encodeHex(hashPassword))){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 修改用户登录
	 * @param user
	 */
	public void updateUserLogin(User user){
		user.setLoginCount((user.getLoginCount()==null?0:user.getLoginCount())+1);
		user.setLoginip(SecurityUtils.getSubject().getSession().getHost());
		user.setPreviousVisit(user.getLastVisit());
		user.setLastVisit(DateUtils.getSysTimestamp());
		update(user);
	}

	public String getUserJson() {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<User> list=userDao.findByAllUserByContent(dataMap);
		
		List<Map<String, Object>> arrylist = new ArrayList<Map<String, Object>>();
		for(User user:list){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", user.getId());
			map.put("text", user.getName());
			arrylist.add(map);
		}
		return JsonMapper.getInstance().toJson(arrylist);
	}

	/**
	 * 根据企业id查询用户list
	 * @param map
	 * @return
	 */
	public String getUJsonById2(Map<String,Object> map) {
		return JsonMapper.getInstance().toJson(userDao.getUJsonById2(map));
	}
	
	/**
	 * 根据企业id查询用户list
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> getAllUJsonById2(Map<String,Object> map) {
		return userDao.getUJsonById2(map);
	}
	
	/**
	 * 根据用户角色查询用户
	 * @param comprolecode
	 * @return 用户对象list
	 */
	public String findUserByContent(String yqid,String depid,String comprolecode) {
		List<User> list=userDao.findUserByContent(yqid,depid,comprolecode);

		List<Map<String, Object>> arrylist = new ArrayList<Map<String, Object>>();
		for(User user:list){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", user.getId());
			map.put("text", user.getName());
			arrylist.add(map);
		}
		return JsonMapper.getInstance().toJson(arrylist);
	}
	/**
	 * 根据用户角色查询用户
	 * @param comprolecode
	 * @return 用户对象list
	 */
	public String findUserByComprolecode(String yqid,String depid,String comprolecode) {
		List<User> list=userDao.findUserByContent(yqid,depid,comprolecode);
		if (list.size() > 0) {
			return list.get(0).getId()+"";
		}else {
			return "";
		}
	}

	/**
	 * 根据查询条件查询所有用户
	 * @param map
	 * @return
	 */
	public List<User> findByAllUserByContent(Map<String, Object> map){
		return userDao.findByAllUserByContent(map);
	}
	
	
	public Map<String, Object> searchData(Map<String, Object> map) {
		List<User> list=userDao.dataGrid(map);
		int getTotalCount=userDao.getTotalCount(map);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("rows", list);
		map2.put("total", getTotalCount);
		return map2;
	}
	
	/**
	 * 添加内部角色
	 * @param map
	 * @return
	 */
	public Map<String, Object> searchDataAndNbjs(Map<String, Object> map) {
		List<Map<String, Object>> list=userDao.nbjs(map);
		int getTotalCount=userDao.getNbjsCount(map);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("rows", list);
		map2.put("total", getTotalCount);
		return map2;
	}
	
	/**
	 * 通过用户名获取数据，用于获取userroleflg,对用户权限进行判断
	 * @param loginName 用户名
	 * @return
	 */
	public User findByname(String loginName){
		return userDao.findByname(loginName);
	}
	
	/**
	 * 获取员工部门和岗位信息
	 * @param map
	 * @return
	 */
	public Map<String,Object> getGwAndBm(Map<String, Object> map){
		return userDao.getGwAndBm(map);
	}
	
	/**
	 * 根据部门id查询用户list
	 * @param map
	 * @return
	 */
	public String getUJsonByDep(Map<String,Object> map) {
		return JsonMapper.getInstance().toJson(userDao.getUJsonByDep(map));
	}
	
	/**
	 * 通过企业id，权限获取相应人员
	 * @return
	 */
	public List<User> findUserByPermission(Long qyid,String permission){
		return userDao.findUserByPermission(qyid,permission);
	}

	/**
	 * 添加或修改用户自定义界面
	 * @param u
	 */
	public void addSelInfo(User_Define u) {
		userDefineDao.save(u);
	}

	/**
	 * 添加或修改用户自定义界面
	 * @param userid
	 */
	public User_Define findMenuByUserid(Integer userid) {
		return userDefineDao.findByUserid(userid);
	}

	/**
	 * 通过id集合，获取email存在人员
	 * @return
	 */
	public List<User> findUserByIditems(String ids) {
		return userDao.findUserByIditems(ids);
	}

	/**
	 * 用户导入
	 * @param map
	 * @return
	 */
	public Map<String,Object> exinExcel(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String,Object> resultmap = new HashMap<String, Object>();
		int result = 0;
		ExinExcel exin = new ExinExcel();
		List<List<Object>> list = exin.exinExcel(map.get("filename").toString(), (InputStream) map.get("content"));
		int i = 0, error = 0;
		if (list.size() > 3) {
			result = 0;
			resultmap.put("total", list.size()-3);
			resultmap.put("returncode", "success");
			resultmap.put("success",result);
			for (List<Object> bis : list) {
				if(i<=2){ //跳过前三行
					i++;
					continue;
				}
				try{
					User user = new User();
					user.setPlainPassword("000000");
					user.setUsertype("1");
					user.setUid((long) UserUtil.getCurrentShiroUser().getId());
					user.setId2(Long.valueOf(map.get("qyid").toString()));
					user.setLoginName(bis.get(0).toString());
					user.setName(bis.get(1).toString());
					String gender = bis.get(2).toString();
					if(gender.equals("男")) {
						user.setGender(Short.parseShort("1"));
					}else if(gender.equals("女")) {
						user.setGender(Short.parseShort("0"));
					}
					String bm = bis.get(3).toString();//用户所属部门
					user.setEmail(bis.get(4).toString());
					user.setPhone(bis.get(5).toString());
					String role = bis.get(6).toString();
					user.setDescription(bis.get(7).toString());
					Department dep = departmentDao.findInfoByName(bm, user.getId2());
					CompRole compRole = compRoleDao.findCompRoleByRoleName(role, user.getId2());
					if (dep != null && compRole != null) {
						user.setDepartmen(dep.getId());
						save(user);
						CompUserRole ur = new CompUserRole();
						ur.setUser(new User(user.getId()));
						ur.setCompRole(new CompRole(compRole.getId()));
						compuserRoleDao.save(ur);
						result++;
					}else {
						error++;
					}
				}catch(Exception e){
					error++;
				}
				resultmap.put("success",result);
				resultmap.put("error", error);
			}
		}else if(list.size()==3){
			resultmap.put("success",result);
			resultmap.put("error", error);
			resultmap.put("returncode", "warn");
		}else if(list.size()<3){
			resultmap.put("success",result);
			resultmap.put("error", error);
			resultmap.put("returncode", "ext");
		}
		if(Integer.valueOf(resultmap.get("success").toString())==0){
			resultmap.put("returncode", "warn");
		}
		return resultmap;
	}
}
