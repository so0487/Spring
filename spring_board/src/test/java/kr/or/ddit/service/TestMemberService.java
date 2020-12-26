package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.dao.MemberDAO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.exception.InvalidPasswordException;
import kr.or.ddit.exception.NotFoundIDException;
import kr.or.ddit.request.SearchCriteria;

public class TestMemberService {
	

	private MemberDAO memberDAO;
	
	private MemberServiceImpl service;
	
	@Before
	public void init(){
		service = new MemberServiceImpl();
		service.setMemberDAO(new MockMemberDAO());		
	}
	

	@Test
	public void testGetList()throws SQLException{
		
		SearchCriteria cri = new SearchCriteria();
				
		List<MemberVO> memberList = service.getMemberList(cri);
		
		Assert.assertEquals(2,memberList.size());
	}
	
	@Test
	public void testLogin()throws SQLException{
		String testID = "kkk";
		String testPWD ="kkk";
		
		try{
			service.login(testID, testPWD);
			
			Assert.assertEquals(1,0);
		}catch(NotFoundIDException e){
			Assert.assertEquals(1,1);
		}catch(InvalidPasswordException e){
			Assert.assertEquals(1,0);
		}
		
		testID="mimi";
		try{
			service.login(testID,testPWD);
			
			Assert.assertEquals(1,0);
		}catch(InvalidPasswordException e){
			Assert.assertEquals(1,1);
		}catch(NotFoundIDException e){
			Assert.assertEquals(1,2);
		}
		
		testPWD="1234";
		try{
			service.login(testID,testPWD);
			
			Assert.assertEquals(1,1);
		}catch(InvalidPasswordException e){
			Assert.assertEquals(1,3);
		}catch(NotFoundIDException e){
			Assert.assertEquals(1,4);
		}
		
	}
}











