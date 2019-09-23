package com.system.mhotel.repository;

import java.util.HashMap;
import java.util.List;

import com.system.mhotel.dto.Booking;
import com.system.mhotel.dto.Chat;
import com.system.mhotel.dto.FileVO;
import com.system.mhotel.dto.Hotel;
import com.system.mhotel.dto.Review;
import com.system.mhotel.dto.Room;

public interface RoomMapper {
	public int insertHotel(Hotel hotel);
	public HashMap<String,String> selectHotel(Hotel hotel);
	public Hotel selectHotelByMbid(String mb_id);
	public List<HashMap<String,String>> selectAllHotel();
	public List<HashMap<String,String>> searchHotel(HashMap<String,String> search);
	public int updateHotel(Hotel hotel);
	
	
	public int insertRoom(Room room);
	public Room selectRoom(Room room);
	public List<HashMap<String,String>> selectAllRoom(Hotel hotel);
	public int deleteRoom(Room room);
	public int updateRoom(Room room);
	
	public int insertBooking(Booking booking);
	public Booking selectBooking(Booking booking);
	public List<HashMap<String,String>> selectAllBooking(String mb_id);
	public List<HashMap<String,String>> selectAllBookingByHotel(Hotel hotel);
	public int deleteBooking(Booking booking);
	public int switchBooking(Booking booking);

	
	public int insertReview(Review review);
	public List<HashMap<String,String>> selectAllReview(Hotel hotel);
	public int deleteReview(Review review);
	public int updateReview(Review review);

	
	public int insertFile(FileVO fvo);
	public List<HashMap<String,String>> selectAllFile(Hotel hotel);
	
	public List<HashMap<String,String>> selectDate(Room room);
	public String selectHotelRate(Hotel hotel);
	
	public int insertChat(Chat chat);
	public List<HashMap<String,String>> selectAllChat(Chat chat);
	public List<HashMap<String,String>> selectAllChatByHotel(Hotel hotel);
	public int updateBookingStatus();
}
