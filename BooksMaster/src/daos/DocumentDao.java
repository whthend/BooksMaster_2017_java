package daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Document;

public class DocumentDao {
	
	public ArrayList searchAllBooks() throws Exception{
		
		//
		Connection conn=null;
		ArrayList searchBooks=new ArrayList();
		
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
			String sql="select * from document";
			Statement stat=conn.createStatement();
			ResultSet rs=stat.executeQuery(sql);
			while(rs.next()){
				
				//ʵ����VO
				Document searchBook=new Document();
				searchBook.setId(rs.getString("doc_id"));
				searchBook.setTitle(rs.getString("title"));
				searchBook.setAuthor(rs.getString("author"));
				searchBook.setPublisher(rs.getString("publisher"));
				searchBook.setPrice(rs.getString("price"));
				searchBook.setStack(rs.getString("stack"));
				searchBook.setLeftCount(rs.getString("count"));
				
				searchBooks.add(searchBook);
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
		return searchBooks;
	}
}
