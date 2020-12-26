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

import kr.or.ddit.dto.BoardVO;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.service.BoardService;

@Controller
@RequestMapping("/board")
public class FreeBoardController {
	
	@Autowired
	private BoardService service;
	public void setService(BoardService service){
		this.service=service;
	}
	
	@RequestMapping("/main")
	public String main()throws Exception{
		return "board/main.open";
	}
	
	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv)throws SQLException{
		String url="board/list.open";		
		
		Map<String,Object> dataMap = service.getBoardList(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/registForm")
	public String registForm(){
		String url="board/registBoard.open";
		
		return url;
	}
	
	@RequestMapping("/regist")
	public void regist(BoardVO board,HttpServletResponse response)throws Exception{
		service.write(board);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload(true);window.close();");
		out.println("</script>");
	}
	

	@RequestMapping("/detail")
	public ModelAndView detail(int bno, 
							   @ModelAttribute("cri") SearchCriteria cri,
							   ModelAndView mnv )
									throws SQLException{
		String url="board/detailBoard.open";		
		
		BoardVO board = service.getBoard(bno);
					
		mnv.addObject("board",board);		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(int bno,
			    				   @ModelAttribute("cri") SearchCriteria cri,
			    				   ModelAndView mnv)
										throws SQLException{
		String url="board/modifyBoard.open";
		
		BoardVO board = service.getBoard(bno);
		
		mnv.addObject("board",board);		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public void modifyPost(BoardVO board,HttpServletResponse response)
														throws Exception{
		
		service.modify(board);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();");
		out.println("location.href='detail?bno="+board.getBno()+"';");
		out.println("</script>");
	}
	

	@RequestMapping(value="/remove",method=RequestMethod.POST)
	public void remove(int bno,
					   @ModelAttribute("cri") SearchCriteria cri,
					   HttpServletResponse response) throws Exception{
		
		service.remove(bno);		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();window.close();");
		out.println("</script>");
	}
}










