package model;

public class Restaurant {  // DTO
	private int rno;      // 식당 번호
	private String rname; // 식당 이름
	private String addr;  // 식당 주소
	private String rtel;  // 식당 전화번호
	private String menu1; // 대표메뉴1
	private String menu2; // 대표메뉴2
	private String menu3; // 대표메뉴3
	private String img1;  // 메뉴사진1
	private String img2;  // 메뉴사진2
	private String img3;  // 메뉴사진3
	private String img4;  // 메뉴사진4
	private float map_x;    // 좌표x
	private float map_y;    // 좌표y
	private String sep_1; // 대분류
	private String sep_2; // 중분류
	private String sep_3; // 소분류
	private String del;   // 삭제여부  
	private int readcount; // 조회수
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getRtel() {
		return rtel;
	}
	public void setRtel(String rtel) {
		this.rtel = rtel;
	}
	public String getMenu1() {
		return menu1;
	}
	public void setMenu1(String menu1) {
		this.menu1 = menu1;
	}
	public String getMenu2() {
		return menu2;
	}
	public void setMenu2(String menu2) {
		this.menu2 = menu2;
	}
	public String getMenu3() {
		return menu3;
	}
	public void setMenu3(String menu3) {
		this.menu3 = menu3;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getImg4() {
		return img4;
	}
	public void setImg4(String img4) {
		this.img4 = img4;
	}
	public float getMap_x() {
		return map_x;
	}
	public void setMap_x(float map_x) {
		this.map_x = map_x;
	}
	public float getMap_y() {
		return map_y;
	}
	public void setMap_y(float map_y) {
		this.map_y = map_y;
	}
	public String getSep_1() {
		return sep_1;
	}
	public void setSep_1(String sep_1) {
		this.sep_1 = sep_1;
	}
	public String getSep_2() {
		return sep_2;
	}
	public void setSep_2(String sep_2) {
		this.sep_2 = sep_2;
	}
	public String getSep_3() {
		return sep_3;
	}
	public void setSep_3(String sep_3) {
		this.sep_3 = sep_3;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
}
