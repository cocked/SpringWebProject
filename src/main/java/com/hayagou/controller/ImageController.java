package com.hayagou.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hayagou.domain.RawImgVO;
import com.hayagou.service.RawImgService;
import com.hayagou.utils.UploadFileUtils;

@Controller
public class ImageController {
	private static final Logger logger = LoggerFactory.getLogger(ImageController.class);
	

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	RawImgService service;
	
	UploadFileUtils ufu = new UploadFileUtils();
	
	@RequestMapping(value = "/image/uploadForm", method = RequestMethod.GET)
	public String uploadFormGET() {
		return "/image/uploadForm";
	}
	
	//Post 방식 파일 업로드 + RawImage 디비 저장
	@RequestMapping(value = "/image/uploadFormPOST", method = RequestMethod.POST)	
	public String uploadFormPOST(RawImgVO vo, MultipartFile file, Model model) throws Exception {		
		
		logger.info("uploadFormPost");
		
		if(file != null) {
			logger.info("originalName:" + file.getOriginalFilename());
			logger.info("size:" + file.getSize());
			logger.info("ContentType:" + file.getContentType());
		}
		
		//String savedName = ufu.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		
		String imgUploadPath = uploadPath + File.separator + "image";
		String ymdPath = ufu.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		 fileName =  ufu.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setRaw_image_path(File.separator + "image" + ymdPath + File.separator + fileName);
			
		service.insert(vo);
		
		//model.addAttribute("savedName", savedName);
		
		return "/image/uploadForm";
	}
	
	
	
	
}