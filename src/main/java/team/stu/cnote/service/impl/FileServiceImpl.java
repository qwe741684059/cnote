package team.stu.cnote.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.stu.cnote.domain.File;
import team.stu.cnote.domain.vo.FileVO;
import team.stu.cnote.repository.FileRepository;
import team.stu.cnote.service.FileService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author kamifeng
 * @date 2022/6/24 11:55
 */
@Service
public class FileServiceImpl implements FileService {
    @Autowired
    private FileRepository fileRepository;

    @Override
    public List<File> findAll() {
        return fileRepository.findAll();
    }

    @Override
    public int save(File file) {
        if (fileRepository.findFileByFilePathAndFileNameAndFileType(file.getFilePath(),file.getFileName(),file.getFileType()) != null) {
            return 0;
        } else {
            String[] ph = file.getFilePath().split("/");
            String parentPath = "";
            for (int i = 0; i < ph.length-1; i++) {
                if(i != 0) {
                    parentPath = parentPath.concat("/");
                }
                parentPath = parentPath.concat(ph[i]);
            }
            if ("".equals(parentPath)) {
                file.setParentId(1);
            } else {
                int parentId = fileRepository.findFileByFilePathAndFileNameAndFileType(parentPath, ph[ph.length-1], null).getFileId();
                file.setParentId(parentId);
            }
            fileRepository.save(file);
            return 1;
        }
    }

    @Override
    public void update(File file) {

    }

    @Override
    public List<File> findAllByParentId(int parentId) {
        return fileRepository.findAllByParentId(parentId);
    }

    @Override
    public JSONArray findTree(int fileId) {
        return getNodeJson(fileId);
    }

    @Override
    public List<FileVO> findAllByPath(String path) {
        List<File> fileList = fileRepository.findAllByFilePath(path);
        List<FileVO> fileVOList = new ArrayList<>();
        for (File file : fileList) {
            FileVO fileVO = new FileVO();
            fileVO.setFileId(file.getFileId());
            fileVO.setFile(file.getFileType());
            fileVO.setName(file.getFileName());
            fileVOList.add(fileVO);
        }
        return fileVOList;
    }

    /**
     * 递归处理，获取树结构
     * @param nodeId
     * @return
     */
    private JSONArray getNodeJson(int nodeId) {
        List<File> childList = fileRepository.findAllByParentId(nodeId);
        JSONArray childTree = new JSONArray();
        for (File file : childList) {
            JSONObject object = new JSONObject();
            object.put("name", file.getFileName());
            object.put("file", file.getFileType());
            JSONArray childs = getNodeJson(file.getFileId());
            if (!childs.isEmpty()) {
                object.put("children", childs);
            }
            childTree.fluentAdd(object);
        }
        return childTree;
    }
}
