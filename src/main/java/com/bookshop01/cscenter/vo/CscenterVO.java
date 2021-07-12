package com.bookshop01.cscenter.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("cscenterVO")
public class CscenterVO {
	private String cscenter_content;
	private int cscenter_group;
	private int cscenter_hit;
	private int cscenter_indent;
	private int cscenter_number;
	private Date cscenter_reg_date;
	private String cscenter_type;
	private int cscenter_step;
	private String cscenter_title;
	private String member_id;
	private String cscenter_headline;
	
	
	public CscenterVO(String cscenter_content, String cscenter_type, String cscenter_title, String member_id,
			String cscenter_headline) {
		super();
		this.cscenter_content = cscenter_content;
		this.cscenter_type = cscenter_type;
		this.cscenter_title = cscenter_title;
		this.member_id = member_id;
		this.cscenter_headline = cscenter_headline;
	}
	public CscenterVO(String cscenter_content, int cscenter_group, int cscenter_hit, int cscenter_indent,
			int cscenter_number, Date cscenter_reg_date, String cscenter_type, int cscenter_step, String cscenter_title,
			String member_id, String cscenter_headline) {
		super();
		this.cscenter_content = cscenter_content;
		this.cscenter_group = cscenter_group;
		this.cscenter_hit = cscenter_hit;
		this.cscenter_indent = cscenter_indent;
		this.cscenter_number = cscenter_number;
		this.cscenter_reg_date = cscenter_reg_date;
		this.cscenter_type = cscenter_type;
		this.cscenter_step = cscenter_step;
		this.cscenter_title = cscenter_title;
		this.member_id = member_id;
		this.cscenter_headline = cscenter_headline;
	}
	public String getCscenter_headline() {
		return cscenter_headline;
	}
	public void setCscenter_headline(String cscenter_headline) {
		this.cscenter_headline = cscenter_headline;
	}
	public String getCscenter_content() {
		return cscenter_content;
	}
	public void setCscenter_content(String cscenter_content) {
		this.cscenter_content = cscenter_content;
	}
	public int getCscenter_group() {
		return cscenter_group;
	}
	public void setCscenter_group(int cscenter_group) {
		this.cscenter_group = cscenter_group;
	}
	public int getCscenter_hit() {
		return cscenter_hit;
	}
	public void setCscenter_hit(int cscenter_hit) {
		this.cscenter_hit = cscenter_hit;
	}
	public int getCscenter_indent() {
		return cscenter_indent;
	}
	public void setCscenter_indent(int cscenter_indent) {
		this.cscenter_indent = cscenter_indent;
	}
	public int getCscenter_number() {
		return cscenter_number;
	}
	public void setCscenter_number(int cscenter_number) {
		this.cscenter_number = cscenter_number;
	}
	public Date getCscenter_reg_date() {
		return cscenter_reg_date;
	}
	public void setCscenter_reg_date(Date cscenter_reg_date) {
		this.cscenter_reg_date = cscenter_reg_date;
	}
	
	
	public String getCscenter_type() {
		return cscenter_type;
	}
	public void setCscenter_type(String cscenter_type) {
		this.cscenter_type = cscenter_type;
	}
	public int getCscenter_step() {
		return cscenter_step;
	}
	public void setCscenter_step(int cscenter_step) {
		this.cscenter_step = cscenter_step;
	}
	public String getCscenter_title() {
		return cscenter_title;
	}
	public void setCscenter_title(String cscenter_title) {
		this.cscenter_title = cscenter_title;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
//	public CscenterVO(String cscenter_content, int cscenter_group, int cscenter_hit, int cscenter_indent,
//			int cscenter_number, Date cscenter_reg_date, String cscenter_type, int cscenter_step, String cscenter_title,
//			String member_id) {
//		super();
//		this.cscenter_content = cscenter_content;
//		this.cscenter_group = cscenter_group;
//		this.cscenter_hit = cscenter_hit;
//		this.cscenter_indent = cscenter_indent;
//		this.cscenter_number = cscenter_number;
//		this.cscenter_reg_date = cscenter_reg_date;
//		this.cscenter_type = cscenter_type;
//		this.cscenter_step = cscenter_step;
//		this.cscenter_title = cscenter_title;
//		this.member_id = member_id;
//	}
	public CscenterVO() {
		super();
	}
	
	
	
	
	
	
	
}
