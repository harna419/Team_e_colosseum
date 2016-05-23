package quiz_colosseum;
import java.sql.*;
import java.util.*;

import javax.sql.*;//DataSource
import javax.naming.*;//lookup

//상품 등록 하려고, 파일 업로드, cos.jar 사용
// jdk/jre/lib/ext/cos.jar
// Tomcat7/lib/cos.jar
// 현재 프로젝트 WEB-INF/lib/cos.jar
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;//서블릿

import java.io.*;//그림파일 삭제 하기 위해서

//커넥션풀 사용
//비지니스 로직 : DAO


public class Quiz_RegisterMgr {
	
//Quiz_RegisterMgr
	//싱글톤 객체를 사용하면 메모리 절약 효과
	private Quiz_RegisterMgr(){}
	private static Quiz_RegisterMgr mgr=new Quiz_RegisterMgr();
	public static Quiz_RegisterMgr getInstance(){//jsp에서 호출하여 객체를 얻어가는 메서드
		return mgr;
	}//getInstance()
	
	//커넥션 풀 사용
	private Connection getConnection() throws Exception{
		Context ct=new InitialContext();
		String name="java:comp/env/jdbc/mysql";
		DataSource ds=(DataSource)ct.lookup(name);
		return ds.getConnection();
	}//getConnection()
	
	//전역변수
	String sql="";
	Connection con=null;
	Statement stmt=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;	
	
