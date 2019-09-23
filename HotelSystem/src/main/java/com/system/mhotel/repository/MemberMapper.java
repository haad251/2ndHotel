package com.system.mhotel.repository;

import com.system.mhotel.dto.Member;

public interface MemberMapper {
	public int insertMember(Member member);
	public Member selectMember(Member member);
	public Member selectMemberInfo(Member member);
	public int deleteMember(Member member);
	public int updateMember(Member member);
	public int updateMemberHost(String mb_id);
}
