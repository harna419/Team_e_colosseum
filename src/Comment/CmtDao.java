package Comment;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.servlet.http.*;

import com.oreilly.servlet.*;

import javax.servlet.http.HttpServletRequest; //서블릿 

import java.io.*; //그림 파일 삭제하기 위해서 

import Board.BoardDto;
import Comment.CmtDto;

public class CmtDao {

	private static CmtDao instance=new CmtDao(); //싱글톤 사용
	
	//jsp에서 사용할 메소드
	public static CmtDao getInstance(){
		return instance;
	}//getInstance
	
	//커넥션 얻기
	private Connection getConnection() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//getConnection()
	
	public CmtDao(){}//생성자
	
	Connection con=null;
	Statement stmt=null;
	PreparedStatement pstmt;
	ResultSet rs=null;
	String sql="";
	BoardDto dto=null;	
	
	
	public void getNum(){
		
		
	}
	
	//pos 증가
	public void upPos(){
		try{
			//처리문
			con=getConnection();//DB 연결
			sql="update qz_board_comment set q_comment_pos=q_comment_pos+1";//글쓰기, 답글쓰기
			pstmt=con.prepareStatement(sql);//생성시 인자 호출
			pstmt.executeUpdate();//쿼리수행
		}catch(Exception ex){
			System.out.println("upPos() 예외:"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally end 
	}//upPos()
	
	//--------------------------------
	//insert
	//--------------------------------
	public void insertComment(CmtDto dto){
		upPos();
		
		try{
			con=getConnection();
			sql="insert into qz_board_comment(Q_COMMENT,Q_NICKNAME,Q_CREATE_TIME,Q_MODIFY_TIME,Q_COMMENT_POS,Q_ZONE,Q_COMMENT_DEPTH)"
					+ " value(?,?,NOW(),NOW(),?,?,?)";
			
			pstmt=con.prepareStatement(sql); //생성시 인자 들어감

			pstmt.setString(1, dto.getQ_comment());
			pstmt.setString(2, dto.getQ_nickname());
			pstmt.setInt(3, dto.getQ_comment_pos());
			pstmt.setInt(4, dto.getQ_zone());
			pstmt.setInt(5, dto.getQ_comment_depth());

	
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("insertComment() 예외 :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
	}//insertComment() end
	
	//------------------------------
	// list
	//------------------------------
	public Vector getCommentList(int q_zone){
		Vector vec=new Vector();
		sql="";
		try{
			//처리문
			con=getConnection();
			stmt=con.createStatement();
			
			sql="select * from qz_board_comment where q_zone="+q_zone+" order by q_comment_pos asc";
			
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				CmtDto dto=new CmtDto();
				
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_comment(rs.getString("q_comment"));
				dto.setQ_name(rs.getString("q_name"));
				dto.setQ_nickname(rs.getString("q_nickname"));
				dto.setQ_comment_img(rs.getString("q_comment_img"));
				dto.setQ_create_time(rs.getString("q_create_time"));
				dto.setQ_modify_time(rs.getString("q_modify_time"));
				dto.setQ_comment_pos(rs.getInt("q_comment_pos"));
				dto.setQ_zone(rs.getInt("q_zone"));
				dto.setQ_comment_depth(rs.getInt("q_comment_depth"));
				dto.setQ_ip(rs.getString("q_ip"));
				
				vec.add(dto);
			}//while end 
		}catch(Exception ex){
			System.out.println("getCommentList() 예외 :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return vec;
		
	}//getCommentList() end
	
	//-----------------------------
	//글내용보기, 글수정
	//-----------------------------
	public CmtDto getComment(int q_num){
	CmtDto dto=new CmtDto();
	try{
		//처리문
		con=getConnection();//DB연결
		String sql="select * from qz_board_comment where q_num="+q_num;
		pstmt=con.prepareStatement(sql);//생성시 인자 들어간다
		rs=pstmt.executeQuery();//쿼리수행
		
		while(rs.next()){
			dto.setQ_num(rs.getInt("q_num"));
			dto.setQ_comment(rs.getString("q_comment"));
			dto.setQ_name(rs.getString("q_name"));
			dto.setQ_nickname(rs.getString("q_nickname"));
			dto.setQ_create_time(rs.getString("q_create_time"));
			dto.setQ_modify_time(rs.getString("q_modify_time"));
			dto.setQ_comment_pos(rs.getInt("q_comment_pos"));
			dto.setQ_zone(rs.getInt("q_zone"));	
			dto.setQ_comment_depth(rs.getInt("q_comment_depth"));
			dto.setQ_ip(rs.getString("q_ip"));
				
		}//while end
			
	}catch(Exception ex){
		System.out.println("getComment()예외:"+ex);
	}finally{
		try{
			if(rs!=null){rs.close();}
			if(pstmt!=null){pstmt.close();}
			if(con!=null){con.close();}
			}catch(Exception exx){}
	}//finally end
	return dto;
	}// getComment() end
	
	//----------------------------
	//글수정, db내용 update
	//----------------------------
	public void updateComment(CmtDto dto){
		try{
			//처리문
			con=getConnection();//DB연결
			String sql="update qz_board_comment set q_comment=? where q_num=?";				
			pstmt=con.prepareStatement(sql);//생성시 인자 들어간다
			//?값 채우기
				
			pstmt.setString(1, dto.getQ_comment());
			pstmt.setInt(2, dto.getQ_num());

			pstmt.executeUpdate();//쿼리수행********
				
		}catch(Exception ex){
			System.out.println("updateComment() 예외:"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally end
	}//updateComment() end
	
	//------------------------------------
	//답글 위치확보
	//------------------------------------
	public void replyPos(CmtDto dto){
		try{
			con=getConnection();
			String sql="update qz_board_comment set q_comment_pos=q_comment_pos+1 where q_comment_pos>?";
			pstmt=con.prepareStatement(sql);//생성시 인자 들어감
				
			pstmt.setInt(1, dto.getQ_comment_pos());
			pstmt.executeUpdate();//쿼리수행
				
		}catch(Exception ex1){
			System.out.println("replyPos()예외:"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally
	}//replyPos() end
		
	//--------
	//답글 쓰기
	//--------
	public void replyComment(CmtDto dto){
		
		try{
			//처리문
				
			con=getConnection();//db연결
			int q_comment_depth=dto.getQ_comment_depth()+1;//글 깊이
			int q_comment_pos=dto.getQ_comment_pos()+1; //현재글 위치 + 1
			
			sql="insert into qz_board_comment(Q_COMMENT,Q_NICKNAME,Q_CREATE_TIME,Q_MODIFY_TIME,Q_COMMENT_POS,Q_ZONE,Q_COMMENT_DEPTH,Q_IP)"
					+ " value(?,?,NOW(),NOW(),?,?,?,?)";
				
			pstmt=con.prepareStatement(sql);//생성시 인자 들어감			
			//? 채우기
			pstmt.setString(1, dto.getQ_comment());
			pstmt.setString(2, dto.getQ_nickname());
			pstmt.setInt(3, q_comment_pos);
			pstmt.setInt(4, dto.getQ_zone());
			pstmt.setInt(5, q_comment_depth);
			pstmt.setString(6,dto.getQ_ip());
				
			pstmt.executeUpdate();//쿼리수행 
			
		}catch(Exception ex){
			System.out.println("replyComment() end"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally end
	}//replyComment() end 	
	
	//-----------------------------
	//글삭제
	//-----------------------------
	public void deleteComment(int q_num){
		try{
			con=getConnection();
			sql="delete from qz_board_comment where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("deleteComment() 예외 :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
	}//deleteComment() end	
	
}//class end 