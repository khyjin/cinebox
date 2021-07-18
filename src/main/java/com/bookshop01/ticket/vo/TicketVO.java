package com.bookshop01.ticket.vo;

import java.util.Date;

public class TicketVO {
	private int movie_id; //영화번호
	private String movie_title;//영화제목
	private int ticket_number; //예매 일련번호
	private int ticket_adult; //성인 일반
	private int ticket_child; //청소년 일반
	private String ticket_start_time; //상영시작시간
	private String ticket_end_time; //상영끝시간
	private String ticket_movie_day; //상영일
	private String room_number; //상영관번호
	private String seat_number; //좌석이름 영문
	private String member_id; //회원아이디
	private String ticket_cancle_date;	//취소날짜
	private String ticket_cancle_yn;	//취소여부
	private String ticket_card_company;	//결제카드회사
	private String ticket_card_month;	//할부개월수
	private String ticket_pay_method;	//결제수단
	private String ticket_payment_date;	//결제날짜
	private String ticket_phone_number1;	//결제자 전화번호1
	private String ticket_phone_number2;	//결제자 전화번호2
	private String ticket_phone_number3;	//결제자 전화번호3
	private int ticket_total_price;		//총결제금액
	private int ticket_used_point;	//사용된 포인트금액(=할인금액)
	
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public int getTicket_number() {
		return ticket_number;
	}
	public void setTicket_number(int ticket_number) {
		this.ticket_number = ticket_number;
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
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTicket_cancle_date() {
		return ticket_cancle_date;
	}
	public void setTicket_cancle_date(String ticket_cancle_date) {
		this.ticket_cancle_date = ticket_cancle_date;
	}
	public String getTicket_cancle_yn() {
		return ticket_cancle_yn;
	}
	public void setTicket_cancle_yn(String ticket_cancle_yn) {
		this.ticket_cancle_yn = ticket_cancle_yn;
	}
	public String getTicket_card_company() {
		return ticket_card_company;
	}
	public void setTicket_card_company(String ticket_card_company) {
		this.ticket_card_company = ticket_card_company;
	}
	public String getTicket_card_month() {
		return ticket_card_month;
	}
	public void setTicket_card_month(String ticket_card_month) {
		this.ticket_card_month = ticket_card_month;
	}
	public String getTicket_pay_method() {
		return ticket_pay_method;
	}
	public void setTicket_pay_method(String ticket_pay_method) {
		this.ticket_pay_method = ticket_pay_method;
	}

	public String getTicket_payment_date() {
		return ticket_payment_date;
	}
	public void setTicket_payment_date(String ticket_payment_date) {
		this.ticket_payment_date = ticket_payment_date;
	}
	public String getTicket_phone_number1() {
		return ticket_phone_number1;
	}
	public void setTicket_phone_number1(String ticket_phone_number1) {
		this.ticket_phone_number1 = ticket_phone_number1;
	}
	public String getTicket_phone_number2() {
		return ticket_phone_number2;
	}
	public void setTicket_phone_number2(String ticket_phone_number2) {
		this.ticket_phone_number2 = ticket_phone_number2;
	}
	public String getTicket_phone_number3() {
		return ticket_phone_number3;
	}
	public void setTicket_phone_number3(String ticket_phone_number3) {
		this.ticket_phone_number3 = ticket_phone_number3;
	}
	public int getTicket_total_price() {
		return ticket_total_price;
	}
	public void setTicket_total_price(int ticket_total_price) {
		this.ticket_total_price = ticket_total_price;
	}
	public int getTicket_used_point() {
		return ticket_used_point;
	}
	public void setTicket_used_point(int ticket_used_point) {
		this.ticket_used_point = ticket_used_point;
	}
	
	
}
