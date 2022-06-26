package team.stu.cnote.domain;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import team.stu.cnote.base.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * @author kamifeng
 * @date 2022/6/26 11:21
 */
@Entity
@Data
public class FileDetail extends BaseEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @ApiModelProperty("文件详细Id")
    private int fileDetailId;
    @ApiModelProperty("文件Id")
    private int fileId;
    @ApiModelProperty("主题")
    private String theme;
    @ApiModelProperty("markdown内容")
    private String mdContent;
    @ApiModelProperty("html内容")
    private String htmlContent;
}
