package quiz_colosseum;
import java.util.*;

public class Quiz_ScoreBean {
	
	private int q_num;
	private String q_title;
	private String q_subject;
	private String q_content;
	private int q_quiz_num;
	private int q_quiz_step;
	private String q_id;
	private String q_nickname;
	private String q_name;
	private String q_guest_id;
	private String q_guest_nickname;
	private String q_guest_name;
	private String q_quiz_event;
	private Date q_event_time;
	private String q_qroup_type;
	private String q_group_num;
	private String q_group_name;
	private String q_quiz_type;
	private String q_custom_reply1;
	private String q_custom_reply2;
	private String q_custom_reply3;
	private String q_custom_reply4;
	private String q_custom_reply5;
	private String q_custom_reply6;
	private String q_custom_reply7;
	private String q_custom_reply8;
	private String q_custom_reply9;
	private String q_custom_reply10;
	private int cnt;//문제 개수 구하기 
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public int getQ_quiz_num() {
		return q_quiz_num;
	}
	public void setQ_quiz_num(int q_quiz_num) {
		this.q_quiz_num = q_quiz_num;
	}
	public int getQ_quiz_step() {
		return q_quiz_step;
	}
	public void setQ_quiz_step(int q_quiz_step) {
		this.q_quiz_step = q_quiz_step;
	}
	public String getQ_id() {
		return q_id;
	}
	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}
	public String getQ_nickname() {
		return q_nickname;
	}
	public void setQ_nickname(String q_nickname) {
		this.q_nickname = q_nickname;
	}
	public String getQ_name() {
		return q_name;
	}
	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}
	public String getQ_guest_id() {
		return q_guest_id;
	}
	public void setQ_guest_id(String q_guest_id) {
		this.q_guest_id = q_guest_id;
	}
	public String getQ_guest_nickname() {
		return q_guest_nickname;
	}
	public void setQ_guest_nickname(String q_guest_nickname) {
		this.q_guest_nickname = q_guest_nickname;
	}
	public String getQ_guest_name() {
		return q_guest_name;
	}
	public void setQ_guest_name(String q_guest_name) {
		this.q_guest_name = q_guest_name;
	}
	public String getQ_quiz_event() {
		return q_quiz_event;
	}
	public void setQ_quiz_event(String q_quiz_event) {
		this.q_quiz_event = q_quiz_event;
	}
	public Date getQ_event_time() {
		return q_event_time;
	}
	public void setQ_event_time(Date q_event_time) {
		this.q_event_time = q_event_time;
	}
	public String getQ_qroup_type() {
		return q_qroup_type;
	}
	public void setQ_qroup_type(String q_qroup_type) {
		this.q_qroup_type = q_qroup_type;
	}
	public String getQ_group_num() {
		return q_group_num;
	}
	public void setQ_group_num(String q_group_num) {
		this.q_group_num = q_group_num;
	}
	public String getQ_group_name() {
		return q_group_name;
	}
	public void setQ_group_name(String q_group_name) {
		this.q_group_name = q_group_name;
	}
	public String getQ_quiz_type() {
		return q_quiz_type;
	}
	public void setQ_quiz_type(String q_quiz_type) {
		this.q_quiz_type = q_quiz_type;
	}
	public String getQ_custom_reply1() {
		return q_custom_reply1;
	}
	public void setQ_custom_reply1(String q_custom_reply1) {
		this.q_custom_reply1 = q_custom_reply1;
	}
	public String getQ_custom_reply2() {
		return q_custom_reply2;
	}
	public void setQ_custom_reply2(String q_custom_reply2) {
		this.q_custom_reply2 = q_custom_reply2;
	}
	public String getQ_custom_reply3() {
		return q_custom_reply3;
	}
	public void setQ_custom_reply3(String q_custom_reply3) {
		this.q_custom_reply3 = q_custom_reply3;
	}
	public String getQ_custom_reply4() {
		return q_custom_reply4;
	}
	public void setQ_custom_reply4(String q_custom_reply4) {
		this.q_custom_reply4 = q_custom_reply4;
	}
	public String getQ_custom_reply5() {
		return q_custom_reply5;
	}
	public void setQ_custom_reply5(String q_custom_reply5) {
		this.q_custom_reply5 = q_custom_reply5;
	}
	public String getQ_custom_reply6() {
		return q_custom_reply6;
	}
	public void setQ_custom_reply6(String q_custom_reply6) {
		this.q_custom_reply6 = q_custom_reply6;
	}
	public String getQ_custom_reply7() {
		return q_custom_reply7;
	}
	public void setQ_custom_reply7(String q_custom_reply7) {
		this.q_custom_reply7 = q_custom_reply7;
	}
	public String getQ_custom_reply8() {
		return q_custom_reply8;
	}
	public void setQ_custom_reply8(String q_custom_reply8) {
		this.q_custom_reply8 = q_custom_reply8;
	}
	public String getQ_custom_reply9() {
		return q_custom_reply9;
	}
	public void setQ_custom_reply9(String q_custom_reply9) {
		this.q_custom_reply9 = q_custom_reply9;
	}
	public String getQ_custom_reply10() {
		return q_custom_reply10;
	}
	public void setQ_custom_reply10(String q_custom_reply10) {
		this.q_custom_reply10 = q_custom_reply10;
	}

	
	
}
