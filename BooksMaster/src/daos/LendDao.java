package daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Lend;
import beans.Document;

public class LendDao {

	public ArrayList lendHis() throws Exception{
	//
	Connection conn=null;
	ArrayList lends=new ArrayList();
	
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
		String sql="select * from lendhistory";
		Statement stat=conn.createStatement();
		ResultSet rs=stat.executeQuery(sql);
		while(rs.next()){
			
			//ʵ����VO
			Lend lend=new Lend();
			lend.setLendId(rs.getString("lend_id"));
			lend.setPatronId(rs.getString("patron_id"));
			lend.setDocId(rs.getString("doc_id"));
			lend.setLendtime(rs.getString("lendtime"));
			lend.setOperatorId(rs.getString("returntime"));
			
			lends.add(lend);
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
	return lends;
}
}
