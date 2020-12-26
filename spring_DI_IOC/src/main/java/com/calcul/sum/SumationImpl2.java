package com.calcul.sum;

public class SumationImpl2 implements Sumation{

	@Override
	public int sum(int a, int b) {
		return a+b+b;
	}

	@Override
	public int sum(int a, int b, int c) {
		return a+b+c+c;
	}

	@Override
	public int sum(int a, int b, int c, int d) {
		return a+b+c+d+d;
	}

}
