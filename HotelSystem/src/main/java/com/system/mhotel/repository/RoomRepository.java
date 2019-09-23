package com.system.mhotel.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.system.mhotel.dto.Booking;
import com.system.mhotel.dto.Chat;
import com.system.mhotel.dto.FileVO;
import com.system.mhotel.dto.Hotel;
import com.system.mhotel.dto.Review;
import com.system.mhotel.dto.Room;

@Repository
public class RoomRepository {

	@Autowired
	SqlSession session;
	
	
	public int insertHotel(Hotel hotel){
		int result = 0;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.insertHotel(hotel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public HashMap<String,String> selectHotel(Hotel hotel){
		HashMap<String,String> result = null;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.selectHotel(hotel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Hotel selectHotelByMbid(String mb_id){
		Hotel result = null;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.selectHotelByMbid(mb_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
	public List<HashMap<String,String>> selectAllHotel(){
		List<HashMap<String,String>> result = null;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.selectAllHotel();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<HashMap<String,String>> searchHotel(HashMap<String,String> search){
		List<HashMap<String,String>> result = null;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.searchHotel(search);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
	public String selectHotelRate(Hotel hotel){
		String result = null;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.selectHotelRate(hotel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
	
	public List<HashMap<String,String>> selectAllReview(Hotel hotel){
		List<HashMap<String,String>> result = null;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.selectAllReview(hotel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
//	
//	public int deleteHotel(Hotel hotel){
//		int result = 0;
//		try {
//			RoomMapper mapper = session.getMapper(RoomMapper.class);
//			result = mapper.deleteHotel(hotel);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//		
//	}
	
	public int updateHotel(Hotel hotel){
		int result = 0;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.updateHotel(hotel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int switchBooking(Booking booking){
		int result = 0;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.switchBooking(booking);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	
	
	public int insertRoom(Room room){
		int result = 0;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.insertRoom(room);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Room selectRoom(Room room){
		Room result = null;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.selectRoom(room);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<HashMap<String,String>> selectAllRoom(Hotel hotel){
		List<HashMap<String,String>> result = null;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.selectAllRoom(hotel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteRoom(Room room){
		int result = 0;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.deleteRoom(room);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	public int updateRoom(Room room){
		int result = 0;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.updateRoom(room);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int insertFile(FileVO fvo){
		System.out.println("파일인서트dao");
		int result = 0;
		try{
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.insertFile(fvo);
			}catch(Exception e ){
				e.printStackTrace();
		}		
		return result;	
	}
	
	public List<HashMap<String,String>> selectAllFile(Hotel hotel){
		List<HashMap<String,String>> result=null;
		try{
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.selectAllFile(hotel);
		}catch(Exception e ){
				e.printStackTrace();
		}		
		return result;
	}
	
	
	public int insertBooking(Booking booking){
		int result = 0;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.insertBooking(booking);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteBooking(Booking booking){
		int result = 0;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.deleteBooking(booking);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<HashMap<String,String>> selectAllBooking(String mb_id){
		List<HashMap<String,String>> result = null;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.selectAllBooking(mb_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<HashMap<String,String>> selectAllBookingByHotel(Hotel hotel){
		List<HashMap<String,String>> result = null;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.selectAllBookingByHotel(hotel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<HashMap<String,String>> selectDate(Room room){
		List<HashMap<String,String>> result = null;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.selectDate(room);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertReview(Review review){
		int result = 0;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.insertReview(review);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertChat(Chat chat){
		int result = 0;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.insertChat(chat);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<HashMap<String,String>> selectAllChat(Chat chat){
		List<HashMap<String,String>> result = null;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.selectAllChat(chat);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<HashMap<String,String>> selectAllChatByHotel(Hotel hotel){
		List<HashMap<String,String>> result = null;
		try {
			RoomMapper mapper = session.getMapper(RoomMapper.class);
			result = mapper.selectAllChatByHotel(hotel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
