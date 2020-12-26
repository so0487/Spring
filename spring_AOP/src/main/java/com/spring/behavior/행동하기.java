package com.spring.behavior;


public class 행동하기 implements 행동{

	@Override
	public void 잠자기() {
		System.out.println("잠을 잡시다");
	}

	@Override
	public void 공부하기() {
		System.out.println("열공 열공!!");
	}

	@Override
	public void 밥먹기() {
		System.out.println("식샤를 합시다.");
	}

	@Override
	public void 데이트() {
		System.out.println("데이트 데이트~~");
	}

	@Override
	public void 운동() {
		System.out.println("운동 운동 헬창 헬창");
	}

	@Override
	public void 놀기() {
		System.out.println("놀자 놀자");
	}

	@Override
	public void 정신수양() {
		System.out.println("멘탈 멘탈 이너피스~~");
	}
	
}
