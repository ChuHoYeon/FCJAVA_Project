package java_web;

import java.sql.*;
import java.util.ArrayList;



public class qa1 {
	
	public ArrayList<qa> woob1() throws Exception {
		ArrayList<qa> qaa = new ArrayList<qa>();
		Connection conn = null;
	  	Statement  stmt = null;
 
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fc_java","root","1234");
			if(conn == null){
				throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.<br>"); //db����
			}
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from str_qa ;");
			while (rs.next()){
				qa boo = new qa();
				boo.settitle(rs.getString("title"));
				boo.setu_name(rs.getString("u_name"));
				boo.setcontent(rs.getString("content"));
				qaa.add(boo);
			}
		}finally{
			try {
				stmt.close();
			} catch (Exception ignored) {
			} 
			try{
				conn.close();
			} catch (Exception ignored){
			}
		}    
		return qaa;			
  }

}
