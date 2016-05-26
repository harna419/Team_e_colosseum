package Member;

import java.sql.*;
import java.util.Vector;

import javax.sql.*;//DataSource
import javax.naming.*;//lookup

//DAO:�����Ͻ�����
public class MemberDao {

	//�̱��� ��ü ���, ��ü�� �ϳ��� ����ϵ��� �Ѵ�. �޸� ����� �ȴ�.
	private static MemberDao instance=new MemberDao();//��ü��
	
	//JSP ��ü�� �������� : LoginDao.getInastance()
	public static MemberDao getInstance(){
		return instance;
	}//getInstance()
	
	private MemberDao(){}//����Ʈ ����. �ܺο��� ��ü�� ���Ѵ�. <jsp:useBean>�� ��� ����
	
	//---------------------
	// Ŀ�ؼ� Ǯ ��� �޼���
	//---------------------
	private Connection getConnection() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//getConnection()
	
	//----------------------
	// ȸ�� ����
	//----------------------
	public void insertMember(MemberDto dto) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			con=getConnection();//Ŀ�ؼ� ��´�
			String sql="insert into qz_user_info(q_id, q_pwd, q_name, q_jumin1, q_jumin2, q_nickname, q_sex, q_pw_question, q_pw_reply, q_create_time) "
					+ " values(?,?,?,?,?,?,?,?,?,NOW())";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getQ_id());
			pstmt.setString(2, dto.getQ_pwd());
			pstmt.setString(3, dto.getQ_name());
			pstmt.setInt(4, dto.getQ_jumin1());
			pstmt.setInt(5, dto.getQ_jumin2());
			
			pstmt.setString(6, dto.getQ_nickname());
			pstmt.setString(7, dto.getQ_sex());
			pstmt.setString(8, dto.getQ_pw_question());
			pstmt.setString(9, dto.getQ_pw_reply());
		
			pstmt.executeUpdate();//�������� *********
		}catch(Exception ex1){
			System.out.println("insertMember() ���� :"+ex1);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
			
			
		}//finally end
	}//insertMember() end 
	
	//------------------
	// id �ߺ� üũ
	//------------------
	public int confirmId(String q_id) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int x=-1;
		try{
			con=getConnection();//Ŀ�ؼ� ���
			pstmt=con.prepareStatement("select q_id from qz_user_info where q_id=?");
			pstmt.setString(1, q_id);
			rs=pstmt.executeQuery();//���� ����
			
			if(rs.next()){//������� id
				x=1;
			}else{//��밡���� id
				x=-1;
			}
		}catch(SQLException ex1){
			System.out.println("confirmId() ���� :"+ex1);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally end
		return x;
	}//confirmId() end
	
	//-----------------
	//confirm nickname
	//----------------
	
	public int confirmNickname(String q_nickname) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int x=-1;
		try{
			con=getConnection();//Ŀ�ؼ� ���
			pstmt=con.prepareStatement("select q_nickname from qz_user_info where q_nickname=?");
			pstmt.setString(1, q_nickname);
			rs=pstmt.executeQuery();//���� ����
			
			if(rs.next()){//������� id
				x=1;
			}else{//��밡���� id
				x=-1;
			}
		}catch(SQLException ex1){
			System.out.println("confirmNickname() ���� :"+ex1);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally end
		return x;
	}//confirmId() end
	
	//------------------
	// �α���
	//------------------
		
	public int userCheck(String q_id,String q_pwd) throws Exception{
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String dbPwd="";
		int x=-1;
			
		try{
			con=getConnection();//Ŀ�ؼ� ���
			pstmt=con.prepareStatement("select * from qz_user_info where q_id=?");
			pstmt.setString(1, q_id);
			rs=pstmt.executeQuery();//���� ����
			
			if(rs.next()){
				dbPwd=rs.getString("q_pwd");
				if(q_pwd.equals(dbPwd)){
					x=1;//��������
				}else{
					x=0;//��ȣ�� Ʋ��
				}
			}else{
				x=-1;//�ش� ���̵� ����
			}//else
				
		}catch(Exception ex){
			
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
			
		}//finally end
		return x;
	}//userCheck() end
	
	//-----------------------
	//ȸ������ ���� : ���� ���
	//-----------------------
	
	public MemberDto getMember(String q_id) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDto dto=null;
		
		try{
			con=getConnection();//Ŀ�ؼ� ������
			pstmt=con.prepareStatement("select * from qz_user_info where q_id='"+q_id+"'");
			rs=pstmt.executeQuery();//���� ����
			if(rs.next()){
					
				dto=new MemberDto();
				
				dto.setQ_id(rs.getString("q_id"));
				dto.setQ_pwd(rs.getString("q_pwd"));
				dto.setQ_name(rs.getString("q_name"));
				
				dto.setQ_jumin1(rs.getInt("q_jumin1"));
				dto.setQ_jumin2(rs.getInt("q_jumin2"));
				dto.setQ_nickname(rs.getString("q_nickname"));
				
				dto.setQ_sex(rs.getString("q_sex"));
				dto.setQ_pw_question(rs.getString("q_pw_question"));
				dto.setQ_pw_reply(rs.getString("q_pw_reply"));
	
									
			}//if
				
		}catch(Exception ex){
				
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally end
		return dto;
	}//getMember() end
	
	//---------------------
	// ȸ������ ���� : DB ����
	//---------------------
	
	public void updateMember(MemberDto dto) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			con=getConnection();//Ŀ�ؼ� ���
			String sql="update qz_user_info set q_pwd=?, q_name=?, q_nickname=?, q_sex=?, q_pw_question=?, q_pw_reply=?, q_modify_time=NOW() where q_id=?";
			pstmt=con.prepareStatement(sql);//��� ���� ���� 
			
			//String pw=dto.getPasswd();
			pstmt.setString( 1, dto.getQ_pwd());
			pstmt.setString( 2, dto.getQ_name());
			pstmt.setString( 3, dto.getQ_nickname());
			pstmt.setString( 4, dto.getQ_sex());
			pstmt.setString( 5, dto.getQ_pw_question());
			pstmt.setString( 6, dto.getQ_pw_reply());
			pstmt.setString( 7, dto.getQ_id());
		
			pstmt.executeUpdate();//���� ����
			
		}catch(Exception ex){
			System.out.println("updateMember() ����:"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex){}
		}//finally end
	}//updateMember() end
	
	//-----------
	// ȸ��Ż��
	//-----------
	public int deleteMember(String q_id, String q_pwd) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		String dbPwd="";
		int x=-1;
		
		try{
			con=getConnection();
			pstmt=con.prepareStatement("select q_pwd from qz_user_info where q_id=?");
			pstmt.setString(1,q_id);
			rs=pstmt.executeQuery();//���� ����
			
			if(rs.next()){
				dbPwd=rs.getString("q_pwd");
				if(dbPwd.equals(q_pwd)){
					pstmt2=con.prepareStatement("delete from qz_user_info where q_id=?");
					pstmt2.setString(1, q_id);
					pstmt2.executeUpdate();//���� ����
					x=1; // ȸ�� Ż��
				}else{
					x=-1; // ��й�ȣ Ʋ��
				}
			}else{
				x=0; //�������� ���� ��
			}			
		}catch(Exception ex){
			System.out.println("deleteMember() ����:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(pstmt2!=null){pstmt2.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally end
		return x;		
	}//deleteMember() end 
	
	//---------------------------
	//��й�ȣ ã��
	//---------------------------
	
	public int pwdFind(String q_id,String q_name,int q_jumin1, int q_jumin2) throws Exception{
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String dbq_name="";
		int dbq_jumin1=0;
		int dbq_jumin2=0;
		int x=-1;
			
		try{
			con=getConnection();//Ŀ�ؼ� ���
			pstmt=con.prepareStatement("select * from qz_user_info where q_id=?");
			pstmt.setString(1, q_id);
			rs=pstmt.executeQuery();//���� ����
			
			if(rs.next()){
				dbq_name=rs.getString("q_name");
				dbq_jumin1=rs.getInt("q_jumin1");
				dbq_jumin2=rs.getInt("q_jumin2");
				if(q_name.equals(dbq_name) && q_jumin1==(dbq_jumin1) && q_jumin2==(dbq_jumin2)){
					x=1;//��������
				}else{
					x=0;//��ȣ�� Ʋ��
				}
			}else{
				x=-1;//�ش� ���̵� ����
			}//else
				
		}catch(Exception ex){
			System.out.println("pwdFind() ����:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
			
		}//finally end
		return x;
	}//pwdFind() end
	
	//--------------------------
	//��й�ȣ �� ��������
	//--------------------------
	public MemberDto pwdQuestion(String q_id) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDto dto=null;
		
		try{
			con=getConnection();//Ŀ�ؼ� ������
			pstmt=con.prepareStatement("select q_pw_question, q_pw_reply from qz_user_info where q_id='"+q_id+"'");
			rs=pstmt.executeQuery();//���� ����
			if(rs.next()){
					
				dto=new MemberDto();
				
				dto.setQ_pw_question(rs.getString("q_pw_question"));
				dto.setQ_pw_reply(rs.getString("q_pw_reply"));

			}//if
				
		}catch(Exception ex){
			System.out.println("pwdQuestion() ����:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally end
		return dto;
	}//pwdQuestion() end
	
	//-------------------------------
	//��й�ȣ �缳��
	//-------------------------------
	public void updatePwd(MemberDto dto) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			con=getConnection();//Ŀ�ؼ� ���
			String sql="update qz_user_info set q_pwd=? where q_id=?";
			pstmt=con.prepareStatement(sql);//��� ���� ���� 
			
			pstmt.setString( 1, dto.getQ_pwd());
			pstmt.setString( 2, dto.getQ_id());
		
			pstmt.executeUpdate();//���� ����
			
		}catch(Exception ex){
			System.out.println("updatePwd() ����:"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex){}
		}//finally end
	}//updatePwd() end
	
	
	public String showId(String q_name,int q_jumin1,int q_jumin2) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String id=null;
		try{
			con=getConnection();//Ŀ�ؼ� ������
			pstmt=con.prepareStatement("select q_id from qz_user_info where q_name='"+q_name+"' and q_jumin1='"+q_jumin1+"'and q_jumin2='"+q_jumin2+"'");
			rs=pstmt.executeQuery();//���� ����
			if(rs.next()){				
				id = rs.getString("q_id");
			}//if
				
		}catch(Exception ex){
			System.out.println("showId() ����:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception exx){}
		}//finally end
		return id;
	}//showId() end

}//class
