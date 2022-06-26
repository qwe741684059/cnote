package team.stu.cnote.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author kamifeng
 * @date 2022/6/25 0:49
 */
@Data
public class FileVO {
    @ApiModelProperty("文件Id")
    private int fileId;
    @ApiModelProperty("文件名")
    private String name;
    @ApiModelProperty("文件类型")
    private String file;
}
