package kh.project.dml.fileUpload.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileUploadController {
    private static final String CURR_IMAGE_REPO_PATH = 
                "C:\\workspace\\github\\DML\\src\\main\\webapp\\WEB-INF\\views\\board\\upload";
   // "C:\\workspace";
    @RequestMapping(value="/board/form")
    public String form() {
        return "board/uniform";
    }
    
    @PostMapping("/board/upload")
    public ModelAndView upload(MultipartHttpServletRequest multipartRequest,
                    HttpServletResponse response) throws Exception{
        multipartRequest.setCharacterEncoding("utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        Enumeration enu = multipartRequest.getParameterNames();
        
        while(enu.hasMoreElements()) {
            String name = (String)enu.nextElement();
            String value = multipartRequest.getParameter(name);
            map.put(name, value);
        }
        
        List fileList = fileProcess(multipartRequest);
        map.put("fileList", fileList);
        
        ModelAndView mav = new ModelAndView();
        mav.addObject("map", map);
        mav.setViewName("board/result");
        return mav;
    }
    
    private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) 
        throws Exception{
        List<String> fileList = new ArrayList<String>();
        Iterator<String> fileNames = multipartRequest.getFileNames();
        
        while(fileNames.hasNext()) {
            String fileName = fileNames.next();
            MultipartFile mFile = multipartRequest.getFile(fileName);
            String originalFileName = mFile.getOriginalFilename();
            fileList.add(originalFileName);
            File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
            if(mFile.getSize() != 0) {
                if(!file.exists()) {
                    if(file.getParentFile().mkdir()) {
                        file.createNewFile();
                    }
                }
                mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName));
            }
        }
        return fileList;
    }
}
