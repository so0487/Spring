package com.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.utils.MediaUtils;
import com.spring.utils.UploadFileUtils;

@Controller
public class FileUploadController {

	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);

	// 동기 방식

	@RequestMapping(value = "/multipartFile", method = RequestMethod.POST)
	public String uploadByMultipartFile(String title, @RequestParam("file") MultipartFile multi,
			HttpServletResponse response, Model model, HttpServletRequest request) throws Exception {
		String url = "fileUploaded";

		// 파일 유무 확인
		if (multi.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('파일이 없습니다!');</script>");
			out.println("<script>history.go(-1);</script>");
			return null;
		}

		// 용량 제한 5MB
		if (multi.getSize() > 1024 * 1024 * 5) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('용량초과 입니다!');</script>");
			out.println("<script>history.go(-1);</script>");
			return null;
		}

		// 파일 저장 폴더 설정
		String uploadPath = request.getServletContext().getRealPath("resources/upload");

		// 파일명 중복방지
		String fileName = UUID.randomUUID().toString().replace("-", "") + "$$" + multi.getOriginalFilename();

		// 파일 경로확인 및 생성
		File file = new File(uploadPath, fileName);

		if (!file.exists()) {
			file.mkdirs();
		}

		// 파일 저장
		multi.transferTo(file);

		// 파일 저장 정보 넘겨주기
		model.addAttribute("title", title);
		model.addAttribute("originalFileName", multi.getOriginalFilename());
		model.addAttribute("uploadedFileName", file.getName());
		model.addAttribute("uploadPath", file.getAbsolutePath());

		return url;
	}

	@RequestMapping(value = "/multipartHttpServletRequest", method = RequestMethod.POST)
	public String uploadByMultipartHttpServletRequest(MultipartHttpServletRequest request, HttpServletResponse response,
			Model model) throws Exception {

		String url = "fileUploaded";

		String title = request.getParameter("title");
		MultipartFile multi = request.getFile("file");

		File file = saveFile(multi, request, response);

		// 파일 저장 정보 넘겨주기
		model.addAttribute("title", title);
		model.addAttribute("originalFileName", multi.getOriginalFilename());
		model.addAttribute("uploadedFileName", file.getName());
		model.addAttribute("uploadPath", file.getAbsolutePath());

		return url;
	}

	@RequestMapping(value = "/commandObject", method = RequestMethod.POST)
	public String uploadByCommandObject(FileUploadCommand command, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		String url = "fileUploaded";

		MultipartFile multi = command.getFile();

		File file = saveFile(multi, request, response);

		// 파일 저장 정보 넘겨주기
		model.addAttribute("title", command.getTitle());
		model.addAttribute("originalFileName", multi.getOriginalFilename());
		model.addAttribute("uploadedFileName", file.getName());
		model.addAttribute("uploadPath", file.getAbsolutePath());

		return url;
	}

	// 비동기 방식
	@Resource(name = "uploadPath") // bean 등록 했을 시 id를 가지고 참조함
	private String uploadPath;

	@RequestMapping(value="uploadAjax", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public ResponseEntity<String>uploadAjax(MultipartFile file) throws Exception{
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contextType : " + file.getContentType());

		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),HttpStatus.CREATED);
	}

	@RequestMapping(value="/displayFile", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]>entity = null;
		logger.info("File name : " + fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			
			fileName = fileName.replace('/', File.separatorChar);
			in = new FileInputStream(uploadPath+fileName);
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment;filename=\""+new String(fileName.getBytes("utf-8"),"ISO-8559-1")+"\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
		}catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		}finally {
			in.close();
		}
		return entity;
	}
	
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		logger.info("delete fileName : " + fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		boolean result=true;
		
		if(mType != null) {
			String front = fileName.substring(0,12);
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}
		
		result =  result && new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		
		if(result) {
			entity=new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			entity=new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	private File saveFile(MultipartFile multi, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 파일 유무 확인
		if (multi.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('파일이 없습니다.!');</script>");
			out.println("<script>history.go(-1);</script>");
			return null;
		}

		// 파일 용량제한 5MB
		if (multi.getSize() > 1024 * 1024 * 5) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('용량초과입니다.!');</script>");
			out.println("<script>history.go(-1);</script>");
			return null;
		}

		// 파일 저장폴더 생성
		String uploadPath = request.getServletContext().getRealPath("resources/upload");// 3.0부터는 리퀘스트에서 경로를 바로 가져올수
		// 있다.(getsession 필요x)

		// 파일명 중복방지
		String fileName = UUID.randomUUID().toString().replace("-", "") + "$$" + multi.getOriginalFilename();

		// 파일 경로확인 및 생성
		File file = new File(uploadPath, fileName);

		if (!file.exists()) {
			file.mkdirs();
		}

		// 파일 저장
		multi.transferTo(file);

		return file;
	}

}