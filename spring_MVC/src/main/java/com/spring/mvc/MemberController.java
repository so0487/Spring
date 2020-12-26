package com.spring.mvc;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dto.MemberVO;

@Controller()
@RequestMapping("/member/")
public class MemberController {

	@RequestMapping(value = "registForm", method = RequestMethod.GET)
	/*
	 public String registForm() throws Exception{ 
	  
	  		String url = "member/registForm"; 
	  
	  		return url;
	  	}
	 */

	// 방법2
	public void registForm() throws Exception {
		
		
	}

	
	
	
	
	
	
	
	//id,pwd값 가져오기	
	
	
	//HTTPServlet방식
	
	
	/*
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String regist(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
	
		String url = "member/registSuccess";
	
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberVO member = new MemberVO();
		
		member.setId(id);
		member.setPwd(pwd);
		
		 
		
		request.setAttribute("member",member);
		
		//memberService.regist(member);
		
		return url;
	}
	
	*/
	
	
	
	
	
	
	
	//spring mvc 패턴 작업
	
	/*
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String regist(HttpServletRequest request, MemberVO member)
			throws IOException, ServletException {
		String url = "member/registSuccess";
		
		request.setAttribute("member",member);

		return url;

	}
	*/
	
	
	
	

	
	
	//ModelAndView
	
	/*
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public ModelAndView regist(MemberVO member, ModelAndView modelnview)
			throws IOException, ServletException {
		
		modelnview.addObject("member",member);
		modelnview.setViewName("member/registSuccess");
		
		return modelnview;
		
	}
	
	
	*/
	
	
	
	
	
	
	
	
	
	//RegistMemberRequest
	
	/*
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public ModelAndView regist(RegistMemberRequest registReq, ModelAndView modelnview)
			throws IOException, ServletException {
		
		MemberVO member = registReq.toMemberVO();
		
		modelnview.addObject("member",member);
		modelnview.setViewName("member/registSuccess");
		
		return modelnview;
		
	}
	
	*/
	
	
	
	
	
	
	
	
	//RegistMemberRequest2(@RequestParam)
	
	/*
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public ModelAndView regist(MemberVO member, @RequestParam("password")String pwd, ModelAndView modelnview)
			throws IOException, ServletException {
		
		member.setPwd(pwd);
		
		modelnview.addObject("member",member);
		modelnview.setViewName("member/registSuccess");
		
		return modelnview;
		
	}
	*/
	
	
	
	
	
	
	
	//RegistMemberRequest3(@RequestParam, defaultValue : 파라미터가 존재하면 해당파라미터, 존재하지 않으면 디폴트 값)
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public ModelAndView regist(MemberVO member, @RequestParam("password")String pwd, @RequestParam(name="name",defaultValue="Gueset")String name, ModelAndView modelnview)
			throws IOException, ServletException {
		
		member.setPwd(pwd);
		member.setName(name);
		
		modelnview.addObject("member",member);
		modelnview.setViewName("member/registSuccess");
		
		return modelnview;
		
	}
	
	

}
