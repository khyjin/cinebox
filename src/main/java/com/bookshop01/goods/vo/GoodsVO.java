package com.bookshop01.goods.vo;

import java.sql.Date;
import java.util.ArrayList;

public class GoodsVO {
	private int goods_id;					//��ǰ��ȣ
	private String goods_title;				//å����
	private String goods_writer;			//����
	private int    goods_price;				//����	
	private String goods_publisher;			//���ǻ�
	private String goods_sort;				//����(�з�) �ߺз� ǰ��
	private int    goods_sales_price;		//�ǸŰ���
	private int    goods_point;				//���� ����Ʈ
	private Date    goods_published_date;	//������
	private int    goods_total_page;		//��������
	private String goods_isbn;				//ISBN��ȣ(�Ϸù�ȣ)
	private String goods_delivery_price;	//��ۺ�
	private Date goods_delivery_date;		//��۳�¥
	private String goods_fileName;			//�̹������� �̸�
	private String goods_status;			//��ǰ�з� - ����Ʈ����, �Ű�...
	private String goods_writer_intro;		//���ڼҰ�
	private String goods_contents_order;	//����
	private String goods_intro;				//å�Ұ�
	private String goods_publisher_comment; //���ǻ� ��
	private String goods_recommendation;	//��õ��
	private Date   goods_credate;			//�԰���
	
	private String movie_admin_id;	//�����ID
	private int movie_id;			//��ȭID
	private String movie_title;		//����
	private String movie_director;	//����
	private String movie_actor;		//���
	private String movie_sort;		//�帣
	private String movie_runningtime;	//�����ð�
	private String movie_age_grade;	//���ɵ��
	private String movie_country;	//���۳���
	private String movie_content;	//�ٰŸ�
	private String movie_status;	//�󿵻���
	private Date movie_open_date;	//������
	private Date movie_close_date;	//������
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
