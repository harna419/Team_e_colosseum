package quiz_colosseum;

import java.sql.*;
import java.util.*;

import javax.sql.*;//dataSource
import javax.naming.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;//占쏙옙占�

import quiz_colosseum.*;

import java.io.*;//占쌓몌옙占쏙옙占쏙옙 占쏙옙占쏙옙 占싹깍옙 占쏙옙占쌔쇽옙

public class Quiz_ScoreMgr {
		
		//占싱깍옙占쏙옙 占쏙옙체占쏙옙 占쏙옙占쏙옙玖占�占쌨몌옙 占쏙옙占�효占쏙옙
		private Quiz_ScoreMgr(){}
		private static Quiz_ScoreMgr mgr=new Quiz_ScoreMgr();
		public static Quiz_ScoreMgr getInstance(){//jsp占쏙옙占쏙옙 호占쏙옙占싹울옙 占쏙옙체占쏙옙 占쏙옙載∽옙占�占쌨쇽옙占쏙옙
			return mgr;
		}//getInstance()
		
		//커占쌔쇽옙 풀 占쏙옙占�
		private Connection getConnection() throws Exception{
			Context ct=new InitialContext();
			String name="java:comp/env/jdbc/mysql";
			DataSource ds=(DataSource)ct.lookup(name);
			return ds.getConnection();
		}//getConnection()
		
		//占쏙옙占�
		String sql="";
		Connection con=null;
		Statement stmt=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;	
	
			//---------------------------------------
			//  占쏙옙占쏙옙 占쏙옙占쏙옙占�
			//---------------------------------------
			
