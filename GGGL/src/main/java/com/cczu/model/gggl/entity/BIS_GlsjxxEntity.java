package com.cczu.model.gggl.entity;

import com.cczu.util.entity.BaseEntity;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @ClassName BIS_GlsjxxEntity @Author wangmeng @Description 管廊数据信息 @Data 2020-06-12 20:51 @Version
 * 1.0
 */
@Entity
@Table(name = "bis_glsjxx")
public class BIS_GlsjxxEntity extends BaseEntity {

  @Column(name = "id1", nullable = true, columnDefinition = "bigint")
  @Setter
  @Getter
  private Long id1; // 企业id

  @Column(name = "name", nullable = true, columnDefinition = "varchar(500)")
  @Setter
  @Getter
  private String name; // 管廊名称

  @Column(name = "startCoordinate", nullable = true, columnDefinition = "varchar(500)")
  @Setter
  @Getter
  private String startCoordinate; // 起始坐标

  @Column(name = "endCoordinate", nullable = true, columnDefinition = "varchar(200)")
  @Setter
  @Getter
  private String endCoordinate; // 终点坐标

  @Column(name = "remark", nullable = true, columnDefinition = "varchar(1000)")
  @Setter
  @Getter
  private String remark; // 备注
}
