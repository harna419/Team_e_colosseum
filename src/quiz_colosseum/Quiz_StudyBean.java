package quiz_colosseum;
import java.util.*;

public class Quiz_StudyBean {

	private int q_num;//���� ������ȣ(PK)
	private String q_id; // ���� ������ �̸��� ���̵�
	private String q_name;//���� ������ �̸�
	private String q_user_num;//���� ������ ������ȣ
	private String q_nickname;//���� ������ �г���
	private String q_title;//���� Ÿ��Ʋ����
	private String q_title_img;//���� �̹��� ����
	private String q_subject;//���� ������
	private String q_content;//���� �ҳ���
	private String q_content_img;//���� �ҳ��� �̹���
	private String q_reply1;//���� ��1
	private String q_reply2;//���� ��2
	private String q_reply3;//���� ��3
	private String q_reply4;//���� ��4
	private String q_reply5;//���� ��5
	private String q_reply6;//���� ��6
	private String q_reply7;//���� ��7
	private String q_reply8;//���� ��8
	private String q_reply9;//���� ��9
	private String q_reply10;//���� ��10
	private String q_real_reply1;//���� ��10
	private String q_real_reply2;//���� ��2
	private String q_real_reply3;//���� ��3
	private String q_real_reply4;//���� ��4
	private String q_real_reply5;//���� ��5
	private String q_real_reply6;//���� ��6
	private String q_real_reply7;//���� ��7
	private String q_real_reply8;//���� ��8
	private String q_real_reply9;//���� ��9
	private String q_real_reply10;//���� ��10
	private String q_reply1_img;//���� �� �̹���1
	private String q_reply2_img;//���� �� �̹���2
	private String q_reply3_img;//���� �� �̹���3
	private String q_reply4_img;//���� �� �̹���4
	private String q_reply5_img;//���� �� �̹���5
	private String q_reply6_img;//���� �� �̹���6
	private String q_reply7_img;//���� �� �̹���7
	private String q_reply8_img;//���� �� �̹���8
	private String q_reply9_img;//���� �� �̹���9
	private String q_reply10_img;//���� �� �̹���10
	private int q_dep_num;//���� �׷��ȣ(Q_NUM �� ������)
	private int q_dep_step;//����׷칮����ȣ(�ִ�10���� ��ϰ���)
	private int q_read_count;//���� ��ȸ��
	private String q_group_type;//�׷� ���� ����(Y/N)
	private String q_group_num;//�׷� ������ȣ
	private String q_group_name;//���� �׷� �̸�
	private Date q_create_time;//���� ������
	private Date q_modify_time;//���� ������
	private String Q_quiz_type;
	private int cnt;//���� ���� ���ϱ� 
	
	
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public Quiz_StudyBean() {
	}// ����Ʈ ������

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

	public String getQ_quiz_type() {
		return Q_quiz_type;
	}

	public void setQ_quiz_type(String q_quiz_type) {
		Q_quiz_type = q_quiz_type;
	}
	

	
}
