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
 *
 * @author kamifeng
 * @date 2022/6/24 11:29
 */
@Entity
@Data
public class File extends BaseEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @ApiModelProperty("文件Id")
    private int fileId;
    @ApiModelProperty("文件名")
    private String fileName;
    @ApiModelProperty("文件类型")
    private String fileType;
    @ApiModelProperty("父节点")
    private int parentId;
    @ApiModelProperty("文件路径")
    private String filePath;

}
