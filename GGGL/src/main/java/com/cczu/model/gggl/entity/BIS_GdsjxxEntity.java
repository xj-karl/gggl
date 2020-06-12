package com.cczu.model.gggl.entity;

import com.cczu.util.entity.BaseEntity;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @ClassName BIS_GdsjxxEntity @Author wangmeng @Description 管道数据信息--实体类 @Data 2020-06-12
 * 21:58 @Version 1.0
 */
@Entity
@Table(name = "bis_gdsjxx")
public class BIS_GdsjxxEntity extends BaseEntity {

  @Column(name = "id1", nullable = true, columnDefinition = "bigint")
  @Setter
  @Getter
  private Long id1; // 企业id

  @Column(name = "number", nullable = true, columnDefinition = "varchar(200)")
  @Setter
  @Getter
  private String number; // 管道编号

  @Column(name = "name", nullable = true, columnDefinition = "varchar(200)")
  @Setter
  @Getter
  private String name; // 管道名称

  @Column(name = "pipeDiameter", nullable = true, columnDefinition = "varchar(500)")
  @Setter
  @Getter
  private String pipeDiameter; // 管径(/mm)

  @Column(name = "material", nullable = true, columnDefinition = "varchar(200)")
  @Setter
  @Getter
  private String material; // 材质

  @Column(name = "conveyingMedium", nullable = true, columnDefinition = "varchar(200)")
  @Setter
  @Getter
  private String conveyingMedium; // 输送介质

  @Column(name = "temperature", nullable = true, columnDefinition = "varchar(200)")
  @Setter
  @Getter
  private String temperature; // 温度(℃)

  @Column(name = "pressure", nullable = true, columnDefinition = "varchar(200)")
  @Setter
  @Getter
  private String pressure; // 压力(/Mpa)

  @Column(name = "flow", nullable = true, columnDefinition = "varchar(200)")
  @Setter
  @Getter
  private String flow; // 流量(kg/s)
}
