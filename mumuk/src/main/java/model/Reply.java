package model;

import java.sql.Date;

public class Reply {
	private int re_no;			
	private String content2;
	private String writer2;
	private Date reg_date2;				
	private String password3; 	
	private int bf_num;
	private int del;
	
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getWriter2() {
		return writer2;
	}
	public void setWriter2(String writer2) {
		this.writer2 = writer2;
	}
	public Date getReg_date2() {
		return reg_date2;
	}
	public void setReg_date2(Date reg_date2) {
		this.reg_date2 = reg_date2;
	}
	public String getPassword3() {
		return password3;
	}
	public void setPassword3(String password3) {
		this.password3 = password3;
	}
	public int getBf_num() {
		return bf_num;
	}
	public void setBf_num(int bf_num) {
		this.bf_num = bf_num;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	} 			
	
}
