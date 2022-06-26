package team.stu.cnote.service;

import team.stu.cnote.domain.FileDetail;

/**
 * @author kamifeng
 * @date 2022/6/26 11:25
 */
public interface FileDetailService {

    /**
     * 根据详细文件的Id找到对应的详细文件
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

    /**
     * 修改保存详细文件
     * @param fileDetail
     */
    void update(FileDetail fileDetail);

    /**
     * 如果文件未存在则新建并返回DetailId，存在就直接返回DetailId
     * @param fileDetail
     * @return
     */
    int save(FileDetail fileDetail);
}
