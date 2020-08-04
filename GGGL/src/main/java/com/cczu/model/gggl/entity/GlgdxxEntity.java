package com.cczu.model.gggl.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 管廊管道信息
 */
@Entity
@Table(name="glgdxx")
public class GlgdxxEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2739094661745108104L;

	@Id
	@Column(name = "gid", nullable = false, columnDefinition="bigint")
	@Setter
	@Getter
	public Long gid;//编号
	
	@Column(name = "geom", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	public String geom;//geom

	@Column(name = "hasAttachment", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String hasAttachment;//hasAttachment

	@Column(name = "dno", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String dno;//dno
	
	@Column(name = "flow", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String flow;//flow
	
	@Column(name = "crttime", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String crttime;//crttime

	@Column(name = "modtime", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String modtime;//modtime

	@Column(name = "crtuser", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String crtuser;//crtuser

	@Column(name = "moduser", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String moduser;//moduser

	@Column(name = "guid", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String guid;//guid

	@Column(name = "ogid", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String ogid;//ogid

	@Column(name = "stnod", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String stnod;//stnod

	@Column(name = "ednod", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String ednod;//ednod

	@Column(name = "pipeid", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String pipeid;//pipeid

	@Column(name = "m1", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m1;//长度

	@Column(name = "m2", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m2;//管段名称

	@Column(name = "m3", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m3;//管径

	@Column(name = "m4", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m4;//材质

	@Column(name = "m5", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m5;//保温层厚

	@Column(name = "m6", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m6;//外管径

	@Column(name = "m7", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m7;//伴热管根数

	@Column(name = "m8", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m8;//备注

	@Column(name = "m9", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m9;//管长

	@Column(name = "m10", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m10;//管段编号

	@Column(name = "m11", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m11;//起始端节点

	@Column(name = "m12", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m12;//终止端节点

	@Column(name = "m13", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m13;//管道名称

	@Column(name = "m14", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m14;//管道编号

	@Column(name = "m15", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m15;//管段类型

	@Column(name = "m16", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m16;//管道级别

	@Column(name = "m17", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m17;//环焊缝类型

	@Column(name = "m18", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m18;//使用单位

	@Column(name = "m19", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m19;//壁厚_mm

	@Column(name = "m20", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m20;//制管焊缝类型

	@Column(name = "m21", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m21;//外防腐层材料

	@Column(name = "m22", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m22;//绝热层材料

	@Column(name = "m23", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m23;//绝热层厚度

	@Column(name = "m24", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m24;//外防腐层预制厂商

	@Column(name = "m25", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m25;//外防腐层安装地点

	@Column(name = "m26", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m26;//外防腐层生产单位

	@Column(name = "m27", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m27;//外防腐层监理单位

	@Column(name = "m28", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m28;//外防腐层检测单位

	@Column(name = "m29", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m29;//外防腐层厚度_mm

	@Column(name = "m30", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m30;//外涂刷方式

	@Column(name = "m31", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m31;//防腐号

	@Column(name = "m32", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m32;//检漏电压_V

	@Column(name = "m33", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m33;//补口防腐类型

	@Column(name = "m34", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m34;//操作压力_MPa

	@Column(name = "m35", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m35;//设计压力_MPa

	@Column(name = "m36", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m36;//许用压力_MPa

	@Column(name = "m37", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m37;//设计温度_C

	@Column(name = "m38", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m38;//操作温度_C

	@Column(name = "m39", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m39;//许用温度_C

	@Column(name = "m40", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m40;//设计介质

	@Column(name = "m41", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m41;//操作介质

	@Column(name = "m42", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m42;//许用介质

	@Column(name = "m43", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m43;//管道当前状态

	@Column(name = "m44", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m44;//巡线方式

	@Column(name = "m45", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m45;//巡线周期

	@Column(name = "m46", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m46;//管道失效记录

	@Column(name = "m47", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m47;//管道维修记录

	@Column(name = "m48", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m48;//年度检查报告编号

	@Column(name = "m49", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m49;//年度检查问题与处理

	@Column(name = "m50", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m50;//下次年度检查日期

	@Column(name = "m51", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m51;//全面检验报告编号

	@Column(name = "m52", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m52;//全面检验问题与处理

	@Column(name = "m53", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m53;//安全等级

	@Column(name = "m54", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m54;//下次全面检验日期

	@Column(name = "m55", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m55;//使用登记证编号

	@Column(name = "m56", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m56;//是否事故后果严重区

	@Column(name = "m57", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m57;//事故后果严重区分值

	@Column(name = "m58", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m58;//地区等级

	@Column(name = "m59", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m59;//防腐层等级

	@Column(name = "m60", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m60;//裂纹处数量

	@Column(name = "m61", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m61;//凹陷处数量

	@Column(name = "m62", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m62;//金属损失处数量

	@Column(name = "m63", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m63;//应力超标处数量

	@Column(name = "m64", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m64;//失效可能性得分

	@Column(name = "m65", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m65;//失效后果得分

	@Column(name = "m66", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m66;//第三方破坏得分

	@Column(name = "m67", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m67;//损伤得分

	@Column(name = "m68", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m68;//管理安全得分

	@Column(name = "m69", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m69;//管体本质安全得分

	@Column(name = "m70", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m70;//风险相对等级

	@Column(name = "m71", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m71;//风险绝对等级

	@Column(name = "m72", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m72;//风险值

	@Column(name = "m73", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m73;//风险评估单位

	@Column(name = "m74", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m74;//风险评估日期

	@Column(name = "m75", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m75;//HAZOP等级

	@Column(name = "m76", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m76;//管线编码

	@Column(name = "m77", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m77;//输出方编码

	@Column(name = "m78", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m78;//输送物质

	@Column(name = "m79", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m79;//管道所有者

	@Column(name = "m80", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m80;//管道走向

	@Column(name = "m81", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m81;//输出单位

	@Column(name = "m82", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m82;//输入单位

	@Column(name = "m83", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m83;//建造单位

	@Column(name = "m84", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m84;//管道规格

	@Column(name = "m85", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m85;//建造年份

	@Column(name = "m86", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m86;//管道材质

	@Column(name = "m87", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m87;//设计温度

	@Column(name = "m88", nullable = true, columnDefinition="varchar(400)")
	@Setter
	@Getter
	private String m88;//设计压力

}
