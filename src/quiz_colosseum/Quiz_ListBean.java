package quiz_colosseum;
import java.util.*;

public class Quiz_ListBean {

	private int q_num;//퀴즈 고유번호(PK)
	private String q_id; // 퀴즈 출제자 이메일 아이디
	private String q_name;//퀴즈 출제자 이름
	private String q_user_num;//퀴즈 출제자 고유번호
	private String q_nickname;//퀴즈 출제자 닉네임
	private String q_title;//퀴즈 타이틀제목
	private String q_title_img;//퀴즈 이미지 파일
	private String q_subject;//퀴즈 소제목
	private String q_subject_img;//퀴즈 소제목 이미지
	private String q_content;//퀴즈 소내용
	private String q_content_img;//퀴즈 소내용 이미지
	private String q_reply1;//퀴즈 답1
	private String q_reply2;//퀴즈 답2
	private String q_reply3;//퀴즈 답3
	private String q_reply4;//퀴즈 답4
	private String q_reply5;//퀴즈 답5
	private String q_reply6;//퀴즈 답6
	private String q_reply7;//퀴즈 답7
	private String q_reply8;//퀴즈 답8
	private String q_reply9;//퀴즈 답9
	private String q_reply10;//퀴즈 답10
	private String q_real_reply1;//퀴즈 답10
	private String q_real_reply2;//퀴즈 답2
	private String q_real_reply3;//퀴즈 답3
	private String q_real_reply4;//퀴즈 답4
	private String q_real_reply5;//퀴즈 답5
	private String q_real_reply6;//퀴즈 답6
	private String q_real_reply7;//퀴즈 답7
	private String q_real_reply8;//퀴즈 답8
	private String q_real_reply9;//퀴즈 답9
	private String q_real_reply10;//퀴즈 답10
	private String q_reply1_img;//퀴즈 답 이미지1
	private String q_reply2_img;//퀴즈 답 이미지2
	private String q_reply3_img;//퀴즈 답 이미지3
	private String q_reply4_img;//퀴즈 답 이미지4
	private String q_reply5_img;//퀴즈 답 이미지5
	private String q_reply6_img;//퀴즈 답 이미지6
	private String q_reply7_img;//퀴즈 답 이미지7
	private String q_reply8_img;//퀴즈 답 이미지8
	private String q_reply9_img;//퀴즈 답 이미지9
	private String q_reply10_img;//퀴즈 답 이미지10
	private int q_dep_num;//퀴즈 그룹번호(Q_NUM 과 동일함)
	private int q_dep_step;//퀴즈그룹문제번호(최대10까지 등록가능)
	private int q_read_count;//퀴즈 조회수
	private String q_group_type;//그룹 문제 여부(Y/N)
	private String q_group_num;//그룹 고유번호
	private String q_group_name;//퀴즈 그룹 이름
	private Date q_create_time;//퀴즈 생성일
	private Date q_modify_time;//퀴즈 수정일
	private String q_quiz_type;
	
	private int cnt;//문제 개수 구하기 
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	
	public String getQ_quiz_type() {
		return q_quiz_type;
	}

	public void setQ_quiz_type(String q_quiz_type) {
		this.q_quiz_type = q_quiz_type;
	}

