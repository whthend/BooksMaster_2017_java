package daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Document;

public class SearchResultDao {

	public ArrayList searchResult(String book) throws Exception{
		
		
		Connection conn=null;
		ArrayList searchResults=new ArrayList();//动态数组
		
		
		String jdbcDriver="com.mysql.jdbc.Driver";
		String connUrl="jdbc:mysql://localhost:3306/bookmanager?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		String user="root";
		String mysqlPwd="aa123123";
		
		try{
			
			Class.forName(jdbcDriver);
			conn=DriverManager.getConnection(connUrl,user,mysqlPwd);
			
			
			String sql="select * from document where title='"+book+"' or author='"+book+"' or publisher='"+book+"'";
			Statement stat=conn.createStatement();
			ResultSet rs=stat.executeQuery(sql);//查找结果的类集 
			while(rs.next()){
				
				
				Document searchResult=new Document();
				searchResult.setId(rs.getString("doc_id"));
				searchResult.setTitle(rs.getString("title"));
				searchResult.setAuthor(rs.getString("author"));
				searchResult.setPublisher(rs.getString("publisher"));
				searchResult.setPrice(rs.getString("price"));
				searchResult.setStack(rs.getString("stack"));
				searchResult.setLeftCount(rs.getString("count"));
				
				searchResults.add(searchResult);
			}
			
		}catch(Exception e){
			e.printStackTrace();//出错打印错误
		}finally{
			try{
				if(conn!=null){
					conn.close();
					conn=null;
				}
			}catch(Exception ex){
					
			}
		}
		return searchResults;
	}
}
