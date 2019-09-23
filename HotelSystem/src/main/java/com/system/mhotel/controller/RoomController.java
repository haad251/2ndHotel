package com.system.mhotel.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.system.mhotel.dto.Booking;
import com.system.mhotel.dto.Chat;
import com.system.mhotel.dto.FileVO;
import com.system.mhotel.dto.Hotel;
import com.system.mhotel.dto.Review;
import com.system.mhotel.dto.Room;
import com.system.mhotel.repository.MemberRepository;
import com.system.mhotel.repository.RoomRepository;

@Controller
public class RoomController {

	@Autowired
	RoomRepository repo;
	@Autowired
	MemberRepository memberrepo;
	
	final static String UPLOADPATH = "D:/File/";

	@RequestMapping(value = "/goAdmin", method = RequestMethod.GET)
	public String goAdmin(HttpSession session,Model model) {
		Hotel hotel = new Hotel();
		hotel.setHt_id((String)session.getAttribute("hotelId"));
		HashMap<String,String> hotelMap = repo.selectHotel(hotel);
		List<HashMap<String,String>> fileList = repo.selectAllFile(hotel);
		List<HashMap<String,String>> roomList = repo.selectAllRoom(hotel);
		List<HashMap<String,String>> bList = repo.selectAllBookingByHotel(hotel);	
		List<HashMap<String,String>> cmList = repo.selectAllChatByHotel(hotel);
		
		model.addAttribute("hotelMap",hotelMap);
		model.addAttribute("fileList",fileList);
		model.addAttribute("roomList",roomList);
		model.addAttribute("bList",bList);
		model.addAttribute("cmList",cmList);
		return "admin";
	}
	
	@RequestMapping(value = "/goChatroom", method = RequestMethod.GET)
	public String goChatroom(String mb_id,String ht_id,Model model) {
		model.addAttribute("mb_id",mb_id);
		model.addAttribute("ht_id",ht_id);
		return "chatroom";
	}

	@RequestMapping(value = "/goHoteldetail", method = RequestMethod.GET)
	public String goHoteldetail(Hotel hotel,Model model) {
		HashMap<String,String> hotelMap = repo.selectHotel(hotel);
		List<HashMap<String,String>> fileList = repo.selectAllFile(hotel);
		List<HashMap<String,String>> roomList = repo.selectAllRoom(hotel);
		List<HashMap<String,String>> reviewList = repo.selectAllReview(hotel);
		String hotelRate = repo.selectHotelRate(hotel);
		if(hotelRate==null) hotelRate = "0";
			
		model.addAttribute("hotelRate",hotelRate);
		model.addAttribute("hotelMap",hotelMap);
		model.addAttribute("fileList",fileList);
		model.addAttribute("roomList",roomList);
		model.addAttribute("reviewList",reviewList);
		
		return "hoteldetail";
	}
	
	@RequestMapping(value = "/goNewReview", method = RequestMethod.GET)
	public String goNewReview(Booking booking,String ht_id, Model model) {
		model.addAttribute("mb_id",booking.getMb_id());
		model.addAttribute("bk_id",booking.getBk_id());
		model.addAttribute("ht_id",ht_id);
		return "newreview";
	}
	
	@RequestMapping(value = "/insertRoom", method = RequestMethod.POST)
	public String insertRoom(Room room,HttpSession session) {
		room.setHt_id((String)session.getAttribute("hotelId"));
		int result = repo.insertRoom(room); 
		return "redirect:/goAdmin";
	}
	
	@RequestMapping(value = "/updateRoom", method = RequestMethod.POST)
	public String updateRoom(Room room) {
		int result = repo.updateRoom(room); 
		return "redirect:/goAdmin";
	}
	
