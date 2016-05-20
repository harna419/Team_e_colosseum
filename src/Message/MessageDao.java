package Message;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Board.BoardDao;
import Board.BoardDto;

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
	BoardDto dto=null;
	
	public void insertMessage(MessageDto dto){
		try{
			con=getConnection();
			sql="insert into qz_message_box(q_nickname_send, q_nickname_receive, q_msg_content, q_send_time) values(?,?,?,NOW())";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getQ_nickname_send());
			pstmt.setString(2, dto.getQ_nickname_receive());
			pstmt.setString(3, dto.getQ_msg_content());
			
			pstmt.executeUpdate();
			
		}catch(Exception ex1){
			System.out.println("insertMessage예외:"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex){}
		}
	}
}
