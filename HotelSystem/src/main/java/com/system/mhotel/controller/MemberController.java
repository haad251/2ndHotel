package com.system.mhotel.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.system.mhotel.dto.Hotel;
import com.system.mhotel.dto.Member;
import com.system.mhotel.repository.MemberRepository;
import com.system.mhotel.repository.RoomRepository;

@Controller
public class MemberController {

	@Autowired
	MemberRepository repo;
	@Autowired
	RoomRepository roomrepo;
	
	@RequestMapping(value = "/goMyProfile", method = RequestMethod.GET)
	public String goMyProfile(HttpSession session,Model model) {
		Member me = new Member();
		me.setMb_id((String)session.getAttribute("loginId"));
		Member result = repo.selectMemberInfo(me);
		model.addAttribute("myinfo",result);
		return "myprofile";
	}
	
	@RequestMapping(value = "/goMypage", method = RequestMethod.GET)
	public String goMypage() {
		return "mypage";
	}
	
	@RequestMapping(value = "/goMyReservation", method = RequestMethod.GET)
	public String goMyReservation(HttpSession session,Model model) {
		String mb_id = (String)session.getAttribute("loginId");
		List<HashMap<String,String>> bookingList = roomrepo.selectAllBooking(mb_id);
		model.addAttribute("bList",bookingList);
		System.out.println(bookingList);
		return "myreservation";
	}
	
	@RequestMapping(value = "/goNewHost", method = RequestMethod.GET)
	public String goNewHost() {
		return "newhost";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member member,HttpSession session) {
		Member result = repo.selectMember(member); 
		if(result!=null){
			session.setAttribute("loginId",result.getMb_id());
			
			if(result.getMb_status().equals("host")){
			Hotel hotel = roomrepo.selectHotelByMbid(result.getMb_id());
				if(hotel!=null){
					session.setAttribute("hotelId",hotel.getHt_id());
				}
			}
		}
		
		return "redirect:/goHome";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/goHome";
	}
	
	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
	public String insertMember(Member member,HttpSession session) {
		System.out.println(member);
		int result = repo.insertMember(member);
		if(result==1){
			session.setAttribute("loginId",member.getMb_id());
		}
		return "redirect:/goHome";
	}
	
	@RequestMapping(value = "/deleteMember", method = RequestMethod.POST)
	public String deleteMember(Member member) {
		int result = repo.deleteMember(member);
		if(result==1){
			return "redirect:/logout";
		}
		else return "redirect:/goMyProfile";
	}
	
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(Member member) {
		System.out.println(member);
		repo.updateMember(member);
		return "redirect:/goMyProfile";
	}
	

}
