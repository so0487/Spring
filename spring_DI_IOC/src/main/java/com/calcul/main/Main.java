package com.calcul.main;

import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {
	
	public static void main(String[] args) {
		
/*		Calculator cal = new Calculator();
		cal.setSumation(new SumationImpl2());*/
		
		ApplicationContext ctx = 
				new GenericXmlApplicationContext("classpath:application-context.xml");
		Calculator cal = ctx.getBean("calculator",Calculator.class);
		
		

		Scanner scann = new Scanner(System.in);
		
		int firstNum = -1;
		int secondNum = -1;
		int thirdNum = -1;
		
		System.out.println("세 정수의 합을 계산합니다.");
		System.out.println("첫번째 정수를 입력하세요");
		firstNum = Integer.parseInt(scann.nextLine().trim());
		
		System.out.println("두번째 정수를 입력하세요");
		secondNum = Integer.parseInt(scann.nextLine().trim());
		
		System.out.println("세번째 정수를 입력하세요");
		thirdNum = Integer.parseInt(scann.nextLine().trim());
		
		System.out.println("세 정수를 더한 결과입니다.");
		System.out.println(cal.sum(firstNum, secondNum, thirdNum));
	}
}
