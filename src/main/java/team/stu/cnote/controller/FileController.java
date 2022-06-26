package team.stu.cnote.controller;

import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import team.stu.cnote.domain.File;
import team.stu.cnote.service.FileService;

/**
 * @author kamifeng
 * @date 2022/6/24 11:56
 */
@RestController
@RequestMapping("/file")
@Api(tags = "文件管理")
public class FileController {
    @Autowired
    private FileService fileService;

    @GetMapping("/findAll")
    public ResponseEntity<Object> findAll() {
        return new ResponseEntity<>(fileService.findAll(), HttpStatus.OK);
    }

    @PostMapping("/save")
    public ResponseEntity<Object> save(@RequestBody File file) {
        int isSuccess = fileService.save(file);
        if (isSuccess == 0) {
            return new ResponseEntity<>(null,HttpStatus.FOUND);
        } else {
            return new ResponseEntity<>(null, HttpStatus.OK);
        }
    }

    @GetMapping("/findTree")
    public ResponseEntity<Object> findTree() {
        return new ResponseEntity<>(fileService.findTree(1),HttpStatus.OK);
    }

    @PostMapping("/findAllByPath")
    public ResponseEntity<Object> findAllByPath(@RequestBody String path) {
        return new ResponseEntity<>(fileService.findAllByPath(path), HttpStatus.OK);
    }
}
