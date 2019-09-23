package com.system.mhotel.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.system.mhotel.dto.Member;

@Repository
public class MemberRepository {

	@Autowired
	SqlSession session;
	
	
	public int insertMember(Member member){
		int result = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			result = mapper.insertMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public Member selectMember(Member member){
		Member result = null;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			result = mapper.selectMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Member selectMemberInfo(Member member){
		Member result = null;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			result = mapper.selectMemberInfo(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int deleteMember(Member member){
		int result = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			result = mapper.deleteMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int updateMember(Member member){
		int result = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			result = mapper.updateMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateMemberHost(String mb_id){
		int result = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			result = mapper.updateMemberHost(mb_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
