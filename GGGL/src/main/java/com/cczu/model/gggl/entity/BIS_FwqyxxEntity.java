package com.cczu.model.gggl.entity;

import com.cczu.util.entity.BaseEntity;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

/**
 * 
 * @ClassName: BIS_FwqyxxEntity
 * @Description: 服务企业信息
 * @author jason
 *
 */
@Entity
@Table(name="bis_fwqyxx")
public class BIS_FwqyxxEntity extends BaseEntity {
	

	@Column(name="id1", nullable=true, columnDefinition="bigint")
	@Setter
	@Getter
	private Long id1;//企业id
	
	@Column(name="m1", nullable=true, columnDefinition="varchar(500)")
	@Setter
	@Getter
	private String m1;//公司名称
	
	@Column(name = "m2", nullable = true, columnDefinition="varchar(500)")
	@Setter
	@Getter
	private String m2;//地址

	@Column(name = "m3", nullable = true, columnDefinition="varchar(200)")
	@Setter
	@Getter
	private String m3;//安全负责人

	@Column(name = "m4", nullable = true, columnDefinition="varchar(100)")
	@Setter
	@Getter
	private String m4;//安全员电话
}
