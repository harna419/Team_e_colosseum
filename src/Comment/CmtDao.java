package Comment;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.servlet.http.*;

import com.oreilly.servlet.*;

import javax.servlet.http.HttpServletRequest; //���� 

import java.io.*; //�׸� ���� �����ϱ� ���ؼ� 

import Board.BoardDto;
import Comment.CmtDto;

public class CmtDao {

	private static CmtDao instance=new CmtDao(); //�̱��� ���
	
	//jsp���� ����� �޼ҵ�
	public static CmtDao getInstance(){
		return instance;
	}//getInstance
	
	//Ŀ�ؼ� ���
	private Connection getConnection() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//getConnection()
	
	public CmtDao(){}//������
	
	Connection con=null;
	Statement stmt=null;
	PreparedStatement pstmt;
	ResultSet rs=null;
	String sql="";
	BoardDto dto=null;	
	
	
	public void getNum(){
		
		
	}
	
	//pos ����
	public void upPos(){
		try{
			//ó����
			con=getConnection();//DB ����
			sql="update qz_board_comment set q_comment_pos=q_comment_pos+1";//�۾���, ��۾���
			pstmt=con.prepareStatement(sql);//������ ���� ȣ��
			pstmt.executeUpdate();//��������
		}catch(Exception ex){
			System.out.println("upPos() ����:"+ex);
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
			
			pstmt=con.prepareStatement(sql); //������ ���� ��

			pstmt.setString(1, dto.getQ_comment());
			pstmt.setString(2, dto.getQ_nickname());
			pstmt.setInt(3, dto.getQ_comment_pos());
			pstmt.setInt(4, dto.getQ_zone());
			pstmt.setInt(5, dto.getQ_comment_depth());

	
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("insertComment() ���� :"+ex);
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
			//ó����
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
			System.out.println("getCommentList() ���� :"+ex);
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
	//�۳��뺸��, �ۼ���
	//-----------------------------
	public CmtDto getComment(int q_num){
	CmtDto dto=new CmtDto();
	try{
		//ó����
		con=getConnection();//DB����
		String sql="select * from qz_board_comment where q_num="+q_num;
		pstmt=con.prepareStatement(sql);//������ ���� ����
		rs=pstmt.executeQuery();//��������
		
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
		System.out.println("getComment()����:"+ex);
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
	//�ۼ���, db���� update
	//----------------------------
	public void updateComment(CmtDto dto){
		try{
			//ó����
			con=getConnection();//DB����
			String sql="update qz_board_comment set q_comment=? where q_num=?";				
			pstmt=con.prepareStatement(sql);//������ ���� ����
			//?�� ä���
				
			pstmt.setString(1, dto.getQ_comment());
			pstmt.setInt(2, dto.getQ_num());

			pstmt.executeUpdate();//��������********
				
		}catch(Exception ex){
			System.out.println("updateComment() ����:"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally end
	}//updateComment() end
	
	//------------------------------------
	//��� ��ġȮ��
	//------------------------------------
	public void replyPos(CmtDto dto){
		try{
			con=getConnection();
			String sql="update qz_board_comment set q_comment_pos=q_comment_pos+1 where q_comment_pos>?";
			pstmt=con.prepareStatement(sql);//������ ���� ��
				
			pstmt.setInt(1, dto.getQ_comment_pos());
			pstmt.executeUpdate();//��������
				
		}catch(Exception ex1){
			System.out.println("replyPos()����:"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally
	}//replyPos() end
		
	//--------
	//��� ����
	//--------
	public void replyComment(CmtDto dto){
		
		try{
			//ó����
				
			con=getConnection();//db����
			int q_comment_depth=dto.getQ_comment_depth()+1;//�� ����
			int q_comment_pos=dto.getQ_comment_pos()+1; //����� ��ġ + 1
			
			sql="insert into qz_board_comment(Q_COMMENT,Q_NICKNAME,Q_CREATE_TIME,Q_MODIFY_TIME,Q_COMMENT_POS,Q_ZONE,Q_COMMENT_DEPTH,Q_IP)"
					+ " value(?,?,NOW(),NOW(),?,?,?,?)";
				
			pstmt=con.prepareStatement(sql);//������ ���� ��			
			//? ä���
			pstmt.setString(1, dto.getQ_comment());
			pstmt.setString(2, dto.getQ_nickname());
			pstmt.setInt(3, q_comment_pos);
			pstmt.setInt(4, dto.getQ_zone());
			pstmt.setInt(5, q_comment_depth);
			pstmt.setString(6,dto.getQ_ip());
				
			pstmt.executeUpdate();//�������� 
			
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
	//�ۻ���
	//-----------------------------
	public void deleteComment(int q_num){
		try{
			con=getConnection();
			sql="delete from qz_board_comment where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("deleteComment() ���� :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
	}//deleteComment() end	
	
}//class end 