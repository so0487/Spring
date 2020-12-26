package com.spring.advice;

import org.aspectj.lang.JoinPoint;

public class 양치하기 {
	public void chikachika(JoinPoint joinPoint) throws Exception{
		System.out.println("치카치카");
	}
}
