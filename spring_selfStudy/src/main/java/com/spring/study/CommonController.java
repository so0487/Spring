package com.spring.study;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class CommonController {
	@RequestMapping("/common/loginForm")
	public String loginForm(HttpServletResponse response) throws Exception{
		String url = "common/loginForm";
		
		return url;
	}
}
