package com.bookshop01.goods.vo;

import java.sql.Date;
import java.util.ArrayList;

public class GoodsVO {
	private int goods_id;					//상품번호
	private String goods_title;				//책제목
	private String goods_writer;			//저자
	private int    goods_price;				//가격	
	private String goods_publisher;			//출판사
	private String goods_sort;				//종류(분류) 중분류 품목
	private int    goods_sales_price;		//판매가격
	private int    goods_point;				//적립 포인트
	private Date    goods_published_date;	//출판일
	private int    goods_total_page;		//페이지수
	private String goods_isbn;				//ISBN번호(일련번호)
	private String goods_delivery_price;	//배송비
	private Date goods_delivery_date;		//배송날짜
	private String goods_fileName;			//이미지파일 이름
	private String goods_status;			//상품분류 - 베스트셀러, 신간...
	private String goods_writer_intro;		//저자소개
	private String goods_contents_order;	//목차
	private String goods_intro;				//책소개
	private String goods_publisher_comment; //출판사 평
	private String goods_recommendation;	//추천사
	private Date   goods_credate;			//입고일
	
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











//-------------------------------------------------------



	public String getMovie_fileName() {
		return movie_fileName;
	}





	public void setMovie_fileName(String movie_fileName) {
		this.movie_fileName = movie_fileName;
	}





	public int getGoods_id() {
		return goods_id;
	}





	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}





	public String getGoods_title() {
		return goods_title;
	}



	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}



	public String getGoods_writer() {
		return goods_writer;
	}



	public void setGoods_writer(String goods_writer) {
		this.goods_writer = goods_writer;
	}



	public int getGoods_price() {
		return goods_price;
	}



	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}



	public String getGoods_publisher() {
		return goods_publisher;
	}



	public void setGoods_publisher(String goods_publisher) {
		this.goods_publisher = goods_publisher;
	}

	public String getGoods_sort() {
		return goods_sort;
	}

	public void setGoods_sort(String goods_sort) {
		this.goods_sort = goods_sort;
	}
	public int getGoods_sales_price() {
		return goods_sales_price;
	}

	public void setGoods_sales_price(int goods_sales_price) {
		this.goods_sales_price = goods_sales_price;
	}

	public int getGoods_point() {
		return goods_point;
	}



	public void setGoods_point(int goods_point) {
		this.goods_point = goods_point;
	}


	public int getGoods_total_page() {
		return goods_total_page;
	}

	public void setGoods_total_page(int goods_total_page) {
		this.goods_total_page = goods_total_page;
	}

	public String getGoods_isbn() {
		return goods_isbn;
	}



	public void setGoods_isbn(String goods_isbn) {
		this.goods_isbn = goods_isbn;
	}






	public String getGoods_delivery_price() {
		return goods_delivery_price;
	}



	public void setGoods_delivery_price(String goods_delivery_price) {
		this.goods_delivery_price = goods_delivery_price;
	}


	public Date getGoods_published_date() {
		return goods_published_date;
	}

	public void setGoods_published_date(Date goods_published_date) {
		this.goods_published_date = goods_published_date;
	}


	public Date getGoods_delivery_date() {
		return goods_delivery_date;
	}



	public void setGoods_delivery_date(Date goods_delivery_date) {
		this.goods_delivery_date = goods_delivery_date;
	}





	public String getGoods_fileName() {
		return goods_fileName;
	}



	public void setGoods_fileName(String goods_fileName) {
		this.goods_fileName = goods_fileName;
	}



	
	public String getGoods_status() {
		return goods_status;
	}





	public void setGoods_status(String goods_status) {
		this.goods_status = goods_status;
	}





	public String getGoods_writer_intro() {
		return goods_writer_intro;
	}

	public void setGoods_writer_intro(String goods_writer_intro) {
		this.goods_writer_intro = goods_writer_intro;
	}
	public String getGoods_contents_order() {
		return goods_contents_order;
	}
	public void setGoods_contents_order(String goods_contents_order) {
		this.goods_contents_order = goods_contents_order;
	}
	public String getGoods_intro() {
		return goods_intro;
	}
	public void setGoods_intro(String goods_intro) {
		this.goods_intro = goods_intro;
	}

	public String getGoods_publisher_comment() {
		return goods_publisher_comment;
	}

	public void setGoods_publisher_comment(String goods_publisher_comment) {
		this.goods_publisher_comment = goods_publisher_comment;
	}

	public String getGoods_recommendation() {
		return goods_recommendation;
	}

	public void setGoods_recommendation(String goods_recommendation) {
		this.goods_recommendation = goods_recommendation;
	}

	public Date getGoods_credate() {
		return goods_credate;
	}

	public void setGoods_credate(Date goods_credate) {
		this.goods_credate = goods_credate;
	}
	

}
