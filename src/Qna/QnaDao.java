package Qna;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Board.BoardDto;

public class QnaDao {
	
private static QnaDao instance=new QnaDao(); //싱글톤 사용
	
	//jsp에서 사용할 메소드
	public static QnaDao getInstance(){
		return instance;
	}//getInstance
	
	//커넥션 얻기
	private Connection getConnection() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//getConnection()
	
	public QnaDao(){}//생성자
	
	Connection con=null;
	Statement stmt=null;
	PreparedStatement pstmt;
	ResultSet rs=null;
	String sql="";
	QnaDto dto=null;
	
	//-----------------------------
	// 조회수 증가
	//-----------------------------
	public void upCount(int q_num){
		try{
			con=getConnection();
			sql="update qz_board_qna set Q_COUNT=Q_COUNT+1 where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql); //생성시 인자 호출
			pstmt.executeUpdate(); //쿼리수행
			
		}catch(Exception ex){
			System.out.println("upCount() 예외 :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally 
	}//upCount() end
	
	//--------------------------------
	// insert
	//--------------------------------
	public void insertQna(QnaDto dto){
		try{
			con=getConnection();
			sql="insert into qz_board_qna(Q_NICKNAME,Q_SUBJECT,Q_CONTENT,Q_DATE,Q_GROUP,Q_SORT,Q_COUNT)"
					+ " value(?,?,?,NOW(),?,?,?)";
			
			pstmt=con.prepareStatement(sql); //생성시 인자 들어감
			pstmt.setString(1, dto.getQ_nickname());
			pstmt.setString(2, dto.getQ_subject());			
			pstmt.setString(3, dto.getQ_content());
			pstmt.setInt(4, dto.getQ_group());
			pstmt.setInt(5, dto.getQ_sort());
			pstmt.setInt(6, dto.getQ_count());
			
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("insertQna() 예외 :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
	}//insertQna() end
	
	//---------------------------------
	// 글 내용 보기, 글수정
	//---------------------------------
	public QnaDto getQna(int q_num){
		QnaDto dto=new QnaDto();
		try{
			//처리문
			con=getConnection();
			String sql="select * from qz_board_qna where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();//쿼리수행
			
			while(rs.next()){
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_name(rs.getString("q_name"));
				dto.setQ_nickname(rs.getString("q_nickname"));
				dto.setQ_subject(rs.getString("q_subject"));			
				dto.setQ_content(rs.getString("q_content"));
				dto.setQ_date(rs.getString("q_date"));			
				dto.setQ_group(rs.getInt("q_group"));
				dto.setQ_sort(rs.getInt("q_sort"));
				dto.setQ_count(rs.getInt("q_count"));
				
			}//while end 
		}catch(Exception ex){
			System.out.println("getQna() 예외:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return dto;
	}//getQna() end
	
	//-----------------------------
	// 글수정, DB내용 update
	//-----------------------------
	public void updateQna(QnaDto dto){
		try{
			con=getConnection();
			String sql="update qz_board_qna set Q_SUBJECT=?, Q_CONTENT=? where Q_NUM=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getQ_subject());
			pstmt.setString(2, dto.getQ_content());
			pstmt.setInt(3, dto.getQ_num());
			
			pstmt.executeUpdate(); //쿼리수행
			
		}catch(Exception ex){
			System.out.println("updateQna 예외 :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally	
	}//updateQna() end
	
	//-----------------------------
	// 글삭제
	//-----------------------------
	public void deleteQna(int q_num){
		try{
			con=getConnection();
			sql="delete from qz_board_qna where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("deleteQna() 예외 :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
	}//deleteQna() end
	
	//------------------------------
	// Q&A list
	//------------------------------
	public Vector getQnaList(String keyField, String keyWord){
		Vector vec=new Vector();
		sql="";
		try{
			//처리문
			con=getConnection();
			stmt=con.createStatement();
			
			if(keyWord.equals(null) || keyWord.equals("")){//전체글
				sql="select * from qz_board_qna where q_group=1 order by Q_NUM desc";
			}else{
				sql="select * from qz_board_qna where q_group=1 and "+keyField+" like '%"+keyWord+"%'"
						+ " order by Q_NUM desc";
			}//else
			
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				QnaDto dto=new QnaDto();
				
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_name(rs.getString("q_name"));
				dto.setQ_nickname(rs.getString("q_nickname"));
				dto.setQ_subject(rs.getString("q_subject"));								
				dto.setQ_content(rs.getString("q_content"));				
				dto.setQ_date(rs.getString("q_date"));				
				dto.setQ_group(rs.getInt("q_group"));
				dto.setQ_sort(rs.getInt("q_sort"));
				dto.setQ_count(rs.getInt("q_count"));
				
				vec.add(dto);
			}//while end 
		}catch(Exception ex){
			System.out.println("getQnaList() 예외 :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return vec;
		
	}//getQnaList() end
	
	//----------------------------------
	// 지식in list
	//----------------------------------
	
	public Vector getKinList(String keyField, String keyWord){
		Vector vec=new Vector();
		sql="";
		try{
			//처리문
			con=getConnection();
			stmt=con.createStatement();
			
			if(keyWord.equals(null) || keyWord.equals("")){//전체글
				sql="select * from qz_board_qna where q_group=2 order by Q_NUM desc";
			}else{
				sql="select * from qz_board_qna where q_group=2 and "+keyField+" like '%"+keyWord+"%'"
						+ " order by Q_NUM desc";
			}//else
			rs=stmt.executeQuery(sql);
			
			
			while(rs.next()){
				QnaDto dto=new QnaDto();
			
				dto.setQ_num(rs.getInt("Q_NUM"));
				dto.setQ_name(rs.getString("q_name"));
				dto.setQ_nickname(rs.getString("q_nickname"));
				dto.setQ_subject(rs.getString("q_subject"));				
				dto.setQ_content(rs.getString("q_content"));
				dto.setQ_date(rs.getString("q_date"));
				dto.setQ_group(rs.getInt("q_group"));				
				dto.setQ_sort(rs.getInt("q_sort"));
				dto.setQ_count(rs.getInt("q_count"));
				
				vec.add(dto);
			}//while end 
		}catch(Exception ex){
			System.out.println("getKinList 예외 :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return vec;
		
	}//getKinList() end
	
	//--------------------------------
	// insert FAQ
	//--------------------------------
		public void insertFaq(QnaDto dto){
			try{
				con=getConnection();
				sql="insert into qz_board_qna(Q_SUBJECT,Q_CONTENT,Q_GROUP,Q_SORT)"
						+ " value(?,?,?,?)";
				
				pstmt=con.prepareStatement(sql); //생성시 인자 들어감
				
				pstmt.setString(1, dto.getQ_subject());
				pstmt.setString(2, dto.getQ_content());
				pstmt.setInt(3,dto.getQ_group());
				pstmt.setInt(4,dto.getQ_sort());
		
				
				pstmt.executeUpdate();
			}catch(Exception ex){
				System.out.println("insertFaq() 예외 :"+ex);
			}finally{
				try{
					if(pstmt!=null){pstmt.close();}
					if(con!=null){con.close();}
				}catch(Exception exx){}
			}//finally
		}//insertFaq() end
		
	//---------------------------------
	// FAQ 내용보기, 수정
	//---------------------------------
	public QnaDto getFaq(int q_num){
		QnaDto dto=new QnaDto();
		try{
			//처리문
			con=getConnection();
			String sql="select * from qz_board_qna where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();//쿼리수행
			
			while(rs.next()){
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_subject(rs.getString("q_subject"));			
				dto.setQ_content(rs.getString("q_content"));			
				dto.setQ_group(rs.getInt("q_group"));
				dto.setQ_sort(rs.getInt("q_sort"));
				
			}//while end 
		}catch(Exception ex){
			System.out.println("getFaq() 예외:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return dto;
	}//getFaq() end
	
	//------------------------------
	// FAQ list 
	//------------------------------		
	public Vector getFaqList(int q_group){
		Vector vec=new Vector();
		sql="";
		try{
			//처리문
			con=getConnection();
			stmt=con.createStatement();			
			sql="select * from qz_board_qna where q_group=0 order by Q_NUM desc";			
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				QnaDto dto=new QnaDto();
				
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_subject(rs.getString("q_subject"));								
				dto.setQ_content(rs.getString("q_content"));				
				dto.setQ_group(rs.getInt("q_group"));
				dto.setQ_sort(rs.getInt("q_sort"));
				
				vec.add(dto);
			}//while end 
		}catch(Exception ex){
			System.out.println("getFaqList() 예외 :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return vec;
		
	}//getFaqList() end
		
	//------------------------------
	// FAQ list (회원 관련)
	//------------------------------		
	public Vector getFaqList_u(int q_group){
		Vector vec=new Vector();
		sql="";
		try{
			//처리문
			con=getConnection();
			stmt=con.createStatement();			
			sql="select * from qz_board_qna where q_group=0 and q_sort=0 order by Q_NUM desc";			
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				QnaDto dto=new QnaDto();
				
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_subject(rs.getString("q_subject"));								
				dto.setQ_content(rs.getString("q_content"));				
				dto.setQ_group(rs.getInt("q_group"));
				dto.setQ_sort(rs.getInt("q_sort"));
				
				vec.add(dto);
			}//while end 
		}catch(Exception ex){
			System.out.println("getFaqList() 예외 :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return vec;
		
	}//getFaqList() end		

	//------------------------------
	// FAQ list (SITE 관련)
	//------------------------------		
	public Vector getFaqList_s(int q_group){
		Vector vec=new Vector();
		sql="";
		try{
			//처리문
			con=getConnection();
			stmt=con.createStatement();			
			sql="select * from qz_board_qna where q_group=0 and q_sort=1 order by Q_NUM desc";			
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				QnaDto dto=new QnaDto();
				
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_subject(rs.getString("q_subject"));								
				dto.setQ_content(rs.getString("q_content"));				
				dto.setQ_group(rs.getInt("q_group"));
				dto.setQ_sort(rs.getInt("q_sort"));
				
				vec.add(dto);
			}//while end 
		}catch(Exception ex){
			System.out.println("getFaqList() 예외 :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return vec;
		
	}//getFaqList() end		

	//------------------------------
	// FAQ list (기타 관련)
	//------------------------------		
	public Vector getFaqList_e(int q_group){
		Vector vec=new Vector();
		sql="";
		try{
			//처리문
			con=getConnection();
			stmt=con.createStatement();			
			sql="select * from qz_board_qna where q_group=0 and q_sort=2 order by Q_NUM desc";			
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				QnaDto dto=new QnaDto();
				
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_subject(rs.getString("q_subject"));								
				dto.setQ_content(rs.getString("q_content"));				
				dto.setQ_group(rs.getInt("q_group"));
				dto.setQ_sort(rs.getInt("q_sort"));
				
				vec.add(dto);
			}//while end 
		}catch(Exception ex){
			System.out.println("getFaqList() 예외 :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return vec;
		
	}//getFaqList() end		

}//class end
