package com.bookshop01.ticket.vo;

public class TicketVO {
	private int movie_id; //��ȭ��ȣ
	private String ticket_number; //���� �Ϸù�ȣ
	private int ticket_number_code; //���Ź�ȣ
	private int ticket_adult; //���� �Ϲ�
	private int ticket_child; //û�ҳ� �Ϲ�
	private int ticket_adult_night; //���� �ɾ�
	private int ticket_child_night; //û�ҳ� �ɾ�
	private int ticket_adult_morning; //���� ����
	private int ticket_child_morning; //û�ҳ� ����
	private String ticket_start_time; //�󿵽��۽ð�
	private String ticket_end_time; //�󿵳��ð�
	private String ticket_movie_day; //����
	private String room_number; //�󿵰���ȣ
	private String seat_number; //�¼��̸�
	private String ticket_reservation_date; //���Žð�
	private String member_id; //ȸ�����̵�
	
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getTicket_number() {
		return ticket_number;
	}
	public void setTicket_number(String ticket_number) {
		this.ticket_number = ticket_number;
	}
	public int getTicket_number_code() {
		return ticket_number_code;
	}
	public void setTicket_number_code(int ticket_number_code) {
		this.ticket_number_code = ticket_number_code;
	}
	public int getTicket_adult() {
		return ticket_adult;
	}
	public void setTicket_adult(int ticket_adult) {
		this.ticket_adult = ticket_adult;
	}
	public int getTicket_child() {
		return ticket_child;
	}
	public void setTicket_child(int ticket_child) {
		this.ticket_child = ticket_child;
	}
	public int getTicket_adult_night() {
		return ticket_adult_night;
	}
	public void setTicket_adult_night(int ticket_adult_night) {
		this.ticket_adult_night = ticket_adult_night;
	}
	public int getTicket_child_night() {
		return ticket_child_night;
	}
	public void setTicket_child_night(int ticket_child_night) {
		this.ticket_child_night = ticket_child_night;
	}
	public int getTicket_adult_morning() {
		return ticket_adult_morning;
	}
	public void setTicket_adult_morning(int ticket_adult_morning) {
		this.ticket_adult_morning = ticket_adult_morning;
	}
	public int getTicket_child_morning() {
		return ticket_child_morning;
	}
	public void setTicket_child_morning(int ticket_child_morning) {
		this.ticket_child_morning = ticket_child_morning;
	}
	public String getTicket_start_time() {
		return ticket_start_time;
	}
	public void setTicket_start_time(String ticket_start_time) {
		this.ticket_start_time = ticket_start_time;
	}
	public String getTicket_end_time() {
		return ticket_end_time;
	}
	public void setTicket_end_time(String ticket_end_time) {
		this.ticket_end_time = ticket_end_time;
	}
	public String getTicket_movie_day() {
		return ticket_movie_day;
	}
	public void setTicket_movie_day(String ticket_movie_day) {
		this.ticket_movie_day = ticket_movie_day;
	}
	public String getRoom_number() {
		return room_number;
	}
	public void setRoom_number(String room_number) {
		this.room_number = room_number;
	}
	public String getSeat_number() {
		return seat_number;
	}
	public void setSeat_number(String seat_number) {
		this.seat_number = seat_number;
	}
	public String getTicket_reservation_date() {
		return ticket_reservation_date;
	}
	public void setTicket_reservation_date(String ticket_reservation_date) {
		this.ticket_reservation_date = ticket_reservation_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
	
}
