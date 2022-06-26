package team.stu.cnote.service;

import com.alibaba.fastjson.JSONArray;
import team.stu.cnote.domain.File;
import team.stu.cnote.domain.vo.FileVO;

import java.util.List;

/**
 * @author kamifeng
 * @date 2022/6/24 11:52
 */
public interface FileService {
    /**
     * 查找所有文件
     * @return List
     */
    List<File> findAll();

    /**
     * 新建文件
     * @param file
     * @return int
     */
    int save(File file);

    /**
     * 更新文件
     * @param file
     */
    void update(File file);

    /**
     * 找到父亲的所有子节点
     * @param parentId
     * @return
     */
    List<File> findAllByParentId(int parentId);

    /**
     * 以树结构的形式找出所有文件
     * @param fileId
     * @return
     */
    JSONArray findTree(int fileId);

    /**
     * 根据路径找出该路径下的所有文件，用于面包屑导航
     * @param path
     * @return
     */
    List<FileVO> findAllByPath(String path);
}
