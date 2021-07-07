package com.bookshop01.goods.vo;

import java.sql.Date;

public class ImageFileVO {
//	private int goods_id;		//상품번호
//	private int image_id;		//이미지 번호
//	private String fileName;	//이미지 파일명
//	private String fileType;	//이미지 종류
//	private String reg_id;		//등록자 아이디


	private int movie_id;
	private int image_number;
	private String image_file_name;
	private String image_admin_id;
	private String image_file_sort;
	private Date image_reg_date;
	
	public ImageFileVO(int movie_id, int image_number, String image_file_name, String image_admin_id,
			String image_file_sort, Date image_reg_date) {
		super();
		this.movie_id = movie_id;
		this.image_number = image_number;
		this.image_file_name = image_file_name;
		this.image_admin_id = image_admin_id;
		this.image_file_sort = image_file_sort;
		this.image_reg_date = image_reg_date;
	}
	
	


	public ImageFileVO() {
		super();	}




	public int getMovie_id() {
		return movie_id;
	}


	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}


	public int getImage_number() {
		return image_number;
	}


	public void setImage_number(int image_number) {
		this.image_number = image_number;
	}


	public String getImage_file_name() {
		return image_file_name;
	}


	public void setImage_file_name(String image_file_name) {
		this.image_file_name = image_file_name;
	}


	public String getImage_admin_id() {
		return image_admin_id;
	}


	public void setImage_admin_id(String image_admin_id) {
		this.image_admin_id = image_admin_id;
	}


	public String getImage_file_sort() {
		return image_file_sort;
	}


	public void setImage_file_sort(String image_file_sort) {
		this.image_file_sort = image_file_sort;
	}


	public Date getImage_reg_date() {
		return image_reg_date;
	}


	public void setImage_reg_date(Date image_reg_date) {
		this.image_reg_date = image_reg_date;
	}


//-----------------------------------------------------------------------------	
//	public ImageFileVO() {
//		super();
//	}
//
//
//	public int getGoods_id() {
//		return goods_id;
//	}
//
//
//
//
//	public void setGoods_id(int goods_id) {
//		this.goods_id = goods_id;
//	}
//
//
//
//
//	public int getImage_id() {
//		return image_id;
//	}
//
//
//
//
//	public void setImage_id(int image_id) {
//		this.image_id = image_id;
//	}
//
//
//
//
//	public String getFileName() {
//		return fileName;
//	}
//
//	public void setFileName(String fileName) {
//		this.fileName = fileName;
//	}
//
//	public String getFileType() {
//		return fileType;
//	}
//
//	public void setFileType(String fileType) {
//		this.fileType = fileType;
//	}
//
//
//	public String getReg_id() {
//		return reg_id;
//	}
//
//	public void setReg_id(String reg_id) {
//		this.reg_id = reg_id;
//	}


	

}