			public List quizScore(int q_dep_num,String q_id){
				List <Quiz_ScoreBean>list=new ArrayList<Quiz_ScoreBean>();
				//Quiz_ScoreBean cnt=new Quiz_ScoreBean();
				
				
				int nowcount=0;
				//String userid="admin";
				
	
				try{
					con=getConnection();//커占쌔쇽옙 占쏙옙占�
					
					String sql2="select count(*) as cnt from qz_quiz_info where q_dep_num="+q_dep_num;
					stmt=con.createStatement();
					rs=stmt.executeQuery(sql2);

					while(rs.next()){
						
						nowcount=rs.getInt(1);
					}//while end
					
					
					sql="select * from qz_quiz_history where q_quiz_num="+q_dep_num+" and q_id='"+q_id+"' order by q_quiz_step asc limit 0,"+nowcount;
							
					stmt=con.createStatement();
					rs=stmt.executeQuery(sql);
					
					while(rs.next()){
						Quiz_ScoreBean quiz=new Quiz_ScoreBean();
						
						quiz.setQ_num(rs.getInt("q_num"));
						quiz.setQ_title(rs.getString("q_title"));
						quiz.setQ_subject(rs.getString("q_subject"));
						quiz.setQ_content(rs.getString("q_content"));
						quiz.setQ_quiz_num(rs.getInt("q_quiz_num"));
						quiz.setQ_quiz_step(rs.getInt("q_quiz_step"));
						quiz.setQ_id(rs.getString("q_id"));
						quiz.setQ_nickname(rs.getString("q_nickname"));
						quiz.setQ_name(rs.getString("q_name"));
						quiz.setQ_guest_id(rs.getString("q_guest_id"));
						quiz.setQ_guest_nickname(rs.getString("q_guest_nickname"));
						quiz.setQ_guest_name(rs.getString("q_guest_name"));
						quiz.setQ_quiz_event(rs.getString("q_quiz_event"));//q_quiz_event: I(占쏙옙占쏙옙 占쏙옙占�, Y(占쏙옙占쏙옙), N(占쏙옙占쏙옙)
						quiz.setQ_event_time(rs.getDate("q_event_time"));
						quiz.setQ_qroup_type(rs.getString("q_group_type"));
						quiz.setQ_group_num(rs.getString("q_group_num"));
						quiz.setQ_group_name(rs.getString("q_group_name"));
						quiz.setQ_quiz_type(rs.getString("q_quiz_type"));//占쏙옙占쏙옙 占쏙옙占쏙옙 타占쏙옙(100,200,300,400,500)
						quiz.setQ_custom_reply1(rs.getString("q_custom_reply1"));
						quiz.setQ_custom_reply2(rs.getString("q_custom_reply2"));
						quiz.setQ_custom_reply3(rs.getString("q_custom_reply3"));
						quiz.setQ_custom_reply4(rs.getString("q_custom_reply4"));
						quiz.setQ_custom_reply5(rs.getString("q_custom_reply5"));
						quiz.setQ_custom_reply6(rs.getString("q_custom_reply6"));
						quiz.setQ_custom_reply7(rs.getString("q_custom_reply7"));
						quiz.setQ_custom_reply8(rs.getString("q_custom_reply8"));
						quiz.setQ_custom_reply9(rs.getString("q_custom_reply9"));
						quiz.setQ_custom_reply10(rs.getString("q_custom_reply10"));
						
						list.add(quiz);
				
					}//while end
					
				}catch(Exception ex){
					System.out.println("quizScroe()占쏙옙占쏙옙:"+ex);
					
				}finally{
					try{
						if(rs!=null){rs.close();}
						if(stmt!=null){stmt.close();}
						if(con!=null){con.close();}
					}catch(Exception exx){}
				}//finally
				return list;
				
			}//quizScroe()
			
			
			public Quiz_ScoreBean quizScoreCount(String q_id){
				
				int totalcount=0;
				int yescount=0;
				int nocount=0;
				
				Quiz_ScoreBean quiz=null;
						
				try{
					quiz=new Quiz_ScoreBean();
					con=getConnection();//커占쌔쇽옙 占쏙옙占�
					
				   
					String sql="select count(*) as totalcount from qz_quiz_history where q_id='"+q_id+"'";
					stmt=con.createStatement();
					rs=stmt.executeQuery(sql);

					while(rs.next()){
						
						quiz.setTotalcount(rs.getInt(1));
					}//while end
					
					
					String sql2="select count(*) as yescount from qz_quiz_history where q_quiz_event='Y' and q_id='"+q_id+"'";
					stmt=con.createStatement();
					rs=stmt.executeQuery(sql2);

					while(rs.next()){
						
						yescount=rs.getInt(1);
						quiz.setYescount(yescount);
					}//while end
					
					
					String sql3="select count(*) as nocount from qz_quiz_history where q_quiz_event='N' and q_id='"+q_id+"'";
					stmt=con.createStatement();
					rs=stmt.executeQuery(sql3);

					while(rs.next()){
						
						nocount=rs.getInt(1);
						quiz.setNocount(nocount);
					}//while end
					
					
					
				}catch(Exception ex){
					System.out.println("quizScroe()占쏙옙占쏙옙:"+ex);
					
				}finally{
					try{
						if(rs!=null){rs.close();}
						if(stmt!=null){stmt.close();}
						if(con!=null){con.close();}
					}catch(Exception exx){}
				}//finally
				return quiz;
				
			}//quizScroe()
			////////////////////////////////////////////////
			public List getMyQuizList(String q_id) throws Exception{
				sql="";//占쏙옙占쏙옙
				con=null;
				stmt=null;
				rs=null;
				List <Quiz_ScoreBean> getMyQuizList=new ArrayList<Quiz_ScoreBean>();
				
				try{
					//처占쏙옙占쏙옙占쏙옙
					con=getConnection();
					sql="select * from qz_quiz_info where q_id='"+q_id+"'";
					//group q_dep_num
					stmt=con.createStatement();//Statement 占쏙옙
					rs=stmt.executeQuery(sql);//占쏙옙占쏙옙占�占쏙옙占쏙옙 占쏙옙載�
					
					while(rs.next()){
						Quiz_ScoreBean bean=new Quiz_ScoreBean(); 
						 
						bean.setQ_num(rs.getInt("q_num"));
						bean.setQ_title(rs.getString("Q_title"));
						bean.setQ_subject(rs.getString("Q_subject"));
				
						
						getMyQuizList.add(bean);//占쏜델븝옙占쏙옙 List占쏙옙 占쌍는댐옙.
					
					}//while end			
					
				}catch(Exception ex){
					System.out.println("getMyzList() 占쏙옙占쏙옙 : "+ex);
				}finally{
					try{
						if(rs!=null){rs.close();}
						if(stmt!=null){stmt.close();}
						if(con!=null){con.close();}
						
					}catch(Exception ex1){}
				}//finally
				
				return getMyQuizList;
				
			}//getQuizList () end
			
			public List quizPlaygame(String q_id){
				
				
				sql="";//占쏙옙占쏙옙
				con=null;
				stmt=null;
				rs=null;
				List <Quiz_ScoreBean> playQuizList=new ArrayList<Quiz_ScoreBean>();
				
				try{
					//처占쏙옙占쏙옙占쏙옙
					con=getConnection();
					sql="select * from qz_quiz_history where q_id='"+q_id+"' and not q_quiz_event='I'";
					//group q_dep_num
					stmt=con.createStatement();//Statement 占쏙옙
					rs=stmt.executeQuery(sql);//占쏙옙占쏙옙占�占쏙옙占쏙옙 占쏙옙載�
					
					while(rs.next()){
						Quiz_ScoreBean bean=new Quiz_ScoreBean(); 
						 
						bean.setQ_num(rs.getInt("q_num"));
						bean.setQ_title(rs.getString("Q_title"));
						bean.setQ_subject(rs.getString("Q_subject"));
				
						
						playQuizList.add(bean);//占쏜델븝옙占쏙옙 List占쏙옙 占쌍는댐옙.
					
					}//while end			
					
				}catch(Exception ex){
					System.out.println("quizPlaygame()占쏙옙占쏙옙:"+ex);
					
				}finally{
					try{
						if(rs!=null){rs.close();}
						if(stmt!=null){stmt.close();}
						if(con!=null){con.close();}
					}catch(Exception exx){}
				}//finally
				return playQuizList;
				
			}//quizScroe()

}//class end
