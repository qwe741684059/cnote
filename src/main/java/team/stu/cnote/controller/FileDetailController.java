package team.stu.cnote.controller;

import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import team.stu.cnote.domain.FileDetail;
import team.stu.cnote.service.FileDetailService;

/**
 * @author kamifeng
 * @date 2022/6/26 11:26
 */
@RestController
@RequestMapping("/fileDetail")
@Api(tags = "详细文件管理")
public class FileDetailController {
    @Autowired
    private FileDetailService fileDetailService;

    @PostMapping("/findByFileDetailId/{fileDetailId}")
    public ResponseEntity<Object> findByFileDetailId(@PathVariable("fileDetailId") int fileDetailId) {
        return new ResponseEntity<>(fileDetailService.findFileDetailByFileDetailId(fileDetailId), HttpStatus.OK);
    }

    @PostMapping("/findByFileId")
    public ResponseEntity<Object> findByFileId(@RequestBody int fileId) {
        return new ResponseEntity<>(fileDetailService.findFileDetailByFileId(fileId), HttpStatus.OK);
    }

    @PostMapping("/save")
    public ResponseEntity<Object> save(@RequestBody FileDetail fileDetail) {
        return new ResponseEntity<>(fileDetailService.save(fileDetail), HttpStatus.OK);
    }

    @PostMapping("/update")
    public ResponseEntity<Object> update(@RequestBody FileDetail fileDetail) {
        fileDetailService.update(fileDetail);
        return new ResponseEntity<>(null, HttpStatus.OK);
    }
}
