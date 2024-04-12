package fc_java;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class TeamDB {
		//DB 시작
		Connection startConnection() throws Exception {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fc_java", "root", "1234");
			if (conn == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
			}
			return conn;
		}
		//DB 종료
		void endConnection(Connection conn, Statement stmt) throws Exception {
			stmt.close();
			conn.close();
		}
		//팀 리스트 - 전체 팀 불러오기
		public ArrayList<Team> selectAllTeam() throws Exception {
			ArrayList<Team> teamList = new ArrayList<>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Connection conn = null;
			Statement stmt = null;
			String sql = "SELECT * FROM fc_java.team_info ORDER BY t_num DESC;";
			try {
				conn = startConnection();
				stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()) {
					Team team = new Team();
					team.setNumber(rs.getInt("t_num"));
					team.setId(rs.getString("id"));
					team.setName(rs.getString("t_name"));
					team.setLogo(rs.getString("t_logo"));
					team.setCity(rs.getString("hom_city"));
					team.setTime(rs.getString("week_time"));
					team.setInfo(rs.getString("t_info"));
					Timestamp timestamp = rs.getTimestamp("t_c_day");
	                String formattedDate = sdf.format(timestamp);
					team.setCday(formattedDate);
					team.setMaxNum(rs.getInt("max_p_num"));
					team.setSkill(rs.getString("t_skill"));
					team.setSns(rs.getString("t_sns"));
					team.setAge(rs.getString("t_age"));
					teamList.add(team);
				}
			} finally {
				endConnection(conn, stmt);
			}
			return teamList;
		}
		//팀 이름 중복확인
		public Boolean isTeamName(String teamName) throws Exception {
			Boolean result = false;
			Connection conn = null;
			Statement stmt = null;
			String sql = "SELECT * FROM fc_java.team_info WHERE BINARY t_name = '"+teamName+"';";
			try {
				conn = startConnection();
				stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				if (rs.next()) {
					result = true;
				}
			} finally {
				endConnection(conn, stmt);
			}
			return result;
		}
		//팀 생성
		public void insertTeam(String id, String name, String logo, String city, String week, String info, String maxNum, String skill, String sns, String age) throws Exception {
			Connection conn = null;
			Statement stmt = null;
			String insertSql = String.format("insert into fc_java.team_info values(default,'%s','%s','%s','%s','%s','%s',now(),'%s','%s','%s','%s');",id, name, logo, city, week, info, maxNum, skill, sns, age);
			try {
				conn = startConnection();
				stmt = conn.createStatement();
				int rowNum = stmt.executeUpdate(insertSql);
				if(rowNum < 1){
					throw new Exception("데이터를 DB에 입력할 수 없습니다.");
				}
			} finally {
				endConnection(conn, stmt);
			}
		}
}
