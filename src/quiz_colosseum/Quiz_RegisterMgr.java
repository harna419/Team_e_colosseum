package quiz_colosseum;
import java.sql.*;
import java.util.*;

import javax.sql.*;//DataSource
import javax.naming.*;//lookup

//��ǰ ��� �Ϸ���, ���� ���ε�, cos.jar ���
// jdk/jre/lib/ext/cos.jar
// Tomcat7/lib/cos.jar
// ���� ������Ʈ WEB-INF/lib/cos.jar
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;//����

import java.io.*;//�׸����� ���� �ϱ� ���ؼ�

//Ŀ�ؼ�Ǯ ���
//�����Ͻ� ���� : DAO


public class Quiz_RegisterMgr {
	
	//Quiz_RegisterMgr
	//�̱��� ��ü�� ����ϸ� �޸� ���� ȿ��
	private Quiz_RegisterMgr(){}
	private static Quiz_RegisterMgr mgr=new Quiz_RegisterMgr();
	public static Quiz_RegisterMgr getInstance(){//jsp���� ȣ���Ͽ� ��ü�� ���� �޼���
		return mgr;
	}//getInstance()
	
	//Ŀ�ؼ� Ǯ ���
	private Connection getConnection() throws Exception{
		Context ct=new InitialContext();
		String name="java:comp/env/jdbc/mysql";
		DataSource ds=(DataSource)ct.lookup(name);
		return ds.getConnection();
	}//getConnection()
	
	//��������
	String sql="";
	Connection con=null;
	Statement stmt=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;	
	
