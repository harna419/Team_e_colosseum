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


public class Quiz_ListMgr {
	
	private Quiz_ListMgr(){}
	private static Quiz_ListMgr mgr=new Quiz_ListMgr();
	public static Quiz_ListMgr getInstance(){//jsp���� ȣ���Ͽ� ��ü�� ���� �޼���
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
	
	//1. ��ǰ ��� ����Ʈ
	public List getQuizList() throws Exception{
		sql="";//����
		con=null;
		stmt=null;
		rs=null;
		List <Quiz_ListBean> getQuizList=new ArrayList<Quiz_ListBean>();
		
		try{
			//ó������
			con=getConnection();
			sql="select * from qz_quiz_info where q_dep_step=1";
			//group q_dep_num
			stmt=con.createStatement();//Statement ����
			rs=stmt.executeQuery(sql);//����� ���� ��
			
			while(rs.next()){
				Quiz_ListBean bean=new Quiz_ListBean(); 
				
				bean.setQ_num(rs.getInt("q_num"));
				bean.setQ_dep_num(rs.getInt("Q_dep_num"));
				bean.setQ_dep_step(rs.getInt("Q_dep_step"));
				bean.setQ_title(rs.getString("q_title"));
				bean.setQ_title_img(rs.getString("q_title_img"));
				
				getQuizList.add(bean);//�𵨺��� List�� �ִ´�.
			
			}//while end			
			
		}catch(Exception ex){
			System.out.println("getQuizList() ���� : "+ex);
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
















