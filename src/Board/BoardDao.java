package Board;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//DAO : �����Ͻ� ����
public class BoardDao {
	
	private static BoardDao instance=new BoardDao(); //�̱��� ���
	
	//jsp���� ����� �޼ҵ�
	public static BoardDao getInstance(){
		return instance;
	}//getInstance
	
	//Ŀ�ؼ� ���
	private Connection getConnection() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//getConnection()
	
	public BoardDao(){}//������
	
	Connection con=null;
	Statement stmt=null;
	PreparedStatement pstmt;
	ResultSet rs=null;
	String sql="";
	BoardDto dto=null;
	
	//--------------------------------
	//insert
	//--------------------------------
	public void insertBoard(BoardDto dto){
		try{
			con=getConnection();
			sql="insert into qz_board_free(Q_SUBJECT,Q_NICKNAME,Q_CONTENT,Q_CREATE_TIME,Q_MODIFY_TIME,Q_READ_COUNT,Q_NOTICE_GROUP)"
					+ " value(?,?,?,NOW(),NOW(),?,?)";
			
			pstmt=con.prepareStatement(sql); //������ ���� ��
			pstmt.setString(1, dto.getQ_subject());
			pstmt.setString(2, dto.getQ_nickname());
			pstmt.setString(3, dto.getQ_content());
			pstmt.setInt(4, dto.getQ_read_count());
			pstmt.setInt(5, dto.getQ_notice_group());
			
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("insertBoard() ���� :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
	}//insertBoard() end
	
	//-----------------------------
	//��ȸ�� ����
	//-----------------------------
	public void upCount(int q_num){
		try{
			con=getConnection();
			sql="update qz_board_free set Q_READ_COUNT=Q_READ_COUNT+1 where Q_NUM="+q_num;
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
	
	//---------------------------------
	//�� ���� ����, �ۼ���
	//---------------------------------
	public BoardDto getBoard(int q_num){
		BoardDto dto=new BoardDto();
		try{
			//ó����
			con=getConnection();
			String sql="select * from qz_board_free where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();//��������
			
			while(rs.next()){
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_subject(rs.getString("q_subject"));
				dto.setQ_name(rs.getString("q_name"));
				dto.setQ_nickname(rs.getString("q_nickname"));
				dto.setQ_content(rs.getString("q_content"));
				dto.setQ_create_time(rs.getString("q_create_time"));
				dto.setQ_modify_time(rs.getString("q_modify_time"));
				dto.setQ_notice_num(rs.getInt("q_notice_num"));
				dto.setQ_read_count(rs.getInt("q_read_count"));
				
			}//while end 
		}catch(Exception ex){
			System.out.println("getBoard() ����:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return dto;
	}//getBoard() end
	
	//-----------------------------
	//�ۼ���, DB���� update
	//-----------------------------
	public void updateBoard(BoardDto dto){
		try{
			con=getConnection();
			String sql="update qz_board_free set Q_SUBJECT=?, Q_CONTENT=? where Q_NUM=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getQ_subject());
			pstmt.setString(2, dto.getQ_content());
			pstmt.setInt(3, dto.getQ_num());
			
			pstmt.executeUpdate(); //��������
			
		}catch(Exception ex){
			System.out.println("updateBoard ���� :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally	
	}//updateBoard() end
	
	//-----------------------------
	//�ۻ���
	//-----------------------------
	public void deleteBoard(int q_num){
		try{
			con=getConnection();
			sql="delete from qz_board_free where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("deleteBoard() ���� :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
	}//deleteBoard() end
	
	//------------------------------
	//list
	//------------------------------
	public Vector getBoardList(String keyField, String keyWord){
		Vector vec=new Vector();
		sql="";
		try{
			//ó����
			con=getConnection();
			stmt=con.createStatement();
			
			if(keyWord.equals(null) || keyWord.equals("")){//��ü��
				sql="select * from qz_board_free order by q_notice_group asc, q_create_time desc";
			}else{
				sql="select * from qz_board_free where "+keyField+" like '%"+keyWord+"%'"
						+ " order by Q_NUM desc";
			}//else
			
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				BoardDto dto=new BoardDto();
				
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_subject(rs.getString("q_subject"));
				dto.setQ_name(rs.getString("q_name"));
				dto.setQ_nickname(rs.getString("q_nickname"));
				dto.setQ_content(rs.getString("q_content"));
				dto.setQ_board_img(rs.getString("q_board_img"));
				dto.setQ_create_time(rs.getString("q_create_time"));
				dto.setQ_modify_time(rs.getString("q_modify_time"));
				dto.setQ_notice_num(rs.getInt("q_notice_num"));
				dto.setQ_notice_group(rs.getInt("q_notice_group"));
				dto.setQ_read_count(rs.getInt("q_read_count"));
				
				vec.add(dto);
			}//while end 
		}catch(Exception ex){
			System.out.println("getBoardList() ���� :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return vec;
		
	}//getBoardList() end
	
	//---------------------------------
	//���� �� ���� ����, �ۼ���
	//---------------------------------
	public BoardDto getNotice(int q_num){
		BoardDto dto=new BoardDto();
		
		try{
			//ó����
			con=getConnection();
			String sql="select * from qz_board_notice where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();//��������
			
			while(rs.next()){
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_subject(rs.getString("q_subject"));
				dto.setQ_name(rs.getString("q_name"));
				dto.setQ_nickname(rs.getString("q_nickname"));
				dto.setQ_content(rs.getString("q_content"));
				dto.setQ_create_time(rs.getString("q_create_time"));
				dto.setQ_modify_time(rs.getString("q_modify_time"));
				dto.setQ_notice_num(rs.getInt("q_notice_num"));
				dto.setQ_read_count(rs.getInt("q_read_count"));
				
			}//while end 
			
			
		}catch(Exception ex){
			System.out.println("getNotice() ����:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		
		return dto;
	}//getNotice() end
	//----------------------------------
	//Notice list
	//----------------------------------
	
	public Vector getNoticeList(int q_notice_num){
		Vector vec=new Vector();
		sql="";
		try{
			//ó����
			con=getConnection();
			stmt=con.createStatement();
			
			sql="select * from qz_board_notice where Q_NOTICE_NUM="+q_notice_num+" order by Q_NUM desc";
			rs=stmt.executeQuery(sql);
			
			
			while(rs.next()){
				BoardDto dto=new BoardDto();
			
				dto.setQ_num(rs.getInt("Q_NUM"));
				dto.setQ_subject(rs.getString("q_subject"));
				dto.setQ_name(rs.getString("q_name"));
				dto.setQ_nickname(rs.getString("q_nickname"));
				dto.setQ_content(rs.getString("q_content"));
				dto.setQ_notice_img(rs.getString("q_notice_img"));
				dto.setQ_create_time(rs.getString("q_create_time"));
				dto.setQ_modify_time(rs.getString("q_modify_time"));
				dto.setQ_notice_group(rs.getInt("q_notice_group"));
				dto.setQ_notice_num(rs.getInt("q_notice_num"));
				dto.setQ_read_count(rs.getInt("q_read_count"));
				
				vec.add(dto);
			}//while end 
		}catch(Exception ex){
			System.out.println("getNotice ���� :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return vec;
		
	}//getNoticeList() end
	
	
	//--------------------------------
	//notice insert
	//--------------------------------
	public void insertNotice(BoardDto dto){
		try{
			con=getConnection();
			sql="insert into qz_board_notice(Q_SUBJECT,Q_NICKNAME,Q_CONTENT,Q_CREATE_TIME,Q_MODIFY_TIME,Q_READ_COUNT,Q_NOTICE_GROUP)"
					+ " value(?,?,?,NOW(),NOW(),?,?)";
			
			pstmt=con.prepareStatement(sql); //������ ���� ��
			pstmt.setString(1, dto.getQ_subject());
			pstmt.setString(2, dto.getQ_nickname());
			pstmt.setString(3, dto.getQ_content());
			pstmt.setInt(4, dto.getQ_read_count());
			pstmt.setInt(5,dto.getQ_notice_group());
	
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("insertBoard() ���� :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
	}//insertNotice() end
		
	//--------------------------------
	//�������� ��ȸ�� ����
	//--------------------------------

	public void upNoticeCount(int q_num){
		try{
			con=getConnection();
			sql="update qz_board_notice set Q_READ_COUNT=Q_READ_COUNT+1 where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql); //������ ���� ȣ��
			pstmt.executeUpdate(); //��������
			
		}catch(Exception ex){
			System.out.println("upNoticeCount() ���� :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally 
	}//upNoticeCount() end
	
	//--------------------------------
	//������ ����
	//--------------------------------
	

	public void deleteNotice(int q_num){
		try{
			con=getConnection();
			sql="delete from qz_board_notice where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("deleteNoticeBoard() ���� :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
	}//deleteNotice() end
	
	//-----------------------------
	//�ۼ���, DB���� update
	//-----------------------------
	public void updateNotice(BoardDto dto){
		try{
			con=getConnection();
			String sql="update qz_board_notice set Q_SUBJECT=?, Q_CONTENT=? where Q_NUM=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getQ_subject());
			pstmt.setString(2, dto.getQ_content());
			pstmt.setInt(3, dto.getQ_num());
			
			pstmt.executeUpdate(); //��������
			
		}catch(Exception ex){
			System.out.println("updateNoticeBoard ���� :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally	
	}//updateNotice() end
}//class
