package daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Reader;
import beans.Document;

public class ReaderDao {
	
	public ArrayList reader() throws Exception{
		
		//
		Connection conn=null;
		ArrayList readers=new ArrayList();
		
		//ʹ�õ�MySQL�����������ݿ�
		String jdbcDriver="com.mysql.jdbc.Driver";
		String connUrl="jdbc:mysql://localhost:3306/bookmanager?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		String user="root";
		String mysqlPwd="aa123123";
		
		try{
			//�������ݿ�
			Class.forName(jdbcDriver);
			conn=DriverManager.getConnection(connUrl,user,mysqlPwd);
			
			//ִ��sql���
			String sql="select * from reader";
			Statement stat=conn.createStatement();
			ResultSet rs=stat.executeQuery(sql);
			while(rs.next()){
				
				//ʵ����VO
				Reader reader=new Reader();
				reader.setPatronId(rs.getString("patron_id"));
				reader.setName(rs.getString("name"));
				reader.setGender(rs.getString("gender"));
				reader.setPwd(rs.getString("pwd"));
				reader.setId(rs.getString("id"));
				reader.setTel(rs.getString("tel"));
				reader.setItemcounts(rs.getString("itemcounts"));
				
				readers.add(reader);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null){
					conn.close();
					conn=null;
				}
			}catch(Exception ex){
					
			}
		}
		return readers;
	}
	public ArrayList reader(String account) throws Exception{
		
		//
		Connection conn=null;
		ArrayList readers=new ArrayList();
		
		//ʹ�õ�MySQL�����������ݿ�
		String jdbcDriver="com.mysql.jdbc.Driver";
		String connUrl="jdbc:mysql://localhost:3306/bookmanager";
		String user="root";
		String mysqlPwd="1234";
		
		try{
			//�������ݿ�
			Class.forName(jdbcDriver);
			conn=DriverManager.getConnection(connUrl,user,mysqlPwd);
			
			//ִ��sql���
			String sql="select * from reader where patron_id="+account+"";
			Statement stat=conn.createStatement();
			ResultSet rs=stat.executeQuery(sql);
			while(rs.next()){
				
				//ʵ����VO
				Reader reader=new Reader();
				reader.setPatronId(rs.getString("patron_id"));
				reader.setName(rs.getString("name"));
				reader.setGender(rs.getString("gender"));
				reader.setPwd(rs.getString("pwd"));
				reader.setId(rs.getString("id"));
				reader.setTel(rs.getString("tel"));
				reader.setItemcounts(rs.getString("itemcounts"));
				
				readers.add(reader);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null){
					conn.close();
					conn=null;
				}
			}catch(Exception ex){
					
			}
		}
		return readers;
	}
}
