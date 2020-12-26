package com.spring.final_test;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		
		//화면 호출
		
		
		//User메인 홈페이지
		return "UserMain";
		
		
		//tag설명
		//return "tagInfo";
		
		
		
		//mainTest(내부 전체 페이지 태스트)
		//return "mainTest";
		
		
		
		//로그인 화면
		//return "loginForm";
		
		
		//회원가입
		//return "regist";
		
				
		//캘린더
		//return "calendar";
		
		
		//미디어 플레이어
		//return "mediaPlayer";
		
		//테이블
		//return "table";
		
		//차트
		//return "chart";
		
		
		//mailList
		//return "mailList";
		
		//mailDetail
		//return "mailDetail";
		
		//ToDoList
		//return "todoList";
		
		
		//modal창
		//return "modal";
		
		//tab
		//return "tab";
		
		
	}

}