	public Quiz_ListBean() {
	}// 디폴트 생성자

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getQ_id() {
		return q_id;
	}

	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}

	public String getQ_name() {
		return q_name;
	}

	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}

	public String getQ_user_num() {
		return q_user_num;
	}

	public void setQ_user_num(String q_user_num) {
		this.q_user_num = q_user_num;
	}

	public String getQ_nickname() {
		return q_nickname;
	}

	public void setQ_nickname(String q_nickname) {
		this.q_nickname = q_nickname;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_title_img() {
		return q_title_img;
	}

	public void setQ_title_img(String q_title_img) {
		this.q_title_img = q_title_img;
	}

	public String getQ_subject() {
		return q_subject;
	}

	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}

	public String getQ_subject_img() {
		return q_subject_img;
	}

	public void setQ_subject_img(String q_subject_img) {
		this.q_subject_img = q_subject_img;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_content_img() {
		return q_content_img;
	}

	public void setQ_content_img(String q_content_img) {
		this.q_content_img = q_content_img;
	}

	public String getQ_reply1() {
		return q_reply1;
	}

	public void setQ_reply1(String q_reply1) {
		this.q_reply1 = q_reply1;
	}

	public String getQ_reply2() {
		return q_reply2;
	}

	public void setQ_reply2(String q_reply2) {
		this.q_reply2 = q_reply2;
	}

	public String getQ_reply3() {
		return q_reply3;
	}

	public void setQ_reply3(String q_reply3) {
		this.q_reply3 = q_reply3;
	}

	public String getQ_reply4() {
		return q_reply4;
	}

	public void setQ_reply4(String q_reply4) {
		this.q_reply4 = q_reply4;
	}

	public String getQ_reply5() {
		return q_reply5;
	}

	public void setQ_reply5(String q_reply5) {
		this.q_reply5 = q_reply5;
	}

	public String getQ_reply6() {
		return q_reply6;
	}

	public void setQ_reply6(String q_reply6) {
		this.q_reply6 = q_reply6;
	}

	public String getQ_reply7() {
		return q_reply7;
	}

	public void setQ_reply7(String q_reply7) {
		this.q_reply7 = q_reply7;
	}

	public String getQ_reply8() {
		return q_reply8;
	}

	public void setQ_reply8(String q_reply8) {
		this.q_reply8 = q_reply8;
	}

	public String getQ_reply9() {
		return q_reply9;
	}

	public void setQ_reply9(String q_reply9) {
		this.q_reply9 = q_reply9;
	}

	public String getQ_reply10() {
		return q_reply10;
	}

	public void setQ_reply10(String q_reply10) {
		this.q_reply10 = q_reply10;
	}

	public String getQ_real_reply1() {
		return q_real_reply1;
	}

	public void setQ_real_reply1(String q_real_reply1) {
		this.q_real_reply1 = q_real_reply1;
	}

	public String getQ_real_reply2() {
		return q_real_reply2;
	}

	public void setQ_real_reply2(String q_real_reply2) {
		this.q_real_reply2 = q_real_reply2;
	}

	public String getQ_real_reply3() {
		return q_real_reply3;
	}

	public void setQ_real_reply3(String q_real_reply3) {
		this.q_real_reply3 = q_real_reply3;
	}

	public String getQ_real_reply4() {
		return q_real_reply4;
	}

	public void setQ_real_reply4(String q_real_reply4) {
		this.q_real_reply4 = q_real_reply4;
	}

	public String getQ_real_reply5() {
		return q_real_reply5;
	}

	public void setQ_real_reply5(String q_real_reply5) {
		this.q_real_reply5 = q_real_reply5;
	}

	public String getQ_real_reply6() {
		return q_real_reply6;
	}

	public void setQ_real_reply6(String q_real_reply6) {
		this.q_real_reply6 = q_real_reply6;
	}

	public String getQ_real_reply7() {
		return q_real_reply7;
	}

	public void setQ_real_reply7(String q_real_reply7) {
		this.q_real_reply7 = q_real_reply7;
	}

	public String getQ_real_reply8() {
		return q_real_reply8;
	}

	public void setQ_real_reply8(String q_real_reply8) {
		this.q_real_reply8 = q_real_reply8;
	}

	public String getQ_real_reply9() {
		return q_real_reply9;
	}

	public void setQ_real_reply9(String q_real_reply9) {
		this.q_real_reply9 = q_real_reply9;
	}

	public String getQ_real_reply10() {
		return q_real_reply10;
	}

	public void setQ_real_reply10(String q_real_reply10) {
		this.q_real_reply10 = q_real_reply10;
	}

	public String getQ_reply1_img() {
		return q_reply1_img;
	}

	public void setQ_reply1_img(String q_reply1_img) {
		this.q_reply1_img = q_reply1_img;
	}

	public String getQ_reply2_img() {
		return q_reply2_img;
	}

	public void setQ_reply2_img(String q_reply2_img) {
		this.q_reply2_img = q_reply2_img;
	}

	public String getQ_reply3_img() {
		return q_reply3_img;
	}

	public void setQ_reply3_img(String q_reply3_img) {
		this.q_reply3_img = q_reply3_img;
	}

	public String getQ_reply4_img() {
		return q_reply4_img;
	}

	public void setQ_reply4_img(String q_reply4_img) {
		this.q_reply4_img = q_reply4_img;
	}

	public String getQ_reply5_img() {
		return q_reply5_img;
	}

	public void setQ_reply5_img(String q_reply5_img) {
		this.q_reply5_img = q_reply5_img;
	}

	public String getQ_reply6_img() {
		return q_reply6_img;
	}

	public void setQ_reply6_img(String q_reply6_img) {
		this.q_reply6_img = q_reply6_img;
	}

	public String getQ_reply7_img() {
		return q_reply7_img;
	}

	public void setQ_reply7_img(String q_reply7_img) {
		this.q_reply7_img = q_reply7_img;
	}

	public String getQ_reply8_img() {
		return q_reply8_img;
	}

	public void setQ_reply8_img(String q_reply8_img) {
		this.q_reply8_img = q_reply8_img;
	}

	public String getQ_reply9_img() {
		return q_reply9_img;
	}

	public void setQ_reply9_img(String q_reply9_img) {
		this.q_reply9_img = q_reply9_img;
	}

	public String getQ_reply10_img() {
		return q_reply10_img;
	}

	public void setQ_reply10_img(String q_reply10_img) {
		this.q_reply10_img = q_reply10_img;
	}

	public int getQ_dep_num() {
		return q_dep_num;
	}

	public void setQ_dep_num(int q_dep_num) {
		this.q_dep_num = q_dep_num;
	}

	public int getQ_dep_step() {
		return q_dep_step;
	}

	public void setQ_dep_step(int q_dep_step) {
		this.q_dep_step = q_dep_step;
	}

	public int getQ_read_count() {
		return q_read_count;
	}

	public void setQ_read_count(int q_read_count) {
		this.q_read_count = q_read_count;
	}

	public String getQ_group_type() {
		return q_group_type;
	}

	public void setQ_group_type(String q_group_type) {
		this.q_group_type = q_group_type;
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

	public Date getQ_create_time() {
		return q_create_time;
	}

	public void setQ_create_time(Date q_create_time) {
		this.q_create_time = q_create_time;
	}

	public Date getQ_modify_time() {
		return q_modify_time;
	}

	public void setQ_modify_time(Date q_modify_time) {
		this.q_modify_time = q_modify_time;
	}
}
