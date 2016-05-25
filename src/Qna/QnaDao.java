package Qna;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Board.BoardDto;

public class QnaDao {
	
private static QnaDao instance=new QnaDao(); //�̱��� ���
	
	//jsp���� ����� �޼ҵ�
	public static QnaDao getInstance(){
		return instance;
	}//getInstance
	
	//Ŀ�ؼ� ���
	private Connection getConnection() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//getConnection()
	
	public QnaDao(){}//������
	
	Connection con=null;
	Statement stmt=null;
	PreparedStatement pstmt;
	ResultSet rs=null;
	String sql="";
	QnaDto dto=null;
	
	//-----------------------------
	// ��ȸ�� ����
	//-----------------------------
	public void upCount(int q_num){
		try{
			con=getConnection();
			sql="update qz_board_qna set Q_COUNT=Q_COUNT+1 where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql); //������ ���� ȣ��
			pstmt.executeUpdate(); //��������
			
		}catch(Exception ex){
			System.out.println("upCount() ���� :"+ex);
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
			
			pstmt=con.prepareStatement(sql); //������ ���� ��
			pstmt.setString(1, dto.getQ_nickname());
			pstmt.setString(2, dto.getQ_subject());			
			pstmt.setString(3, dto.getQ_content());
			pstmt.setInt(4, dto.getQ_group());
			pstmt.setInt(5, dto.getQ_sort());
			pstmt.setInt(6, dto.getQ_count());
			
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("insertQna() ���� :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
	}//insertQna() end
	
	//---------------------------------
	// �� ���� ����, �ۼ���
	//---------------------------------
	public QnaDto getQna(int q_num){
		QnaDto dto=new QnaDto();
		try{
			//ó����
			con=getConnection();
			String sql="select * from qz_board_qna where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();//��������
			
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
			System.out.println("getQna() ����:"+ex);
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
	// �ۼ���, DB���� update
	//-----------------------------
	public void updateQna(QnaDto dto){
		try{
			con=getConnection();
			String sql="update qz_board_qna set Q_SUBJECT=?, Q_CONTENT=? where Q_NUM=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getQ_subject());
			pstmt.setString(2, dto.getQ_content());
			pstmt.setInt(3, dto.getQ_num());
			
			pstmt.executeUpdate(); //��������
			
		}catch(Exception ex){
			System.out.println("updateQna ���� :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally	
	}//updateQna() end
	
	//-----------------------------
	// �ۻ���
	//-----------------------------
	public void deleteQna(int q_num){
		try{
			con=getConnection();
			sql="delete from qz_board_qna where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("deleteQna() ���� :"+ex);
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
			//ó����
			con=getConnection();
			stmt=con.createStatement();
			
			if(keyWord.equals(null) || keyWord.equals("")){//��ü��
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
			System.out.println("getQnaList() ���� :"+ex);
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
	// ����in list
	//----------------------------------
	
	public Vector getKinList(String keyField, String keyWord){
		Vector vec=new Vector();
		sql="";
		try{
			//ó����
			con=getConnection();
			stmt=con.createStatement();
			
			if(keyWord.equals(null) || keyWord.equals("")){//��ü��
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
			System.out.println("getKinList ���� :"+ex);
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
				
				pstmt=con.prepareStatement(sql); //������ ���� ��
				
				pstmt.setString(1, dto.getQ_subject());
				pstmt.setString(2, dto.getQ_content());
				pstmt.setInt(3,dto.getQ_group());
				pstmt.setInt(4,dto.getQ_sort());
		
				
				pstmt.executeUpdate();
			}catch(Exception ex){
				System.out.println("insertFaq() ���� :"+ex);
			}finally{
				try{
					if(pstmt!=null){pstmt.close();}
					if(con!=null){con.close();}
				}catch(Exception exx){}
			}//finally
		}//insertFaq() end
		
	//---------------------------------
	// FAQ ���뺸��, ����
	//---------------------------------
	public QnaDto getFaq(int q_num){
		QnaDto dto=new QnaDto();
		try{
			//ó����
			con=getConnection();
			String sql="select * from qz_board_qna where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();//��������
			
			while(rs.next()){
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_subject(rs.getString("q_subject"));			
				dto.setQ_content(rs.getString("q_content"));			
				dto.setQ_group(rs.getInt("q_group"));
				dto.setQ_sort(rs.getInt("q_sort"));
				
			}//while end 
		}catch(Exception ex){
			System.out.println("getFaq() ����:"+ex);
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
			//ó����
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
			System.out.println("getFaqList() ���� :"+ex);
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
	// FAQ list (ȸ�� ����)
	//------------------------------		
	public Vector getFaqList_u(int q_group){
		Vector vec=new Vector();
		sql="";
		try{
			//ó����
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
			System.out.println("getFaqList() ���� :"+ex);
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
	// FAQ list (SITE ����)
	//------------------------------		
	public Vector getFaqList_s(int q_group){
		Vector vec=new Vector();
		sql="";
		try{
			//ó����
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
			System.out.println("getFaqList() ���� :"+ex);
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
	// FAQ list (��Ÿ ����)
	//------------------------------		
	public Vector getFaqList_e(int q_group){
		Vector vec=new Vector();
		sql="";
		try{
			//ó����
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
			System.out.println("getFaqList() ���� :"+ex);
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
