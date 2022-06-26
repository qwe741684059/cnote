package team.stu.cnote.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import team.stu.cnote.domain.File;

import java.util.List;

/**
 * @author kamifeng
 * @date 2022/6/24 11:51
 */
public interface FileRepository extends JpaRepository<File, Integer> {
    /**
     * 找到父亲的所有子节点
     * @param parentId
     * @return List
     */
    List<File> findAllByParentId(int parentId);

    /**
     * 根据路径找到路径下的所有文件，用于面包屑导航
     * @param filePath
     * @return
     */
    List<File> findAllByFilePath(String filePath);

    /**
     * 根据路径，文件名，文件类型寻找文件，来检测文件是否存在或者寻找父节点
     * @param filePath
     * @param fileName
     * @param fileType
     * @return
     */
    File findFileByFilePathAndFileNameAndFileType(String filePath, String fileName, String fileType);

}
