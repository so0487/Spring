package kr.or.ddit.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.MenuVO;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.MenuService;

@Controller
@RequestMapping("/")
public class CommonController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MenuService menuService;

	
	
	@RequestMapping("main")
	public String main()throws Exception{
		String url="common/main.open";
		return url;
	}
	
		
	 
	@RequestMapping("common/loginForm")
	public String loginForm(String error,HttpServletResponse response) throws Exception {
		String url = "common/loginForm";
		
		if(error.equals("1")) {
			response.setStatus(302);
		}
		return url;
	}
	
	@RequestMapping("/common/loginTimeOut")
	public void loginTimeOut(HttpServletRequest request, HttpServletResponse response)throws Exception{		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('세션이 만료되었습니다.\\n다시 로그인 하세요!');");
		out.println("location.href='"+request.getContextPath()+"';");
		out.println("</script>");
	}
	
	@RequestMapping("/common/loginExpired")
	public void loginExpired(HttpServletRequest request, HttpServletResponse response)throws Exception{
				
			
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('중복 로그인이 확인되었습니다.\\n다시 로그인하면 다른 장치에서 로그인은 취소됩니다.!');");
		out.println("location.href='"+request.getContextPath()+"';");
		out.println("</script>");
	}
	
	
	/*@RequestMapping(value = "common/login", method = RequestMethod.POST)
	public String login(String id, String pwd, String rememberMe, HttpServletResponse response, HttpSession session)
			throws Exception {

		String url = "redirect:/index.do";

		try {
			memberService.login(id, pwd);
			session.setAttribute("loginUser", memberService.getMember(id));

			// cookie 발행
			if (rememberMe != null && rememberMe.equals("check")) {
				Cookie cookie = new Cookie("loginUser", id);
				cookie.setMaxAge(3 * 24 * 60 * 60);
				cookie.setPath("/");
				response.addCookie(cookie);
			}

		} catch (NotFoundIDException | InvalidPasswordException e) {
			// e.printStackTrace();
			url = "redirect:/";
			session.setAttribute("msg", e.getMessage());
		}
		return url;
	}
	
	@RequestMapping(value = "common/logout", method = RequestMethod.GET)
	public String logout(HttpSession session)throws Exception{
		String url="redirect:/";
		
		session.invalidate();
		
		return url;
	}
	*/
	
	
	@RequestMapping(value = "common/subMenu", method = RequestMethod.GET)
	@ResponseBody
	public List<MenuVO> subMenu(String mCode) throws Exception {

		List<MenuVO> subMenu = menuService.getSubMenuList(mCode);

		return subMenu;
	}

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String indexPage(String mCode, Model model) throws Exception {
		String url = "common/indexPage.page";

		if (mCode == null)
			mCode = "M000000";

		try {
			List<MenuVO> menuList = menuService.getMainMenuList();
			MenuVO menu = menuService.getMenuByMcode(mCode);

			model.addAttribute("menuList", menuList);
			model.addAttribute("menu", menu);
			
		} catch (SQLException e) {
			e.printStackTrace();
			url = null;
		}
		return url;
	}
	
	
	@RequestMapping("common/loginUser")
	@ResponseBody
	public ResponseEntity<String> getLoginUser(HttpSession session)throws Exception{
		ResponseEntity<String> entity=null;
		
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		if(member!=null) {
			entity=new ResponseEntity<String>(member.getId(),HttpStatus.OK);
		}else {
			entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;		
	}
}








