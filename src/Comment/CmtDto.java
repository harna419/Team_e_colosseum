package Comment;

//모델빈
import java.util.*;
public class CmtDto {
	
	//필드
	
	private int q_num;
	private String q_comment;
	private String q_name;
	private String q_nickname;
	private String q_comment_img;
	private String q_create_time;
	private String q_modify_time;
	private int q_comment_pos;
	private int q_zone;
	private int q_comment_depth;
	private String q_ip;
	
	
	public CmtDto(){}//디폴트 생성자

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getQ_comment() {
		return q_comment;
	}

	public void setQ_comment(String q_comment) {
		this.q_comment = q_comment;
	}

	public String getQ_name() {
		return q_name;
	}

	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}

	public String getQ_nickname() {
		return q_nickname;
	}

	public void setQ_nickname(String q_nickname) {
		this.q_nickname = q_nickname;
	}

	public String getQ_comment_img() {
		return q_comment_img;
	}

	public void setQ_comment_img(String q_comment_img) {
		this.q_comment_img = q_comment_img;
	}

	public String getQ_create_time() {
		return q_create_time;
	}

	public void setQ_create_time(String q_create_time) {
		this.q_create_time = q_create_time;
	}

	public String getQ_modify_time() {
		return q_modify_time;
	}

	public void setQ_modify_time(String q_modify_time) {
		this.q_modify_time = q_modify_time;
	}

	public int getQ_comment_pos() {
		return q_comment_pos;
	}

	public void setQ_comment_pos(int q_comment_pos) {
		this.q_comment_pos = q_comment_pos;
	}

	public int getQ_zone() {
		return q_zone;
	}

	public void setQ_zone(int q_zone) {
		this.q_zone = q_zone;

	}
	
	public int getQ_comment_depth() {
		return q_comment_depth;
	}

	public void setQ_comment_depth(int q_comment_depth) {
		this.q_comment_depth = q_comment_depth;
	}
	
	public String getQ_ip() {
		return q_ip;
	}

	public void setQ_ip(String q_ip) {
		this.q_ip = q_ip;
	}

	

}//class end 
