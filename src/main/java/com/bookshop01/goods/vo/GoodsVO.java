package com.bookshop01.goods.vo;

import java.sql.Date;
import java.util.ArrayList;

public class GoodsVO {
	
	private String movie_admin_id;	//등록자ID
	private int movie_id;			//영화ID
	private String movie_title;		//제목
	private String movie_director;	//감독
	private String movie_actor;		//배우
	private String movie_sort;		//장르
	private String movie_runningtime;	//관람시간
	private String movie_age_grade;	//연령등급
	private String movie_country;	//제작나라
	private String movie_content;	//줄거리
	private String movie_status;	//상영상태
	private Date movie_open_date;	//개봉일
	private Date movie_close_date;	//종료일
	private String movie_fileName;
	public GoodsVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoodsVO(String movie_admin_id, int movie_id, String movie_title, String movie_director, String movie_actor,
			String movie_sort, String movie_runningtime, String movie_age_grade, String movie_country,
			String movie_content, String movie_status, Date movie_open_date, Date movie_close_date,
			String movie_fileName) {
		super();
		this.movie_admin_id = movie_admin_id;
		this.movie_id = movie_id;
		this.movie_title = movie_title;
		this.movie_director = movie_director;
		this.movie_actor = movie_actor;
		this.movie_sort = movie_sort;
		this.movie_runningtime = movie_runningtime;
		this.movie_age_grade = movie_age_grade;
		this.movie_country = movie_country;
		this.movie_content = movie_content;
		this.movie_status = movie_status;
		this.movie_open_date = movie_open_date;
		this.movie_close_date = movie_close_date;
		this.movie_fileName = movie_fileName;
	}
	public String getMovie_admin_id() {
		return movie_admin_id;
	}
	public void setMovie_admin_id(String movie_admin_id) {
		this.movie_admin_id = movie_admin_id;
	}
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
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_actor() {
		return movie_actor;
	}
	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}
	public String getMovie_sort() {
		return movie_sort;
	}
	public void setMovie_sort(String movie_sort) {
		this.movie_sort = movie_sort;
	}
	public String getMovie_runningtime() {
		return movie_runningtime;
	}
	public void setMovie_runningtime(String movie_runningtime) {
		this.movie_runningtime = movie_runningtime;
	}
	public String getMovie_age_grade() {
		return movie_age_grade;
	}
	public void setMovie_age_grade(String movie_age_grade) {
		this.movie_age_grade = movie_age_grade;
	}
	public String getMovie_country() {
		return movie_country;
	}
	public void setMovie_country(String movie_country) {
		this.movie_country = movie_country;
	}
	public String getMovie_content() {
		return movie_content;
	}
	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}
	public String getMovie_status() {
		return movie_status;
	}
	public void setMovie_status(String movie_status) {
		this.movie_status = movie_status;
	}
	public Date getMovie_open_date() {
		return movie_open_date;
	}
	public void setMovie_open_date(Date movie_open_date) {
		this.movie_open_date = movie_open_date;
	}
	public Date getMovie_close_date() {
		return movie_close_date;
	}
	public void setMovie_close_date(Date movie_close_date) {
		this.movie_close_date = movie_close_date;
	}
	public String getMovie_fileName() {
		return movie_fileName;
	}
	public void setMovie_fileName(String movie_fileName) {
		this.movie_fileName = movie_fileName;
	}
	

}
