package daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Document;
import beans.Staff;

public class StaffDao {

	public ArrayList staff() throws Exception{
		
		//
		Connection conn=null;
		ArrayList staffs=new ArrayList();
		
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
			String sql="select * from staff";
			Statement stat=conn.createStatement();
			ResultSet rs=stat.executeQuery(sql);
			while(rs.next()){
				
				//ʵ����VO
				Staff staff=new Staff();
				staff.setOperatorId(rs.getString("operator_id"));
				staff.setPwd(rs.getString("pwd"));
				staff.setName(rs.getString("name"));
				staff.setTel(rs.getString("tel"));
				staff.setGender(rs.getString("gender"));
				
				staffs.add(staff);
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
		return staffs;
	}
}
