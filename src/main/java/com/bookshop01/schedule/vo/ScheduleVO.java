package com.bookshop01.schedule.vo;

public class ScheduleVO {
	private String movie_id; //��ȭ��ȣ
	private String movie_title; //��ȭ����
	private String room_number; //�󿵰� ��ȣ
	private String schedule_start_time; //�󿵽��۽ð�
	private String schedule_date; //�󿵳�¥
	private int schedule_id; //�����ٹ�ȣ
	private String schedule_end_time; //�� ���ð�
	private String movie_age_grade;
	
	
	
	
	
	
	public String getSchedule_end_time() {
		return schedule_end_time;
	}
	public void setSchedule_end_time(String schedule_end_time) {
		this.schedule_end_time = schedule_end_time;
	}
	public String getMovie_age_grade() {
		return movie_age_grade;
	}
	public void setMovie_age_grade(String movie_age_grade) {
		this.movie_age_grade = movie_age_grade;
	}
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public String getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getRoom_number() {
		return room_number;
	}
	public void setRoom_number(String room_number) {
		this.room_number = room_number;
	}
	public String getSchedule_start_time() {
		return schedule_start_time;
	}
	public void setSchedule_start_time(String schedule_start_time) {
		this.schedule_start_time = schedule_start_time;
	}
	public String getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(String schedule_date) {
		this.schedule_date = schedule_date;
	}
	
	
	
}