	public boolean Quiz_insert(HttpServletRequest req){
		boolean result=false;
			
			int q_dep_num=0;//퀴즈 그룹 번호
			int q_dep_step=0;//퀴즈 그룹 문제 순서 및 번호
			
			try{
			//처리문
			con=getConnection();//커넥션 얻기
			
			//q_q_dep_num 구하기
			String sql2="select max(q_dep_num) from qz_quiz_info";
			stmt=con.createStatement();//Statement 생성
			rs=stmt.executeQuery(sql2);
			
			if(rs.next()){
				q_dep_num=rs.getInt(1)+1;
			}
			
			//------------------------------------------------------------------------
			
			String real_path=req.getServletContext().getRealPath("/");//실제 경로 얻기
			String upload_Dir=real_path+"/imgs/";//상품 등록 하려고
			
			//cos.jar 사용, 파일 업로드
			MultipartRequest multi=new MultipartRequest(req, upload_Dir, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
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
				System.out.println("주관식,객관식단일,객관식복수");
				pstmt=con.prepareStatement(sql);

				pstmt.setString(1, multi.getParameter("q_id"));//request.getParameter, 클라이언트에서 넘어온 데이터 
				pstmt.setString(2, multi.getParameter("q_name"));
				pstmt.setString(3, multi.getParameter("q_user_num"));
				pstmt.setString(4, multi.getParameter("q_nickname"));
				pstmt.setString(5, multi.getParameter("q_title"));

				if(multi.getFilesystemName("q_title_img")!=null){//그림파일이 있을 때
					pstmt.setString(6, multi.getFilesystemName("q_title_img"));
				}else{//그림파일이 없을 때
					pstmt.setString(6, "NoImage.png");
				}//else
				pstmt.setString(7, multi.getParameter("q_subject"+i));
				pstmt.setString(8, multi.getParameter("q_content"+i));

				if(multi.getFilesystemName("q_content_img"+i)!=null){//그림파일이 있을 때
					pstmt.setString(9, multi.getFilesystemName("q_content_img"+i));
				}else{//그림파일이 없을 때
					pstmt.setString(9, "NoImage.png");
				}//else
				
				if(multi.getParameter("q_reply"+i+1)!=null){//답이 있을 때
					pstmt.setString(10, multi.getParameter("q_reply"+i+1));
				}else{//그림파일이 없을 때
					pstmt.setString(10, "");
				}//else
				//pstmt.setString(10, multi.getParameter("q_reply"+i+1));
				if(multi.getParameter("q_reply"+i+2)!=null){//답이 있을 때
					pstmt.setString(11, multi.getParameter("q_reply"+i+2));
				}else{//그림파일이 없을 때
					pstmt.setString(11, "");
				}//else
				//pstmt.setString(11, multi.getParameter("q_reply"+i+2));
				if(multi.getParameter("q_reply"+i+3)!=null){//답이 있을 때
					pstmt.setString(12, multi.getParameter("q_reply"+i+3));
				}else{//그림파일이 없을 때
					pstmt.setString(12, "");
				}//else
				//pstmt.setString(12, multi.getParameter("q_reply"+i+3));
				if(multi.getParameter("q_reply"+i+4)!=null){//답이 있을 때
					pstmt.setString(13, multi.getParameter("q_reply"+i+4));
				}else{//그림파일이 없을 때
					pstmt.setString(13, "");
				}//else
				//pstmt.setString(13, multi.getParameter("q_reply"+i+4));
				if(multi.getParameter("q_reply"+i+5)!=null){//답이 있을 때
					pstmt.setString(14, multi.getParameter("q_reply"+i+5));
				}else{//그림파일이 없을 때
					pstmt.setString(14, "");
				}//else
				//pstmt.setString(14, multi.getParameter("q_reply"+i+5));
				if(multi.getParameter("q_reply"+i+6)!=null){//답이 있을 때
					pstmt.setString(15, multi.getParameter("q_reply"+i+6));
				}else{//그림파일이 없을 때
					pstmt.setString(15, "");
				}//else
				//pstmt.setString(15, multi.getParameter("q_reply"+i+6));
				if(multi.getParameter("q_reply"+i+7)!=null){//답이 있을 때
					pstmt.setString(16, multi.getParameter("q_reply"+i+7));
				}else{//그림파일이 없을 때
					pstmt.setString(16, "");
				}//else
				
				//pstmt.setString(16, multi.getParameter("q_reply"+i+7));
				if(multi.getParameter("q_reply"+i+8)!=null){//답이 있을 때
					pstmt.setString(17, multi.getParameter("q_reply"+i+8));
				}else{//그림파일이 없을 때
					pstmt.setString(17, "");
				}//else
				//pstmt.setString(17, multi.getParameter("q_reply"+i+8));
				if(multi.getParameter("q_reply"+i+9)!=null){//답이 있을 때
					pstmt.setString(18, multi.getParameter("q_reply"+i+9));
				}else{//그림파일이 없을 때
					pstmt.setString(18, "");
				}//else
				//pstmt.setString(18, multi.getParameter("q_reply"+i+9));

				if(multi.getParameter("q_reply"+i+10)!=null){//답이 있을 때
					pstmt.setString(19, multi.getParameter("q_reply"+i+10));
				}else{//그림파일이 없을 때
					pstmt.setString(19, "");
				}//else			
				//pstmt.setString(19, multi.getParameter("q_reply"+i+10));
				
				if(multi.getParameter("q_real_reply"+i+1)!=null){//답이 있을 때
					pstmt.setString(20, multi.getParameter("q_real_reply"+i+1));
				}else{//그림파일이 없을 때
					pstmt.setString(20, "");
				}//else			
				//pstmt.setString(20, multi.getParameter("q_real_reply"+i+1));
				
				if(multi.getParameter("q_real_reply"+i+2)!=null){//답이 있을 때
					pstmt.setString(21, multi.getParameter("q_real_reply"+i+2));
				}else{//그림파일이 없을 때
					pstmt.setString(21, "");
				}//else
				//pstmt.setString(21, multi.getParameter("q_real_reply"+i+2));
				
				if(multi.getParameter("q_real_reply"+i+3)!=null){//답이 있을 때
					pstmt.setString(22, multi.getParameter("q_real_reply"+i+3));
				}else{//그림파일이 없을 때
					pstmt.setString(22, "");
				}//else
				//pstmt.setString(22, multi.getParameter("q_real_reply"+i+3));
				
				if(multi.getParameter("q_real_reply"+i+4)!=null){//답이 있을 때
					pstmt.setString(23, multi.getParameter("q_real_reply"+i+4));
				}else{//그림파일이 없을 때
					pstmt.setString(23, "");
				}//else
				//pstmt.setString(23, multi.getParameter("q_real_reply"+i+4));
				
				if(multi.getParameter("q_real_reply"+i+5)!=null){//답이 있을 때
					pstmt.setString(24, multi.getParameter("q_real_reply"+i+5));
				}else{//그림파일이 없을 때
					pstmt.setString(24, "");
				}//else
				//pstmt.setString(24, multi.getParameter("q_real_reply"+i+5));
				
				if(multi.getParameter("q_real_reply"+i+6)!=null){//답이 있을 때
					pstmt.setString(25, multi.getParameter("q_real_reply"+i+6));
				}else{//그림파일이 없을 때
					pstmt.setString(25, "");
				}//else
				//pstmt.setString(25, multi.getParameter("q_real_reply"+i+6));
				
				if(multi.getParameter("q_real_reply"+i+7)!=null){//답이 있을 때
					pstmt.setString(26, multi.getParameter("q_real_reply"+i+7));
				}else{//그림파일이 없을 때
					pstmt.setString(26, "");
				}//else
				//pstmt.setString(26, multi.getParameter("q_real_reply"+i+7));
				
				if(multi.getParameter("q_real_reply"+i+8)!=null){//답이 있을 때
					pstmt.setString(27, multi.getParameter("q_real_reply"+i+8));
				}else{//그림파일이 없을 때
					pstmt.setString(27, "");
				}//else
				//pstmt.setString(27, multi.getParameter("q_real_reply"+i+8));
				
				if(multi.getParameter("q_real_reply"+i+9)!=null){//답이 있을 때
					pstmt.setString(28, multi.getParameter("q_real_reply"+i+9));
				}else{//그림파일이 없을 때
					pstmt.setString(28, "");
				}//else
				//pstmt.setString(28, multi.getParameter("q_real_reply"+i+9));
				
				if(multi.getParameter("q_real_reply"+i+10)!=null){//답이 있을 때
					pstmt.setString(29, multi.getParameter("q_real_reply"+i+10));
				}else{//그림파일이 없을 때
					pstmt.setString(29, "");
				}//else
				//pstmt.setString(29, multi.getParameter("q_real_reply"+i+10));
				
				if(multi.getFilesystemName("q_reply"+i+"_img1")!=null){//그림파일이 있을 때
					pstmt.setString(30, multi.getFilesystemName("q_reply"+i+"_img1"));
				}else{//그림파일이 없을 때
					pstmt.setString(30, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img2")!=null){//그림파일이 있을 때
					pstmt.setString(31, multi.getFilesystemName("q_reply"+i+"_img2"));
				}else{//그림파일이 없을 때
					pstmt.setString(31, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img3")!=null){//그림파일이 있을 때
					pstmt.setString(32, multi.getFilesystemName("q_reply"+i+"_img3"));
				}else{//그림파일이 없을 때
					pstmt.setString(32, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img4")!=null){//그림파일이 있을 때
					pstmt.setString(33, multi.getFilesystemName("q_reply"+i+"_img4"));
				}else{//그림파일이 없을 때
					pstmt.setString(33, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img5")!=null){//그림파일이 있을 때
					pstmt.setString(34, multi.getFilesystemName("q_reply"+i+"_img5"));
				}else{//그림파일이 없을 때
					pstmt.setString(34, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img6")!=null){//그림파일이 있을 때
					pstmt.setString(35, multi.getFilesystemName("q_reply"+i+"_img6"));
				}else{//그림파일이 없을 때
					pstmt.setString(35, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img7")!=null){//그림파일이 있을 때
					pstmt.setString(36, multi.getFilesystemName("q_reply"+i+"_img7"));
				}else{//그림파일이 없을 때
					pstmt.setString(36, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img8")!=null){//그림파일이 있을 때
					pstmt.setString(37, multi.getFilesystemName("q_reply"+i+"_img8"));
				}else{//그림파일이 없을 때
					pstmt.setString(37, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img9")!=null){//그림파일이 있을 때
					pstmt.setString(38, multi.getFilesystemName("q_reply"+i+"_img9"));
				}else{//그림파일이 없을 때
					pstmt.setString(38, "NoImage.png");
				}//else
				
				if(multi.getFilesystemName("q_reply"+i+"_img10")!=null){//그림파일이 있을 때
					pstmt.setString(39, multi.getFilesystemName("q_reply"+i+"_img10"));
				}else{//그림파일이 없을 때
					pstmt.setString(39, "NoImage.png");
				}//else
				
				pstmt.setInt(40, q_dep_num);//퀴즈그룹 번호 : q_dep_num
				pstmt.setInt(41, q_dep_step+i);//퀴즈그룹 번호의 순번 : q_dep_step
				pstmt.setInt(42, 0);//조회수 : q_read_count 기본 0
				pstmt.setString(43, multi.getParameter("q_group_type"+i));
				pstmt.setString(44, multi.getParameter("q_group_num"+i));
				pstmt.setString(45, multi.getParameter("q_group_name"+i));
				//시간
				//수정일
				pstmt.setString(46, multi.getParameter("q_quiz_type"+i));
				
				int count=pstmt.executeUpdate();//쿼리 실행
		
				System.out.println("Query 성공:"+count);			
				if(count==1){
					result=true;
				}//if
				
				}else if(type.equals("400")){
					System.out.println("OX타입");
				
				}else if(type.equals("500")){
					System.out.println("표타입");
				}
			//------------------------------------------------------------------------	
			/*qz_quiz_history 최초 생성 event history 등록*/
			
			String sql3="insert into qz_quiz_history(q_title, q_quiz_num, q_id, q_nickname, q_name, q_guest_id, q_guest_nickname,"
					+"q_guest_name, q_quiz_event, q_event_time,q_group_type, q_group_num, q_group_name, q_quiz_type, q_value1, q_value2, q_value3, q_value4, q_value5"
					+") values (?,?,?,?,?,?,?,?,'I',NOW(),?,?,?,?,?,?,?,?,?)";
			
			System.out.println("history insert");
			pstmt=con.prepareStatement(sql3);
			
			pstmt.setString(1, multi.getParameter("q_title"));//타이틀
			pstmt.setInt(2, q_dep_num);//퀴즈별 고유번호(Q_DEP_NUM)
			pstmt.setString(3, multi.getParameter("q_id"));//퀴즈출제자 아이디
			pstmt.setString(4, multi.getParameter("q_nickname"));//퀴즈 출제자 닉네임
			pstmt.setString(5, multi.getParameter("q_name"));//퀴즈 출제자이름
			pstmt.setString(6, multi.getParameter("q_guest_id"));//퀴즈 응시자
			pstmt.setString(7, multi.getParameter("q_guest_nickname"));//퀴즈 응시자
			pstmt.setString(8, multi.getParameter("q_guest_name"));//퀴즈 응시자
			//I 퀴즈 EVENT//I(최초 등록)
			//NOW();
			pstmt.setString(9, multi.getParameter("q_group_type"));//퀴즈그룹 타입
			pstmt.setString(10, multi.getParameter("q_group_num"));//퀴즈그룹 고유번호
			pstmt.setString(11, multi.getParameter("q_group_name"));//퀴즈그룹 이름
			pstmt.setString(12, type);//퀴즈 문제 타입(100,200,300,400,500)
			pstmt.setString(13, multi.getParameter("q_value1"));//NULL
			pstmt.setString(14, multi.getParameter("q_value2"));//NULL
			pstmt.setString(15, multi.getParameter("q_value3"));//NULL
			pstmt.setString(16, multi.getParameter("q_value4"));//NULL
			pstmt.setString(17, multi.getParameter("q_value5"));//NULL
			
			int count=pstmt.executeUpdate();//쿼리 실행
			
			System.out.println("Query 성공:"+count);			
			if(count==1){
				result=true;
			}//if

			
		  }//for
			

		}catch(Exception ex1){
			System.out.println("Quiz_insert예외:"+ex1);
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
	/*
	public List Quiz_history(int q_dep_num){
		List <Quiz_RegisterBean> list=new ArrayList<Quiz_RegisterBean>();
		
		try{
			//처리문
			con=getConnection();//커넥션 얻기
			
			//history quiz정보 얻기
			String sql="select * from qz_quiz_info";
			stmt=con.createStatement();//Statement 생성
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				Quiz_RegisterBean quiz=new Quiz_RegisterBean();
				
				quiz.setQ_num(rs.getInt("q_Num"));
				quiz.setQ_title(rs.getString("q_title"));
				quiz.setQ_subject(rs.getString("q_subject"));
				quiz.setQ_content(rs.getString("q_content"));
				quiz.setQ_dep_num(rs.getInt("q_dep_num"));
				quiz.setQ_dep_step(rs.getInt("q_dep_step"));
				quiz.setQ_read_count(Integer.parseInt(rs.getString("q_read_count")));
				quiz.setQ_create_time(rs.getTimestamp("q_create_time"));
				quiz.setQ_quiz_type(rs.getString("q_quiz_type"));
				
				list.add(quiz);
				
			}//while end
						
		}catch(Exception ex1){
			
		}finally{
			try{
				if(stmt!=null){stmt.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}
		
		
	}//Quiz_select () end
	
	*/
}//class