	public boolean Quiz_insert(HttpServletRequest req){
		boolean result=false;
			
			int q_dep_num=0;//���� �׷� ��ȣ
			int q_dep_step=0;///���� �׷��ȣ ����
			
			try{
				//ó����
				con=getConnection();//Ŀ�ؼ� ���
				
				//q_q_dep_num ���ϱ�
				String sql2="select max(q_dep_num) from qz_quiz_info";
				stmt=con.createStatement();//Statement ����
				rs=stmt.executeQuery(sql2);
			
			if(rs.next()){
				q_dep_num=rs.getInt(1)+1;
			}
			
			//------------------------------------------------------------------------
			
			String real_path=req.getServletContext().getRealPath("/");//���� ��� ���
			String upload_Dir=real_path+"/imgs/";//��ǰ ��� �Ϸ���
			
			//cos.jar ���, ���� ���ε�
			MultipartRequest multi=new MultipartRequest(req, upload_Dir, 512*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			int cnt=Integer.parseInt(multi.getParameter("count"));
			for(int i=1;i<=cnt;i++){
				
			String type=multi.getParameter("q_quiz_type"+i);
			
			if(type.equals("100")||type.equals("200")||type.equals("300")){	
				
				sql="INSERT INTO qz_quiz_info(q_id,q_name,q_user_num,q_nickname"
						+ ",q_title,q_title_img,q_subject,q_content,q_content_img"
						+ ",q_reply1,q_reply2,q_reply3,q_reply4,q_reply5,q_reply6,q_reply7,q_reply8"
						+ ",q_reply9,q_reply10,q_real_reply1,q_real_reply2,q_real_reply3,q_real_reply4"
						+ ",q_real_reply5,q_real_reply6,q_real_reply7,q_real_reply8,q_real_reply9"
						+ ",q_real_reply10,q_reply1_img,q_reply2_img,q_reply3_img,q_reply4_img"
						+ ",q_reply5_img,q_reply6_img,q_reply7_img,q_reply8_img,q_reply9_img,q_reply10_img"
						+ ",q_dep_num,q_dep_step,q_read_count,q_group_type,q_group_num,q_group_name"
						+ ",q_create_time,q_modify_time,q_quiz_type) "
						+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?"
						+ ",?,?,?,?,?,NOW(),NOW(),?)";
				System.out.println("�ְ���,�����Ĵ���,�����ĺ���");
				pstmt=con.prepareStatement(sql);

				pstmt.setString(1, multi.getParameter("q_id"));//request.getParameter, Ŭ���̾�Ʈ���� �Ѿ�� ������ 
				pstmt.setString(2, multi.getParameter("q_name"));
				pstmt.setString(3, multi.getParameter("q_user_num"));
				pstmt.setString(4, multi.getParameter("q_nickname"));
				pstmt.setString(5, multi.getParameter("q_title"));

				if(multi.getFilesystemName("q_title_img")!=null){//�׸������� ���� ��
					pstmt.setString(6, multi.getFilesystemName("q_title_img"));
				}else{//�׸������� ���� ��
					pstmt.setString(6, "NoImage.png");
				}//else
				pstmt.setString(7, multi.getParameter("q_subject"+i));
				pstmt.setString(8, multi.getParameter("q_content"+i));

				if(multi.getFilesystemName("q_content_img"+i)!=null){//�׸������� ���� ��
					pstmt.setString(9, multi.getFilesystemName("q_content_img"+i));
				}else{//�׸������� ���� ��
					pstmt.setString(9, "NoImage.png");
				}//else
				
				if(multi.getParameter("q_reply"+i+1)!=null){//���� ���� ��
					pstmt.setString(10, multi.getParameter("q_reply"+i+1));
				}else{//�׸������� ���� ��
					pstmt.setString(10, "");
				}//else
				//pstmt.setString(10, multi.getParameter("q_reply"+i+1));
				if(multi.getParameter("q_reply"+i+2)!=null){//���� ���� ��
					pstmt.setString(11, multi.getParameter("q_reply"+i+2));
				}else{//�׸������� ���� ��
					pstmt.setString(11, "");
				}//else
				//pstmt.setString(11, multi.getParameter("q_reply"+i+2));
				if(multi.getParameter("q_reply"+i+3)!=null){//���� ���� ��
					pstmt.setString(12, multi.getParameter("q_reply"+i+3));
				}else{//�׸������� ���� ��
					pstmt.setString(12, "");
				}//else
				//pstmt.setString(12, multi.getParameter("q_reply"+i+3));
				if(multi.getParameter("q_reply"+i+4)!=null){//���� ���� ��
					pstmt.setString(13, multi.getParameter("q_reply"+i+4));
				}else{//�׸������� ���� ��
					pstmt.setString(13, "");
				}//else
				//pstmt.setString(13, multi.getParameter("q_reply"+i+4));
				if(multi.getParameter("q_reply"+i+5)!=null){//���� ���� ��
					pstmt.setString(14, multi.getParameter("q_reply"+i+5));
				}else{//�׸������� ���� ��
					pstmt.setString(14, "");
				}//else
				//pstmt.setString(14, multi.getParameter("q_reply"+i+5));
				if(multi.getParameter("q_reply"+i+6)!=null){//���� ���� ��
					pstmt.setString(15, multi.getParameter("q_reply"+i+6));
				}else{//�׸������� ���� ��
					pstmt.setString(15, "");
				}//else
				//pstmt.setString(15, multi.getParameter("q_reply"+i+6));
				if(multi.getParameter("q_reply"+i+7)!=null){//���� ���� ��
					pstmt.setString(16, multi.getParameter("q_reply"+i+7));
				}else{//�׸������� ���� ��
					pstmt.setString(16, "");
				}//else
				
				//pstmt.setString(16, multi.getParameter("q_reply"+i+7));
				if(multi.getParameter("q_reply"+i+8)!=null){//���� ���� ��
					pstmt.setString(17, multi.getParameter("q_reply"+i+8));
				}else{//�׸������� ���� ��
					pstmt.setString(17, "");
				}//else
				//pstmt.setString(17, multi.getParameter("q_reply"+i+8));
				if(multi.getParameter("q_reply"+i+9)!=null){//���� ���� ��
					pstmt.setString(18, multi.getParameter("q_reply"+i+9));
				}else{//�׸������� ���� ��
					pstmt.setString(18, "");
				}//else
				//pstmt.setString(18, multi.getParameter("q_reply"+i+9));

				if(multi.getParameter("q_reply"+i+10)!=null){//���� ���� ��
					pstmt.setString(19, multi.getParameter("q_reply"+i+10));
				}else{//�׸������� ���� ��
					pstmt.setString(19, "");
				}//else			
				//pstmt.setString(19, multi.getParameter("q_reply"+i+10));
				
				if(multi.getParameter("q_real_reply"+i+1)!=null){//���� ���� ��
					pstmt.setString(20, multi.getParameter("q_real_reply"+i+1));
				}else{//�׸������� ���� ��
					pstmt.setString(20, "");
				}//else			
				//pstmt.setString(20, multi.getParameter("q_real_reply"+i+1));
				
				if(multi.getParameter("q_real_reply"+i+2)!=null){//���� ���� ��
					pstmt.setString(21, multi.getParameter("q_real_reply"+i+2));
				}else{//�׸������� ���� ��
					pstmt.setString(21, "");
				}//else
				//pstmt.setString(21, multi.getParameter("q_real_reply"+i+2));
				
				if(multi.getParameter("q_real_reply"+i+3)!=null){//���� ���� ��
					pstmt.setString(22, multi.getParameter("q_real_reply"+i+3));
				}else{//�׸������� ���� ��
					pstmt.setString(22, "");
				}//else
				//pstmt.setString(22, multi.getParameter("q_real_reply"+i+3));
				
				if(multi.getParameter("q_real_reply"+i+4)!=null){//���� ���� ��
					pstmt.setString(23, multi.getParameter("q_real_reply"+i+4));
				}else{//�׸������� ���� ��
					pstmt.setString(23, "");
				}//else
				//pstmt.setString(23, multi.getParameter("q_real_reply"+i+4));
				
				if(multi.getParameter("q_real_reply"+i+5)!=null){//���� ���� ��
					pstmt.setString(24, multi.getParameter("q_real_reply"+i+5));
				}else{//�׸������� ���� ��
					pstmt.setString(24, "");
				}//else
				//pstmt.setString(24, multi.getParameter("q_real_reply"+i+5));
				
				if(multi.getParameter("q_real_reply"+i+6)!=null){//���� ���� ��
					pstmt.setString(25, multi.getParameter("q_real_reply"+i+6));
				}else{//�׸������� ���� ��
					pstmt.setString(25, "");
				}//else
				//pstmt.setString(25, multi.getParameter("q_real_reply"+i+6));
				
				if(multi.getParameter("q_real_reply"+i+7)!=null){//���� ���� ��
					pstmt.setString(26, multi.getParameter("q_real_reply"+i+7));
				}else{//�׸������� ���� ��
					pstmt.setString(26, "");
				}//else
				//pstmt.setString(26, multi.getParameter("q_real_reply"+i+7));
				
				if(multi.getParameter("q_real_reply"+i+8)!=null){//���� ���� ��
					pstmt.setString(27, multi.getParameter("q_real_reply"+i+8));
				}else{//�׸������� ���� ��
					pstmt.setString(27, "");
				}//else
				//pstmt.setString(27, multi.getParameter("q_real_reply"+i+8));
				
				if(multi.getParameter("q_real_reply"+i+9)!=null){//���� ���� ��
					pstmt.setString(28, multi.getParameter("q_real_reply"+i+9));
				}else{//�׸������� ���� ��
					pstmt.setString(28, "");
				}//else
				//pstmt.setString(28, multi.getParameter("q_real_reply"+i+9));
				
				if(multi.getParameter("q_real_reply"+i+10)!=null){//���� ���� ��
					pstmt.setString(29, multi.getParameter("q_real_reply"+i+10));
				}else{//�׸������� ���� ��
					pstmt.setString(29, "");
				}//else
				//pstmt.setString(29, multi.getParameter("q_real_reply"+i+10));
				
				if(multi.getFilesystemName("q_reply"+i+"_img1")!=null){//�׸������� ���� ��
					pstmt.setString(30, multi.getFilesystemName("q_reply"+i+"_img1"));
				}else{//�׸������� ���� ��
					pstmt.setString(30, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img2")!=null){//�׸������� ���� ��
					pstmt.setString(31, multi.getFilesystemName("q_reply"+i+"_img2"));
				}else{//�׸������� ���� ��
					pstmt.setString(31, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img3")!=null){//�׸������� ���� ��
					pstmt.setString(32, multi.getFilesystemName("q_reply"+i+"_img3"));
				}else{//�׸������� ���� ��
					pstmt.setString(32, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img4")!=null){//�׸������� ���� ��
					pstmt.setString(33, multi.getFilesystemName("q_reply"+i+"_img4"));
				}else{//�׸������� ���� ��
					pstmt.setString(33, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img5")!=null){//�׸������� ���� ��
					pstmt.setString(34, multi.getFilesystemName("q_reply"+i+"_img5"));
				}else{//�׸������� ���� ��
					pstmt.setString(34, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img6")!=null){//�׸������� ���� ��
					pstmt.setString(35, multi.getFilesystemName("q_reply"+i+"_img6"));
				}else{//�׸������� ���� ��
					pstmt.setString(35, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img7")!=null){//�׸������� ���� ��
					pstmt.setString(36, multi.getFilesystemName("q_reply"+i+"_img7"));
				}else{//�׸������� ���� ��
					pstmt.setString(36, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img8")!=null){//�׸������� ���� ��
					pstmt.setString(37, multi.getFilesystemName("q_reply"+i+"_img8"));
				}else{//�׸������� ���� ��
					pstmt.setString(37, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img9")!=null){//�׸������� ���� ��
					pstmt.setString(38, multi.getFilesystemName("q_reply"+i+"_img9"));
				}else{//�׸������� ���� ��
					pstmt.setString(38, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img10")!=null){//�׸������� ���� ��
					pstmt.setString(39, multi.getFilesystemName("q_reply"+i+"_img10"));
				}else{//�׸������� ���� ��
					pstmt.setString(39, "NoImage.png");
				}//else
				
				pstmt.setInt(40, q_dep_num);//����׷� ��ȣ : q_dep_num
				pstmt.setInt(41, q_dep_step+i);///���� �׷��ȣ ����
				pstmt.setInt(42, 0);//��ȸ�� : q_read_count �⺻ 0
				pstmt.setString(43, multi.getParameter("q_group_type"+i));
				pstmt.setString(44, multi.getParameter("q_group_num"+i));
				pstmt.setString(45, multi.getParameter("q_group_name"+i));
				//�ð�
				//������
				pstmt.setString(46, multi.getParameter("q_quiz_type"+i));
				
				int count=pstmt.executeUpdate();//���� ����
		
				System.out.println("Query ����:"+count);			
				if(count==1){
					result=true;
				}//if
				
				}else if(type.equals("400")){
					System.out.println("OXŸ��");
				
				}else if(type.equals("500")){
					System.out.println("ǥŸ��");
				}
			//------------------------------------------------------------------------	
			/*qz_quiz_history ���� ���� event history ���*/
			
			String sql3="insert into qz_quiz_history(q_title,q_subject,q_content, q_quiz_num, q_quiz_step, q_id, q_nickname, q_name, q_guest_id, q_guest_nickname,"
					+"q_guest_name, q_quiz_event, q_event_time,q_group_type, q_group_num, q_group_name, q_quiz_type"
					+") values (?,?,?,?,?,?,?,?,?,?,?,'I',NOW(),?,?,?,?)";
			
			pstmt=con.prepareStatement(sql3);
			
			pstmt.setString(1, multi.getParameter("q_title"));//Ÿ��Ʋ
			pstmt.setString(2, multi.getParameter("q_subject"+i));//������
			pstmt.setString(3, multi.getParameter("q_content"+i));//����
		
			pstmt.setInt(4, q_dep_num);//����׷� ��ȣ(Q_DEP_NUM)
			pstmt.setInt(5, q_dep_step+i);//���� �׷��ȣ ����(Q_DEP_STEP);
			pstmt.setString(6, multi.getParameter("q_id"));//���������� ���̵�
			pstmt.setString(7, multi.getParameter("q_nickname"));//���� ������ �г���
			pstmt.setString(8, multi.getParameter("q_name"));//���� �������̸�
			
			pstmt.setString(9, multi.getParameter("q_guest_id"));//���� ������
			pstmt.setString(10, multi.getParameter("q_guest_nickname"));//���� ������
			pstmt.setString(11, multi.getParameter("q_guest_name"));//���� ������
			//I ���� EVENT//I(���� ���)
			//NOW();
			pstmt.setString(12, multi.getParameter("q_group_type"));//����׷� Ÿ��
			pstmt.setString(13, multi.getParameter("q_group_num"));//����׷� ������ȣ
			pstmt.setString(14, multi.getParameter("q_group_name"));//����׷� �̸�
			pstmt.setString(15, type);//���� ���� Ÿ��(100,200,300,400,500)
			
			int count=pstmt.executeUpdate();//���� ����
			
			System.out.println("Query ����:"+count);			
			if(count==1){
				result=true;
			}//if
		  }//for
		
		}catch(Exception ex1){
			System.out.println("Quiz_insert����:"+ex1);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
				
			}catch(Exception exx){}
		}//finally
		return result;
		
	}//Quiz_insert()
	

	//------------------------------------------------------------------------
	
	public Vector quizUpdate(int q_dep_num,int q_dep_step){
		Vector vec=new Vector();
		
		try{
			con=getConnection();//Ŀ�ؼ� ���			

			sql="select * from qz_quiz_info where q_dep_num="+q_dep_num+" order by q_dep_step asc";
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			//System.out.println("num:"+q_dep_num);
			//System.out.println("step:"+q_dep_step);
			
			while(rs.next()){
				Quiz_StudyBean quiz=new Quiz_StudyBean();
				
				quiz.setQ_num(rs.getInt("q_Num"));
				quiz.setQ_title(rs.getString("q_title"));
				quiz.setQ_title_img(rs.getString("q_title_img"));
				quiz.setQ_subject(rs.getString("q_subject"));
				quiz.setQ_content(rs.getString("q_content"));
				quiz.setQ_content_img(rs.getString("q_content_img"));
				quiz.setQ_reply1(rs.getString("q_reply1"));
				quiz.setQ_reply2(rs.getString("q_reply2"));
				quiz.setQ_reply3(rs.getString("q_reply3"));
				quiz.setQ_reply4(rs.getString("q_reply4"));
				quiz.setQ_reply5(rs.getString("q_reply5"));
				quiz.setQ_reply6(rs.getString("q_reply6"));
				quiz.setQ_reply7(rs.getString("q_reply7"));
				quiz.setQ_reply8(rs.getString("q_reply8"));
				quiz.setQ_reply9(rs.getString("q_reply9"));
				quiz.setQ_reply10(rs.getString("q_reply10"));
				quiz.setQ_reply1_img(rs.getString("q_reply1_img"));
				quiz.setQ_reply2_img(rs.getString("q_reply2_img"));
				quiz.setQ_reply3_img(rs.getString("q_reply3_img"));
				quiz.setQ_reply4_img(rs.getString("q_reply4_img"));
				quiz.setQ_reply5_img(rs.getString("q_reply5_img"));
				quiz.setQ_reply6_img(rs.getString("q_reply6_img"));
				quiz.setQ_reply7_img(rs.getString("q_reply7_img"));
				quiz.setQ_reply8_img(rs.getString("q_reply8_img"));
				quiz.setQ_reply9_img(rs.getString("q_reply9_img"));
				quiz.setQ_reply10_img(rs.getString("q_reply10_img"));
				quiz.setQ_dep_num(rs.getInt("q_dep_num"));
				quiz.setQ_dep_step(rs.getInt("q_dep_step"));
				quiz.setQ_read_count(Integer.parseInt(rs.getString("q_read_count")));
				quiz.setQ_create_time(rs.getTimestamp("q_create_time"));
				quiz.setQ_quiz_type(rs.getString("q_quiz_type"));
				vec.add(quiz);
		
			}//while end
			
		}catch(Exception ex){
			System.out.println("quizSolve()����:"+ex);
			
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return vec;
		
	}//quizUpdate()

	//------------------------------------------------------------------------
	
	//���� ����
	public int quiz_del(int q_dep_num){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String dbPwd="";
		int x=-1;
		try{
			//ó����
			con=getConnection();
			sql="select * from qz_quiz_info where q_dep_num=?";
			pstmt=con.prepareStatement(sql);
			//?�� ä���
			pstmt.setInt(1, q_dep_num);
			rs=pstmt.executeQuery();//��������
			/////////////////////////////////////////////
			if(rs.next()){
				//dbPwd=rs.getString("passwd");
				//if(dbPwd.equals(passwd)){//��й�ȣ�� ��ġ�ϸ�
					//�����۾�
					String sql2="delete from qz_quiz_info where q_dep_num=?";
					pstmt=con.prepareStatement(sql2);
					pstmt.setInt(1,q_dep_num);
					
					pstmt.executeUpdate();
					x=1;//���� ����
				//}else{
				//	x=0;//���� ����, ��й�ȣ Ʋ��
				//}//else
			}//if
			
		}catch(Exception ex1){
			System.out.println("quiz_del����:"+ex1);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return x;
	}
}//class