	@RequestMapping(value = "/insertHotel", method = RequestMethod.POST)
	public String insertHotel(Hotel hotel,HttpSession session,FileVO fvo,MultipartFile uploadFile) {
		if(hotel.getHt_meal()==null) {
			hotel.setHt_meal("0");
		}else hotel.setHt_meal("1");
		if(hotel.getHt_park()==null) {
			hotel.setHt_park("0");
		}else hotel.setHt_park("1");
		
		hotel.setMb_id((String)session.getAttribute("loginId"));
		int result = repo.insertHotel(hotel);
		if(result==1){
			session.setAttribute("hotelId", hotel.getHt_id());
			memberrepo.updateMemberHost((String)session.getAttribute("loginId"));
			
			if (!(uploadFile.isEmpty() || uploadFile == null || uploadFile.getSize() == 0)) {
				String file_org = uploadFile.getOriginalFilename();
				Date date = new Date();
				String file_sav = date.getTime() + file_org;
				try {
					uploadFile.transferTo(new File(UPLOADPATH + file_sav));
					fvo.setFile_org(file_org);
					fvo.setFile_sav(file_sav);
					fvo.setFile_type("main");
					repo.insertFile(fvo);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return "redirect:/goAdmin";
		}
		else return "newhost";
	}
	
	
	@RequestMapping(value = "/updateHotel", method = RequestMethod.POST)
	public String updateHotel(Hotel hotel) {
		repo.updateHotel(hotel);
		return "redirect:/goAdmin";
	}
	
	@RequestMapping(value = "/searchHotel", method = RequestMethod.POST)
	public String searchHotel(Model model,Booking booking,String keyword, String ht_meal, String ht_park) {
		HashMap<String,String> search = new HashMap<String,String>();
		search.put("keyword",keyword);
//		search.put("bk_checkin",booking.getBk_checkin());
//		search.put("bk_checkout", booking.getBk_checkout());
		search.put("bk_cnt",booking.getBk_cnt());
		search.put("ht_meal",ht_meal);
		search.put("ht_park",ht_park);
		List<HashMap<String,String>> hotelList = repo.searchHotel(search);
		model.addAttribute("hotelList", hotelList);
		return "home";
	}
	
	
	
	@RequestMapping(value = "/goHome", method = RequestMethod.GET)
	public String goHome(Model model) {
		List<HashMap<String,String>> hotelList = repo.selectAllHotel();
		model.addAttribute("hotelList", hotelList);
		return "home";
	}
	
	@RequestMapping(value = "/insertFile", method = RequestMethod.POST)
	public String insertFile(FileVO fvo,HttpSession session,MultipartFile uploadFile) {
		
		if (!(uploadFile.isEmpty() || uploadFile == null || uploadFile.getSize() == 0)) {
			String file_org = uploadFile.getOriginalFilename();
			Date date = new Date();
			String file_sav = date.getTime() + file_org;

			try {
				uploadFile.transferTo(new File(UPLOADPATH + file_sav));
			
				fvo.setFile_org(file_org);
				fvo.setFile_sav(file_sav);
				fvo.setHt_id((String)session.getAttribute("hotelId"));
				if(fvo.getFile_type()==null){
					fvo.setFile_type("info");
				}
				repo.insertFile(fvo);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/goAdmin";
	}
	
	@RequestMapping(value = "/insertBooking", method = RequestMethod.POST)
	public String insertBooking(String ht_id, Booking booking,HttpSession session,RedirectAttributes redirectAttributes) {
		System.out.println(booking);
		repo.insertBooking(booking);
	    redirectAttributes.addAttribute("ht_id",ht_id);
		return "redirect:/goHoteldetail";
	}
	

	@RequestMapping(value = "/switchBooking", method = RequestMethod.POST)
	public String switchBooking(Booking booking) {
		repo.switchBooking(booking);
		return "redirect:/goAdmin";
	}
	
	
	@RequestMapping(value = "/deleteBooking", method = RequestMethod.POST)
	public String deleteBooking(Booking booking,String forhotel) {
		repo.deleteBooking(booking);
		if(forhotel.equals("true")){
			return "redirect:/goAdmin";
		}
		return "redirect:/goMyReservation";
		
		
	}

	
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
	public @ResponseBody String insertReview(Review review) {
		repo.insertReview(review);
		return "ok";
	}
	
	
	@RequestMapping(value = "/selectDate", method = RequestMethod.POST)
	public @ResponseBody List<String> selectDate(Room room) throws ParseException {
		List<HashMap<String,String>> dateList = repo.selectDate(room);
		ArrayList<String> dates = new ArrayList<String>();
        Calendar c = Calendar.getInstance();
        
		for (HashMap<String, String> book : dateList) {
			SimpleDateFormat form = new SimpleDateFormat("yyyy-M-dd");
			Date in = form.parse(book.get("BK_CHECKIN"));
			Date out = form.parse(book.get("BK_CHECKOUT"));
			c.setTime(out);
			c.add(Calendar.DATE,-1);
			out = c.getTime();
			
			Date temp = in;
			while(temp.compareTo(out) <= 0){
		            dates.add(form.format(temp));
		            c.setTime(temp);
		            c.add(Calendar.DATE, 1); 
		            temp = c.getTime();
			}
		}
		return dates;
	}
	
	@RequestMapping(value = "/getChatList", method = RequestMethod.POST)
	public @ResponseBody List<HashMap<String,String>> getChatList(Model model,Chat chat) {
		List<HashMap<String,String>> chatList = repo.selectAllChat(chat);
		return chatList;
	}
	
//	@RequestMapping(value = "/getChatList", method = RequestMethod.POST)
//	public @ResponseBody List<HashMap<String,String>> getChatList(Model model,Chat chat) {
//		List<HashMap<String,String>> chatList = repo.selectAllChat(chat);
//		System.out.println(chatList);
//		return chatList;
//	}
	
	
	@RequestMapping(value = "/insertChat", method = RequestMethod.POST)
	public @ResponseBody String insertChat(Chat chat) {
		int result = repo.insertChat(chat);
		return "ok";
	}
	
	
}
