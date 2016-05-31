package Member;
import java.sql.Timestamp;

public class MemberDto {
	private int q_num;
	private String q_id;
	private String q_pwd;
	private String q_name;
	private String q_jumin1;
	private String q_jumin2;
	private String q_nickname;
	private String q_sex;
	private String q_pw_question;
	private String q_pw_reply;
	private Timestamp q_create_time;
	private Timestamp q_modify_time;
	private Timestamp q_access_time;
	
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
	public String getQ_pwd() {
		return q_pwd;
	}
	public void setQ_pwd(String q_pwd) {
		this.q_pwd = q_pwd;
	}
	public String getQ_name() {
		return q_name;
	}
	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}
	public String getQ_jumin1() {
		return q_jumin1;
	}
	public void setQ_jumin1(String q_jumin1) {
		this.q_jumin1 = q_jumin1;
	}
	public String getQ_jumin2() {
		return q_jumin2;
	}
	public void setQ_jumin2(String q_jumin2) {
		this.q_jumin2 = q_jumin2;
	}
	public String getQ_nickname() {
		return q_nickname;
	}
	public void setQ_nickname(String q_nickname) {
		this.q_nickname = q_nickname;
	}
	public String getQ_sex() {
		return q_sex;
	}
	public void setQ_sex(String q_sex) {
		this.q_sex = q_sex;
	}
	public String getQ_pw_question() {
		return q_pw_question;
	}
	public void setQ_pw_question(String q_pw_question) {
		this.q_pw_question = q_pw_question;
	}
	public String getQ_pw_reply() {
		return q_pw_reply;
	}
	public void setQ_pw_reply(String q_pw_reply) {
		this.q_pw_reply = q_pw_reply;
	}
	public Timestamp getQ_create_time() {
		return q_create_time;
	}
	public void setQ_create_time(Timestamp q_create_time) {
		this.q_create_time = q_create_time;
	}
	public Timestamp getQ_modify_time() {
		return q_modify_time;
	}
	public void setQ_modify_time(Timestamp q_modify_time) {
		this.q_modify_time = q_modify_time;
	}
	public Timestamp getQ_access_time() {
		return q_access_time;
	}
	public void setQ_access_time(Timestamp q_access_time) {
		this.q_access_time = q_access_time;
	}
	
	

}
