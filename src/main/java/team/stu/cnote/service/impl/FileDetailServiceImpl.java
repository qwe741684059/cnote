package team.stu.cnote.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.stu.cnote.domain.FileDetail;
import team.stu.cnote.repository.FileDetailRepository;
import team.stu.cnote.service.FileDetailService;

/**
 * @author kamifeng
 * @date 2022/6/26 11:26
 */
@Service
public class FileDetailServiceImpl implements FileDetailService {
    @Autowired
    private FileDetailRepository fileDetailRepository;

    @Override
    public FileDetail findFileDetailByFileDetailId(int fileDetailId) {
        return fileDetailRepository.findFileDetailByFileDetailId(fileDetailId);
    }

    @Override
    public FileDetail findFileDetailByFileId(int fileId) {
        return fileDetailRepository.findFileDetailByFileId(fileId);
    }

    @Override
    public void update(FileDetail fileDetail) {
        fileDetailRepository.save(fileDetail);
    }

    @Override
    public int save(FileDetail fileDetail) {
        FileDetail fileDetail1 = findFileDetailByFileId(fileDetail.getFileId());
        int fileDetailId = 0;
        if(fileDetail1 == null) {
            fileDetailRepository.save(fileDetail);
            fileDetailId = fileDetailRepository.findFileDetailByFileId(fileDetail.getFileId()).getFileDetailId();
        } else {
            fileDetailId = fileDetail1.getFileDetailId();
        }
        return fileDetailId;

    }
}
