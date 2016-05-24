package quiz_colosseum;
import java.sql.*;
import java.util.*;

import javax.sql.*;//dataSource
import javax.naming.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;//����

import quiz_colosseum.*;

import java.io.*;//�׸����� ���� �ϱ� ���ؼ�


public class Quiz_StudyMgr {
	
	private Quiz_StudyMgr(){}
	private static Quiz_StudyMgr mgr=new Quiz_StudyMgr();
	public static Quiz_StudyMgr getInstance(){//jsp���� ȣ���Ͽ� ��ü�� ���� �޼���
		return mgr;
	}
	
	//Ŀ�ؼ� Ǯ ���
	private Connection getConnection() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();		
	}//getConnection() end
	
	//��������
	String sql="";//����
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	
	//---------------------------------------
	//  �� ����
	//---------------------------------------
	public Vector quizView(int q_dep_num){
		Vector vec=new Vector();
		try{
			con=getConnection();//Ŀ�ؼ� ���

			sql="select * from qz_quiz_info where q_dep_num="+q_dep_num+" order by q_dep_step asc";
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				Quiz_StudyBean quiz=new Quiz_StudyBean();
				
				quiz.setQ_num(rs.getInt("q_num"));
				quiz.setQ_id(rs.getString("q_id"));
				quiz.setQ_name(rs.getString("q_name"));
				quiz.setQ_user_num(rs.getString("q_user_num"));
				quiz.setQ_nickname(rs.getString("q_nickname"));
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
				
				quiz.setQ_real_reply1(rs.getString("q_real_reply1"));
				quiz.setQ_real_reply2(rs.getString("q_real_reply2"));
				quiz.setQ_real_reply3(rs.getString("q_real_reply3"));
				quiz.setQ_real_reply4(rs.getString("q_real_reply4"));
				quiz.setQ_real_reply5(rs.getString("q_real_reply5"));
				quiz.setQ_real_reply6(rs.getString("q_real_reply6"));
				quiz.setQ_real_reply7(rs.getString("q_real_reply7"));
				quiz.setQ_real_reply8(rs.getString("q_real_reply8"));
				quiz.setQ_real_reply9(rs.getString("q_real_reply9"));
				quiz.setQ_real_reply10(rs.getString("q_real_reply10"));
				
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
				quiz.setQ_group_type(rs.getString("q_group_type"));
				quiz.setQ_group_num(rs.getString("q_group_num"));
				quiz.setQ_group_name(rs.getString("q_group_name"));
				quiz.setQ_read_count(Integer.parseInt(rs.getString("q_read_count")));
				quiz.setQ_create_time(rs.getTimestamp("q_create_time"));
				quiz.setQ_modify_time(rs.getTimestamp("q_modify_time"));
				quiz.setQ_quiz_type(rs.getString("q_quiz_type"));
				vec.add(quiz);
		
			}//while end
			
		}catch(Exception ex){
			System.out.println("quizView()����:"+ex);
			
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return vec;
		
	}//quizView()

	//---------------------------------------
	//  �� ���� + ReadCount �ϱ�
	//---------------------------------------
		public Vector quizSolve(int q_dep_num,int q_dep_step){
			Vector vec=new Vector();
			
			try{
				con=getConnection();//Ŀ�ؼ� ���
				//q_readcount ����
				
				String sql2="update qz_quiz_info set q_read_count=q_read_count+1 where q_dep_num="+q_dep_num+" and q_dep_step="+q_dep_step;
				stmt=con.createStatement();//Statement ����
				stmt.executeUpdate(sql2);//����� ���� ��
		
				//------------------------------------------------------

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
			
		}//quizSolve()
		
		//---------------------------------------
		//  ���� ���� ���ϱ�
		//---------------------------------------
		public Quiz_StudyBean quizCount(int q_dep_num){
			Quiz_StudyBean quiz=new Quiz_StudyBean();
			
			try{
				//ó����
				con=getConnection();//Ŀ�ؼǾ��
				sql="select count(*) as cnt from qz_quiz_info where q_dep_num="+q_dep_num;
				stmt=con.createStatement();
				rs=stmt.executeQuery(sql);
				
				while(rs.next()){
					quiz.setCnt(rs.getInt("cnt"));
					
				}//while end
				
			}catch(Exception ex1){
				System.out.println("quizCount()���� :"+ex1);
				
			}finally{
				try{
					if(rs!=null){rs.close();}
					if(stmt!=null){stmt.close();}
					if(con!=null){con.close();}
				}catch(Exception ex2){}
			}
			return quiz;
			
		}//quizCount () end
		
		
		//-------------------------------------------
		// ���� ��� hisotry �ۼ�
		public void quiz_ResultHistory (HttpServletRequest req,int q_dep_num,int q_dep_step){
			Quiz_StudyBean quiz=new Quiz_StudyBean();
			
			String real_reply="";
			String q_event_type="";
			try{
				//ó����
				con=getConnection();//Ŀ�ؼ� ���
				
				//------------------------------------------------------------------------	
				/*qz_quiz_history ���� ��� ���*/
				for(int i=1;i<=q_dep_step;i++){
					
				String sql2="select * from qz_quiz_info where q_dep_num="+q_dep_num+" and q_dep_step="+i;
				stmt=con.createStatement();
				rs=stmt.executeQuery(sql2);
				if(rs.next()){
					real_reply=rs.getString("q_real_reply1");
					
				}
				
				if(real_reply.equals(req.getParameter("q_real_reply11"))){
					q_event_type = "Y";
					System.out.println("Q_event_type_YES="+q_event_type);
				}else{
					q_event_type = "N";
					System.out.println("Q_event_type_NO="+q_event_type);
				}
				

				String sql="insert into qz_quiz_history(q_title,q_subject,q_content, q_quiz_num, q_quiz_step, q_id, q_nickname, q_name, q_guest_id, q_guest_nickname,"
						+"q_guest_name, q_quiz_event, q_event_time,q_group_type, q_group_num, q_group_name, q_quiz_type, q_custom_reply1, q_custom_reply2, q_custom_reply3, q_custom_reply4, "
						+"q_custom_reply5, q_custom_reply6, q_custom_reply7, q_custom_reply8, q_custom_reply9, q_custom_reply10"
						+") values (?,?,?,?,?,?,?,?,?,?,?,?,NOW(),?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, req.getParameter("q_title"));//Ÿ��Ʋ
				pstmt.setString(2, req.getParameter("q_subject"+i));//Ÿ��Ʋ
				pstmt.setString(3, req.getParameter("q_content"+i));//Ÿ��Ʋ
				pstmt.setInt(4, q_dep_num);//����׷� ��ȣ(Q_DEP_NUM)
				pstmt.setInt(5, i);//���� �׷��ȣ ����(Q_DEP_STEP);
				pstmt.setString(6, req.getParameter("q_id"));//���������� ���̵�
				pstmt.setString(7, req.getParameter("q_nickname"));//���� ������ �г���
				pstmt.setString(8, req.getParameter("q_name"));//���� �������̸�
				pstmt.setString(9, req.getParameter("q_guest_id"));//���� ������
				pstmt.setString(10, req.getParameter("q_guest_nickname"));//���� ������
				pstmt.setString(11, req.getParameter("q_guest_name"));//���� ������
				pstmt.setString(12, q_event_type);//q_quiz_event: I(���� ���), Y(����), N(����)
				//q_event_time: NOW();
				pstmt.setString(13, req.getParameter("q_group_type"));//����׷� Ÿ��
				pstmt.setString(14, req.getParameter("q_group_num"));//����׷� ������ȣ
				pstmt.setString(15, req.getParameter("q_group_name"));//����׷� �̸�
				pstmt.setString(16, req.getParameter("q_quiz_type"+i));//���� ���� Ÿ��(100,200,300,400,500)
				pstmt.setString(17, req.getParameter("q_real_reply"+i+"1"));//NULL
				pstmt.setString(18, req.getParameter("q_real_reply"+i+"2"));//NULL
				pstmt.setString(19, req.getParameter("q_real_reply"+i+"3"));//NULL
				pstmt.setString(20, req.getParameter("q_real_reply"+i+"4"));//NULL
				pstmt.setString(21, req.getParameter("q_real_reply"+i+"5"));//NULL
				pstmt.setString(22, req.getParameter("q_real_reply"+i+"6"));//NULL
				pstmt.setString(23, req.getParameter("q_real_reply"+i+"7"));//NULL
				pstmt.setString(24, req.getParameter("q_real_reply"+i+"8"));//NULL
				pstmt.setString(25, req.getParameter("q_real_reply"+i+"9"));//NULL
				pstmt.setString(26, req.getParameter("q_real_reply"+i+"10"));//NULL
			
				pstmt.executeUpdate();//���� ����
				
				//----------------------------
				
				System.out.println("qz_quiz_history insert");			
				}//for
				}catch(Exception ex1){
					System.out.println("Quiz_resultHistory() ����"+ex1);
					
				}finally{
					try{
						if(rs!=null){rs.close();}
						if(stmt!=null){stmt.close();}
						if(pstmt!=null){pstmt.close();}
						if(con!=null){pstmt.close();}
					}catch(Exception ex2){}
				}//finally
			
		}//Quiz_resultHistory () end
		
		

}//class end
















