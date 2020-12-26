package com.calcul.main;

import com.calcul.sum.Sumation;

public class Calculator {
	
	
	private Sumation sumation;
	
	public void setSumation(Sumation sumation) {
		this.sumation = sumation;
	}
	
	
	
	public Calculator(Sumation sumation) {
		super();
		this.sumation = sumation;
	}



	public Calculator() {
	}



	public int sum(int a, int b, int c) {
		return sumation.sum(a, b, c);
	}
}
