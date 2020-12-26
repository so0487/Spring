package kr.or.ddit.controller;

import java.io.File;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.dao.AttachDAO;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.PdsVO;
import kr.or.ddit.request.ModifyPdsRequest;
import kr.or.ddit.request.RegistPdsRequest;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.service.PdsService;

@Controller
@RequestMapping("/pds")
public class PdsBoardController {

	@Autowired
	private PdsService service;
	public void setService(PdsService service) {
		this.service = service;
	}
	
	
	@Autowired
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}


	@Resource(name = "fileUploadPath")
	private String fileUploadPath;

	@RequestMapping("/main")
	public String main() throws Exception {
		return "pds/main.open";
	}

	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv) throws Exception {
		String url = "pds/list.open";

		Map<String, Object> dataMap = service.getList(cri);

		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/registForm")
	public ModelAndView registForm(ModelAndView mnv) throws Exception {
		String url = "pds/regist.open";
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public void regist(RegistPdsRequest registReq, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		
		List<AttachVO> attachList = saveFile(registReq);

		PdsVO pds = registReq.toPdsVO();
		pds.setAttachList(attachList);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			service.regist(pds);

			out.println("<script>");
			out.println("alert('정상적으로 등록되었습니다.');");
			out.println("window.opener.location.href='" + request.getContextPath() + "/pds/list';");
			out.println("window.close();");
			out.println("</script>");
		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('등록에 실피했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}

	}

	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mnv, int pno) throws Exception {
		String url = "pds/detail.open";

		PdsVO pds = service.getPds(pno);
		
		// 파일명 재정의
		List<AttachVO> attachList  = pds.getAttachList();
		if(attachList!=null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getFileName().split("\\$\\$")[1];				
				attach.setFileName(fileName);
			}
		}
		

		mnv.addObject("pds", pds);
		mnv.setViewName(url);

		return mnv;
	}

	private List<AttachVO> saveFile(RegistPdsRequest registReq)throws Exception{
		String fileUploadPath = this.fileUploadPath;
		
		List<AttachVO> attachList = new ArrayList<AttachVO>();

		if (registReq.getUploadFile() != null) {
			for (MultipartFile multi : registReq.getUploadFile()) {
				String fileName = UUID.randomUUID().toString().replace("-", "") + "$$" + multi.getOriginalFilename();
				File target = new File(fileUploadPath, fileName);

				if (!target.exists()) {
					target.mkdirs();
				}

				multi.transferTo(target);

				AttachVO attach = new AttachVO();
				attach.setUploadPath(fileUploadPath);
				attach.setFileName(fileName);
				attach.setFileType(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());

				attachList.add(attach);
			}
		}
		return attachList;
	}
	
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(ModelAndView mnv,int pno) throws Exception {
		String url = "pds/modify.open";

		PdsVO pds = service.getPds(pno);
		
		// 파일명 재정의
		List<AttachVO> attachList  = pds.getAttachList();
		if(attachList!=null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getFileName().split("\\$\\$")[1];				
				attach.setFileName(fileName);
			}
		}

		mnv.addObject("pds", pds);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public void modifyPOST(ModifyPdsRequest modifyReq,
							 HttpSession session,
							 HttpServletResponse response) throws Exception {
		String fileUploadPath = this.fileUploadPath;
		
		// 삭제된 파일 삭제
		if(modifyReq.getDeleteFile()!=null && modifyReq.getDeleteFile().length > 0) {
			for(int ano : modifyReq.getDeleteFile()) {
				String fileName = attachDAO.selectAttachByAno(ano).getFileName();
				File deleteFile = new File(fileUploadPath,fileName);
				if(deleteFile.exists()) {
					attachDAO.deleteAttach(ano); //DB 삭제
					deleteFile.delete();
				}
			}
		}
		
		//추가 혹은 변경된 파일 저장
		List<AttachVO> attachList = saveFile(modifyReq);
		PdsVO pds = modifyReq.toPdsVO();
		
		for(AttachVO attach : attachList) {
			attach.setPno(pds.getPno());
		}
		
		pds.setAttachList(attachList);
		

		// DB에 해당 데이터 추가
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			service.modify(pds);

			out.println("<script>");
			out.println("alert('수정되었습니다.');");
			out.println("location.href='detail?pno=" + pds.getPno() + "';");
			out.println("</script>");

		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('수정이 실패했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}
		
	}
	@RequestMapping("/remove")
	public void remove(int pno, HttpServletResponse response) throws Exception{
		String fileUploadPath = this.fileUploadPath;
		
		List<AttachVO>attachList = attachDAO.selectAttachesByPno(pno);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			service.remove(pno);
			
			if(attachList!=null) {
				for(AttachVO attach : attachList) {
					File target = new File(attach.getUploadPath(),
							attach.getFileName());
					if(target.exists()) {
						target.delete();
					}
				}
			}
			out.println("<script>");
			out.println("alert('삭제되었습니다');");
			out.println("window.close();");
			out.println("window.opener.location.reload(true);");
			out.println("</script>");
		}catch(SQLException e) {
			out.println("<script>");
			out.println("alert('삭제가 실패했습니다.');");
			out.println("history.go(-1)");
			out.println("</script>");
		}
	}
}












