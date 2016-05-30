package Message;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Board.BoardDao;
import Board.BoardDto;
import Member.MemberDao;
import Member.MemberDto;

public class MessageDao {

private static MessageDao instance=new MessageDao(); //싱글톤 사용
	
	//jsp에서 사용할 메소드
	public static MessageDao getInstance(){
		return instance;
	}//getInstance
	
	//커넥션 얻기
	private Connection getConnection() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//getConnection()
	
	public MessageDao(){}//생성자
	
	Connection con=null;
	Statement stmt=null;
	PreparedStatement pstmt;
	ResultSet rs=null;
	String sql="";
	String sql2="";
	String sql3="";
	MessageDto dto=null;
	
	public void insertMessage(MessageDto dto){
		MemberDto mdto=new MemberDto();
		
		String send_id="";
		String send_name="";
		String send_nickname2="";
		String receive_id="";
		String receive_name="";
		String receive_nickname2="";
		
		try{
			con=getConnection();
			
			String send_nickname=dto.getQ_nickname_receive();
			String receive_nickname=dto.getQ_nickname_send();
			sql2="select * from qz_user_info where q_nickname='"+send_nickname+"'";
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql2);

			
			while(rs.next()){
			
				receive_id=rs.getString("q_id");
				receive_name=rs.getString("q_name");
				receive_nickname2=rs.getString("q_nickname");
			}
			
			sql3="select * from qz_user_info where q_nickname='"+receive_nickname+"'";
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql3);

			
			while(rs.next()){
			
				send_id=rs.getString("q_id");
				send_name=rs.getString("q_name");
				send_nickname2=rs.getString("q_nickname");
			}
			
			sql="insert into qz_message_box(q_nickname_send, q_nickname_receive, q_id_receive, q_id_send, q_name_receive, q_name_send, q_msg_content, q_send_time) values('"+send_nickname2+"','"+receive_nickname2+"','"+receive_id+"','"+send_id+"','"+receive_name+"','"+send_name+"',?,NOW())";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getQ_msg_content());
			pstmt.executeUpdate();
			
		}catch(Exception ex1){
			System.out.println("insertMessage예외:"+ex1);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex){}
		}
	}//insertMessage() end
	
	public Vector getMessageList(String q_nickname_receive){
		Vector vec=new Vector();
		sql="";
		try{
			//처리문
			con=getConnection();
			stmt=con.createStatement();
			
			sql="select * from qz_message_box where q_nickname_receive='"+q_nickname_receive+"' order by q_send_time desc";
			rs=stmt.executeQuery(sql);
			
			
			while(rs.next()){
				MessageDto dto=new MessageDto();
			
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_id_receive(rs.getString("q_id_receive"));
				dto.setQ_id_send(rs.getString("q_id_send"));
				dto.setQ_name_receive(rs.getString("q_name_receive"));
				dto.setQ_name_send(rs.getString("q_name_send"));
				dto.setQ_nickname_receive(rs.getString("q_nickname_receive"));
				dto.setQ_nickname_send(rs.getString("q_nickname_send"));
				dto.setQ_msg_content(rs.getString("q_msg_content"));
				dto.setQ_send_time(rs.getTimestamp("q_send_time"));
				
				vec.add(dto);
			}//while end 
		}catch(Exception ex){
			System.out.println("getMessageList 예외 :"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return vec;
		
	}//getNoticeList() end
	
	//-------------------------------------
	//메세지 내용보기
	//-------------------------------------
	
	public MessageDto getMessage(int q_num){
		MessageDto dto=new MessageDto();
		try{
			//처리문
			con=getConnection();
			String sql="select * from qz_message_box where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();//쿼리수행
			
			while(rs.next()){
				dto.setQ_num(rs.getInt("q_num"));
				dto.setQ_id_receive(rs.getString("q_id_receive"));
				dto.setQ_id_send(rs.getString("q_id_send"));
				dto.setQ_name_receive(rs.getString("q_name_receive"));
				dto.setQ_name_send(rs.getString("q_name_send"));
				dto.setQ_nickname_receive(rs.getString("q_nickname_receive"));
				dto.setQ_nickname_send(rs.getString("q_nickname_send"));
				dto.setQ_msg_content(rs.getString("q_msg_content"));
				dto.setQ_send_time(rs.getDate("q_send_time"));
				
			}//while end 
		}catch(Exception ex){
			System.out.println("getMessage() 예외:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
		return dto;
	}//getBoard() end
	
	public void deleteMessage(int q_num){
		try{
			con=getConnection();
			sql="delete from qz_message_box where Q_NUM="+q_num;
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("deleteMessage() 예외 :"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally
	}//deleteNotice() end
}
