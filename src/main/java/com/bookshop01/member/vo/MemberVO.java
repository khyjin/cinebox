package com.bookshop01.member.vo;

import org.springframework.stereotype.Component;

@Component("memberVO") //이거 그 자바에서 빈 설정했을 때 골뱅이 빈에서 제일 처음에 설정했었던 어노테이션
public class MemberVO {

   
   
   
   
   
   

	
	// 북샵 필드
	//private String member_id; // 회원 아이디
	//private String member_pw; //회원 패스워드
	//private String member_name; // 회원 이름
	//private String member_gender; // 회원 성별
	//private String member_birth_y; // 생년
	//private String member_birth_m; // 생월
	//private String member_birth_d; //생일
	private String member_birth_gn; // 양력 음력 
	private String tel1; // 연락처1
	private String tel2; // 연락처2
	private String tel3; // 연락처3
	private String hp1; // 핸드폰1
	private String hp2; // 핸드폰2
	private String hp3; // 핸드폰3
	private String smssts_yn; //SMS 유무
	private String email1; //이메일1
	private String email2; // 이메일2
	private String emailsts_yn; // 이메일 수신 여부
	private String zipcode; // 우편 번호
	private String roadAddress; // 도로명 주소
	private String jibunAddress; // 지번 주소
	private String namujiAddress; // 나머지 주소
	private String joinDate; // 가입 일자
	private String del_yn; // 회원 탈퇴
	
	
	//씨네 박스 필드
	private String member_id; // 회원 아이디
	private String member_pw; //회원 패스워드
	private String member_name; // 회원 이름
	private String member_gender; // 회원 성별
	private String member_hp1; // 핸드폰1
	private String member_hp2; // 핸드폰2
	private String member_hp3; // 핸드폰3
	private String member_email_yn; // 이메일 수신 여부
	private String member_email1; //이메일1
	private String member_email2; // 이메일2
	private String member_zip; // 우편 번호
	private String member_roadaddress; // 도로명 주소
	private String member_jibunaddress; // 지번 주소
	private String member_namujiaddress; // 나머지 주소
	private String member_birth_y; // 생년
	private String member_birth_m; // 생월
	private String member_birth_d; //생일
	private String member_joindate; // 가입 일자
	private String member_del_yn; // 회원 탈퇴 여부
	private String member_del_date; // 회원 탈퇴
	private int member_point; // 회원 포인트
	
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
	
	
	//북샵 필드
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
