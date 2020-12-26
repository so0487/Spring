package kr.or.ddit.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.dto.NoticeVO;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeBoardController {
	@Autowired
	private NoticeService noticeService;

	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	@RequestMapping("/main")
	public String main() throws Exception {
		return "notice/main.open";
	}

	@RequestMapping("list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv) throws SQLException {
		String url = "notice/list.open";

		Map<String, Object> dataMap = noticeService.getNoticeList(cri);

		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);

		return mnv;

	}
	
	@RequestMapping("/registForm")
	public String registForm()throws Exception{
		String url = "notice/registForm.open";
		
		return url;
	}
	
	@RequestMapping("/regist")
	public void regist(NoticeVO notice, HttpServletResponse response) throws Exception{
		noticeService.write(notice);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("window.opener.location.reload(true);window.close();");
		out.println("</script>");
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(int nno, @ModelAttribute("cri") SearchCriteria cri, ModelAndView mnv) throws Exception{
		String url = "notice/detail.open";
		
		NoticeVO notice = noticeService.getNotice(nno);
		
		mnv.addObject("notice",notice);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(int nno, @ModelAttribute("cri")SearchCriteria cri, ModelAndView mnv)throws Exception{
		String url = "notice/modify.open";
		
		NoticeVO notice = noticeService.getNotice(nno);
		
		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public void modifyPost(NoticeVO notice, HttpServletResponse response) throws Exception {
		noticeService.modify(notice);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();");
		out.println("location.href='detail?nno=" + notice.getNno() + "';");
		out.println("</script>");
	}
	   
	   
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public void remove(int nno, HttpServletResponse response) throws Exception{
		noticeService.remove(nno);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();window.close();");
		out.println("</script>");
	}
}
