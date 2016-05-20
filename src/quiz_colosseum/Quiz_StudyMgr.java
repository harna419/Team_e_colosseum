package quiz_colosseum;
import java.sql.*;
import java.util.*;

import javax.sql.*;//dataSource
import javax.naming.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;//서블릿

import quiz_colosseum.*;

import java.io.*;//그림파일 삭제 하기 위해서


public class Quiz_StudyMgr {
	
	private Quiz_StudyMgr(){}
	private static Quiz_StudyMgr mgr=new Quiz_StudyMgr();
	public static Quiz_StudyMgr getInstance(){//jsp에서 호출하여 객체를 얻어가는 메서드
		return mgr;
	}
	
	//커넥션 풀 사용
	private Connection getConnection() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();		
	}//getConnection() end
	
	//전역변수
	String sql="";//변수
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	PreparedStatement pstmt=null;

	//---------------------------------------
	//  상세 보기
	//---------------------------------------
		public Quiz_ListBean quizSolve(int q_dep_num,int q_dep_step){
			Quiz_ListBean quiz=new Quiz_ListBean();
			
			try{
				
				con=getConnection();//커넥션 얻기
				
				//q_readcount 증가
				
				String sql2="update qz_quiz_info set q_read_count=q_read_count+1 where q_dep_num="+q_dep_num+" and q_dep_step="+q_dep_step;
				stmt=con.createStatement();//Statement 생성
				stmt.executeUpdate(sql2);//실행시 인자 들어감
		
				//------------------------------------------------------
				//처리문
				
				sql="select * from qz_quiz_info where q_dep_num="+q_dep_num+" and q_dep_step="+q_dep_step+" order by q_dep_step desc";
				stmt=con.createStatement();
				rs=stmt.executeQuery(sql);
				
				while(rs.next()){
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
			

				}//while end
			}catch(Exception ex){
				System.out.println("quizSolve()예외:"+ex);
			}finally{
				try{
					if(rs!=null){rs.close();}
					if(stmt!=null){stmt.close();}
					if(con!=null){con.close();}
				}catch(Exception exx){}
			}//finally
			return quiz;
		}//getDetails()
		
		//---------------------------------------
		//  문제 개수 구하기
		//---------------------------------------
		public Quiz_ListBean quizCount(int q_dep_num){
			Quiz_ListBean quiz=new Quiz_ListBean();
			
			try{
				//처리문
				con=getConnection();//커넥션얻기
				sql="select count(*) as cnt from qz_quiz_info where q_dep_num="+q_dep_num;
				stmt=con.createStatement();
				rs=stmt.executeQuery(sql);
				
				while(rs.next()){
					quiz.setCnt(rs.getInt("cnt"));	
				}//while end
				
				
			}catch(Exception ex1){
				System.out.println("quizCount()예외 :"+ex1);
			}finally{
				try{
					if(rs!=null){rs.close();}
					if(stmt!=null){stmt.close();}
					if(con!=null){con.close();}
				}catch(Exception ex2){}
			}
			return quiz;
		}

}
















