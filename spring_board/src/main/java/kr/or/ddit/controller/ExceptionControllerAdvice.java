package kr.or.ddit.controller;

import java.sql.SQLException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionControllerAdvice {
	
	@ExceptionHandler(SQLException.class)
	public ModelAndView sqlEceptionPage(Exception e) {
		e.printStackTrace();
		ModelAndView modelnView = new ModelAndView();
		
		modelnView.setViewName("/error/db_error.open");
		modelnView.addObject("exception",e);
		
		return modelnView;
	}
	@ExceptionHandler(Exception.class)
	public ModelAndView ExceptionPage(Exception e) {
		e.printStackTrace();
		ModelAndView modelnView = new ModelAndView();
		
		modelnView.setViewName("/error/500_error.open");
		modelnView.addObject("exception",e);
		
		return modelnView;
	}
	
	
}
