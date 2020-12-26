package com.calcul.sum;

public class SumationImpl implements Sumation {

	@Override
	public int sum(int a, int b) {
		return a+b;
	}

	@Override
	public int sum(int a, int b, int c) {
		return a+b+c;
	}

	@Override
	public int sum(int a, int b, int c, int d) {
		return a+b+c+d;
	}

}
