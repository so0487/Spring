package kr.or.ddit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.request.MemberModifyRequest;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping("/main")
	public String main() {
		return "member/main.open";
	}
	
	@RequestMapping("/list")
	public String memberList(SearchCriteria cri, Model model) throws Exception {
		String url = "member/list.open";

		Map<String, Object> dataMap = memberService.getSearchMemberList(cri);

		model.addAllAttributes(dataMap);

		return url;
	}
	
	@RequestMapping("/registForm")
	public String registForm()throws Exception{
		String url="member/regist.open";
		return url;
	}
	
	@Resource(name="picturePath")
	private String picturePath;
	
	
	@RequestMapping(value="/picture",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> picture(@RequestParam("pictureFile") MultipartFile multi, 
										  String oldPicture) throws Exception{
		ResponseEntity<String> entity=null;
		
		String result="";
		HttpStatus status=null;

		/* 파일저장확인 */
		if ((result=savePicture(oldPicture, multi))==null) {			
			result="업로드 실패했습니다.!";			
			status=HttpStatus.BAD_REQUEST;
		}else {			
			status=HttpStatus.OK;
			
		}
		
		entity = new ResponseEntity<String>(result,status);
		
		return entity;
		
	}
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public ResponseEntity<String> idCheck(String id)throws Exception{
		
		String result="";		
		HttpStatus status=HttpStatus.OK;
		
		try{
			MemberVO member = memberService.getMember(id);		
			if(member!=null){
				result="duplicated";	
			}
		}catch(SQLException e){
			status=HttpStatus.BAD_REQUEST;
		}
		
		return new ResponseEntity<String>(result,status);
	}
	
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public void regist(MemberVO member,String[] phone, HttpServletResponse response)throws Exception{
		
		String tempPhone="";
		for(String data : phone){
			//System.out.println(data);
			tempPhone+=data;
		}
		member.setPhone(tempPhone);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		String message="";
		try{
			memberService.regist(member);
			
			message="회원등록이 되었습니다.";
		}catch(SQLException e){
			e.printStackTrace();
			message="회원등록이 실패했습니다.";
		}
		
		out.println("<script>");
		out.println("alert('"+message+"');");		
		out.println("window.close();");
		out.println("</script>");
		
		out.close();
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(String id,ModelAndView mnv)throws Exception{
		String url="member/detail.open";
		
		MemberVO member=memberService.getMember(id);
		
		mnv.addObject("member",member);
		mnv.setViewName(url);
		
		return mnv;
	}
	

	@RequestMapping("/getPicture")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(String picture)throws Exception{
		InputStream in=null;
		ResponseEntity<byte[]> entity=null;
		String imgPath = this.picturePath;
		try{
			
			//in=new FileInputStream(imgPath+File.separator+picture);
			in=new FileInputStream(new File(imgPath,picture));
			
			entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(in),HttpStatus.CREATED);
		}catch(IOException e){
			e.printStackTrace();
			entity=new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		}finally{
			in.close();
		}
		return entity;
	}	
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String id, ModelAndView mnv)throws Exception{
		String url="member/modify.open";
		
		MemberVO member = memberService.getMember(id);
		
		mnv.addObject("member",member);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modify")
	public void modify(MemberModifyRequest modifyReq, HttpSession session,
					   HttpServletResponse response)throws Exception{
		
		MemberVO member = modifyReq.toParseMember();
		
		String fileName = savePicture(modifyReq.getOldPicture(), modifyReq.getPicture());
		member.setPicture(fileName);
		
		if(modifyReq.getPicture().isEmpty()) {
			member.setPicture(modifyReq.getOldPicture());
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			memberService.modify(member);
			
			//로그인한 사용자의 경우 수정된 정보로 session 업로드			
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			if (loginUser!=null && member.getId().equals(loginUser.getId())) {				
				session.setAttribute("loginUser", member);
			}
			
			out.println("<script>");
			out.println("alert('수정되었습니다.');");
			out.println("location.href='detail?id="+member.getId()+"';");
			out.println("</script>");
			
		}catch(SQLException e){
			e.printStackTrace();
			
			out.println("<script>");
			out.println("alert('수정에 실패했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");

		}
		
		
	}
	
	@RequestMapping("/remove")
	public ModelAndView remove(String id, 
							   HttpSession session,
							   ModelAndView mnv)throws Exception{
		String url="member/removeSuccess";
		
		//사진 삭제
		// 이미지 파일을 삭제
		MemberVO member = memberService.getMember(id);
		String fileName = member.getPicture();
		if(fileName!=null) {
			File file = new File(picturePath,fileName);
			if (file.exists()) {
				file.delete();
			}
		}
		
		//로그인한 유저인 경우 로그아웃.
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if (loginUser!=null && loginUser.getId().equals(member.getId())) {
			session.invalidate();
		}
		
		//회원삭제		
		memberService.remove(id);
		
		mnv.addObject("member",member);		
		mnv.setViewName(url);
		
		return mnv;		
	}
	
	@RequestMapping("/stop")
	public ModelAndView stop(String id, 
							 HttpSession session,
							 ModelAndView mnv)throws Exception{
		String url="member/stopSuccess";
				
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(id.equals(loginUser.getId())) {
			 url="member/stopFail";
		}else{
			memberService.disabled(id);
		
		}			
		
		mnv.addObject("id",id);
		mnv.setViewName(url);
		return mnv;
	}
	
	private String savePicture(String oldPicture, MultipartFile multi)throws Exception{
		String fileName=null;
		
		/* 파일유무확인 */
		if (!(multi==null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {			
				
			/* 파일저장폴더설정 */
			String uploadPath = picturePath;
			fileName = UUID.randomUUID().toString().replace("-", "")+".jpg";			
			File storeFile = new File(uploadPath,fileName);
			
			// local HDD 에 저장.
			multi.transferTo(storeFile);
								
			if(!oldPicture.isEmpty()){
				File oldFile = new File(uploadPath,oldPicture);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}			
	
		}
			
		
		return fileName;
	}
}







