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


public class Quiz_ListMgr {
	
	private Quiz_ListMgr(){}
	private static Quiz_ListMgr mgr=new Quiz_ListMgr();
	public static Quiz_ListMgr getInstance(){//jsp에서 호출하여 객체를 얻어가는 메서드
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
	
	//1. 상품 목록 리스트
	public List getQuizList() throws Exception{
		sql="";//변수
		con=null;
		stmt=null;
		rs=null;
		List <Quiz_ListBean> getQuizList=new ArrayList<Quiz_ListBean>();
		
		try{
			//처리내용
			con=getConnection();
			sql="select * from qz_quiz_info where q_dep_step=1";
			//group q_dep_num
			stmt=con.createStatement();//Statement 생성
			rs=stmt.executeQuery(sql);//실행시 인자 들어감
			
			while(rs.next()){
				Quiz_ListBean bean=new Quiz_ListBean(); 
				
				bean.setQ_num(rs.getInt("q_num"));
				bean.setQ_dep_num(rs.getInt("Q_dep_num"));
				bean.setQ_dep_step(rs.getInt("Q_dep_step"));
				bean.setQ_title(rs.getString("q_title"));
				bean.setQ_title_img(rs.getString("q_title_img"));
				
				getQuizList.add(bean);//모델빈을 List에 넣는다.
			
			}//while end			
			
		}catch(Exception ex){
			System.out.println("getQuizList() 예외 : "+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
				
			}catch(Exception ex1){}
		}//finally
		
		return getQuizList;
		
	}//getQuizList () end

}//class end
















