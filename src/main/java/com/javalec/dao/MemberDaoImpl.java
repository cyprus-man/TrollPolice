package com.javalec.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javalec.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberVO getMemberByEmailPw(String email,String pwd) {
		// TODO Auto-generated method stub
		MemberVO member = null;
		Map<String,String> login = new HashMap<String,String>();
		login.put("email", email);
		login.put("pwd", pwd);
		member = (MemberVO)sqlSession.selectOne("MemberNS.getMemberByEmailPw",login);
		return member;
	}

	@Override
	public MemberVO getMemberByEmail(String email) {
		// TODO Auto-generated method stub
		MemberVO member = null;
		member = (MemberVO) sqlSession.selectOne("MemberNS.getMemberByEmail", email);
		return member;
	}
	
	@Override
	public MemberVO getMemberByNickname(String nickname) {
		// TODO Auto-generated method stub
		MemberVO member = null;
		member = (MemberVO) sqlSession.selectOne("MemberNS.getMemberByNickname",nickname);
		return member;
	}

	@Override
	public void deleteMember(MemberVO member) {
		// TODO Auto-generated method stub
		sqlSession.delete("MemberNS.deleteMember", member);
	}

	@Override
	public void insertMember(MemberVO member) {
		// TODO Auto-generated method stub
		sqlSession.insert("MemberNS.insertMember", member);
	}

	@Override
	public void updateMember(MemberVO member) {
		// TODO Auto-generated method stub
		sqlSession.update("MemberNS.updateMember",member);
	}

}
