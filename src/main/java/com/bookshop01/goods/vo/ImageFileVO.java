package com.bookshop01.goods.vo;

public class ImageFileVO {
	private int goods_id; //상품번호 (상품정보 테이블에서의 상품번호-> 외래키)
	private int image_id; //이미지번호 (기본키)
	private String fileName; //이미지화일명 
	private String fileType; //이미지화일종류
	private String reg_id; //등록자아이디 
	

	public ImageFileVO() {
		super();
	}


	public int getGoods_id() {
		return goods_id;
	}




	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}




	public int getImage_id() {
		return image_id;
	}




	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}




	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}


	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}


	

}
