package com.bookshop01.member.vo;

import org.springframework.stereotype.Component;

@Component("memberVO") //�̰� �� �ڹٿ��� �� �������� �� ����� �󿡼� ���� ó���� �����߾��� ������̼�
public class MemberVO {

   
   
   
   
   
   

	
	// �ϼ� �ʵ�
	//private String member_id; // ȸ�� ���̵�
	//private String member_pw; //ȸ�� �н�����
	//private String member_name; // ȸ�� �̸�
	//private String member_gender; // ȸ�� ����
	//private String member_birth_y; // ����
	//private String member_birth_m; // ����
	//private String member_birth_d; //����
	private String member_birth_gn; // ��� ���� 
	private String tel1; // ����ó1
	private String tel2; // ����ó2
	private String tel3; // ����ó3
	private String hp1; // �ڵ���1
	private String hp2; // �ڵ���2
	private String hp3; // �ڵ���3
	private String smssts_yn; //SMS ����
	private String email1; //�̸���1
	private String email2; // �̸���2
	private String emailsts_yn; // �̸��� ���� ����
	private String zipcode; // ���� ��ȣ
	private String roadAddress; // ���θ� �ּ�
	private String jibunAddress; // ���� �ּ�
	private String namujiAddress; // ������ �ּ�
	private String joinDate; // ���� ����
	private String del_yn; // ȸ�� Ż��
	
	
	//���� �ڽ� �ʵ�
	private String member_id; // ȸ�� ���̵�
	private String member_pw; //ȸ�� �н�����
	private String member_name; // ȸ�� �̸�
	private String member_gender; // ȸ�� ����
	private String member_hp1; // �ڵ���1
	private String member_hp2; // �ڵ���2
	private String member_hp3; // �ڵ���3
	private String member_email_yn; // �̸��� ���� ����
	private String member_email1; //�̸���1
	private String member_email2; // �̸���2
	private String member_zip; // ���� ��ȣ
	private String member_roadaddress; // ���θ� �ּ�
	private String member_jibunaddress; // ���� �ּ�
	private String member_namujiaddress; // ������ �ּ�
	private String member_birth_y; // ����
	private String member_birth_m; // ����
	private String member_birth_d; //����
	private String member_joindate; // ���� ����
	private String member_del_yn; // ȸ�� Ż�� ����
	private String member_del_date; // ȸ�� Ż��
	private int member_point; // ȸ�� ����Ʈ
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	
	
	public String getMember_hp1() {
		return member_hp1;
	}
	public void setMember_hp1(String member_hp1) {
		this.member_hp1 = member_hp1;
	}
	public String getMember_hp2() {
		return member_hp2;
	}
	public void setMember_hp2(String member_hp2) {
		this.member_hp2 = member_hp2;
	}
	public String getMember_hp3() {
		return member_hp3;
	}
	public void setMember_hp3(String member_hp3) {
		this.member_hp3 = member_hp3;
	}
	public String getMember_email_yn() {
		return member_email_yn;
	}
	public void setMember_email_yn(String member_email_yn) {
		this.member_email_yn = member_email_yn;
	}
	public String getMember_email1() {
		return member_email1;
	}
	public void setMember_email1(String member_email1) {
		this.member_email1 = member_email1;
	}
	public String getMember_email2() {
		return member_email2;
	}
	public void setMember_email2(String member_email2) {
		this.member_email2 = member_email2;
	}
	public String getMember_zip() {
		return member_zip;
	}
	public void setMember_zip(String member_zip) {
		this.member_zip = member_zip;
	}
	public String getMember_roadaddress() {
		return member_roadaddress;
	}
	public void setMember_roadaddress(String member_roadaddress) {
		this.member_roadaddress = member_roadaddress;
	}
	public String getMember_jibunaddress() {
		return member_jibunaddress;
	}
	public void setMember_jibunaddress(String member_jibunaddress) {
		this.member_jibunaddress = member_jibunaddress;
	}
	public String getMember_namujiaddress() {
		return member_namujiaddress;
	}
	public void setMember_namujiaddress(String member_namujiaddress) {
		this.member_namujiaddress = member_namujiaddress;
	}
	
	public String getMember_joindate() {
		return member_joindate;
	}
	public void setMember_joindate(String member_joindate) {
		this.member_joindate = member_joindate;
	}
	public String getMember_del_yn() {
		return member_del_yn;
	}
	public void setMember_del_yn(String member_del_yn) {
		this.member_del_yn = member_del_yn;
	}
	public String getMember_del_date() {
		return member_del_date;
	}
	public void setMember_del_date(String member_del_date) {
		this.member_del_date = member_del_date;
	}
	
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	public String getMember_birth_y() {
		return member_birth_y;
	}
	public void setMember_birth_y(String member_birth_y) {
		this.member_birth_y = member_birth_y;
	}
	public String getMember_birth_m() {
		return member_birth_m;
	}
	public void setMember_birth_m(String member_birth_m) {
		this.member_birth_m = member_birth_m;
	}
	public String getMember_birth_d() {
		return member_birth_d;
	}
	public void setMember_birth_d(String member_birth_d) {
		this.member_birth_d = member_birth_d;
	}
	public String getMember_birth_gn() {
		return member_birth_gn;
	}
	public void setMember_birth_gn(String member_birth_gn) {
		this.member_birth_gn = member_birth_gn;
	}
	
	
	//�ϼ� �ʵ�
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	
	
	public String getSmssts_yn() {
		return smssts_yn;
	}
	public void setSmssts_yn(String smssts_yn) {
		this.smssts_yn = smssts_yn;
	}
	public String getEmailsts_yn() {
		return emailsts_yn;
	}
	public void setEmailsts_yn(String emailsts_yn) {
		this.emailsts_yn = emailsts_yn;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}

    
   
   public String getNamujiAddress() {
      return namujiAddress;
   }
   public void setNamujiAddress(String namujiAddress) {
      this.namujiAddress = namujiAddress;
   }
   public String getJoinDate() {
      return joinDate;
   }
   public void setJoinDate(String joinDate) {
      this.joinDate = joinDate;
   }
   public String getDel_yn() {
      return del_yn;
   }
   public void setDel_yn(String del_yn) {
      this.del_yn = del_yn;
   }
   
}
