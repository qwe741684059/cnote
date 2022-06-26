package team.stu.cnote.base;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.util.Date;

/**
 * @author kamifeng
 * @date 2022/6/24 12:08
 */

@Data
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public class BaseEntity implements Serializable {
    @CreationTimestamp
    @ApiModelProperty("创建时间")
    private Date createTime;

    @UpdateTimestamp
    @ApiModelProperty("修改时间")
    private Date updateTime;
}
