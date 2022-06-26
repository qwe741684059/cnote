package team.stu.cnote.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import team.stu.cnote.domain.FileDetail;

/**
 * @author kamifeng
 * @date 2022/6/26 11:25
 */
public interface FileDetailRepository extends JpaRepository<FileDetail, Integer> {
    /**
     * 根据详细文件Id找到对应的详细文件
     * @param fileDetailId
     * @return
     */
    FileDetail findFileDetailByFileDetailId(int fileDetailId);

    /**
     * 根据文件Id找到对应的详细文件
     * @param fileId
     * @return
     */
    FileDetail findFileDetailByFileId(int fileId);

}
