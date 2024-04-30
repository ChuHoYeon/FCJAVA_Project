package fc_java;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.fcjava.dto.TeamDTO;

public class TeamDB {
		//DB 시작
		Connection startConnection() throws Exception {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fc_java?characterEncoding=utf8", "root", "1234");
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
			String insertSql;
			if(logo != null) {
				insertSql = String.format("insert into fc_java.team_info (t_num, id, t_name, t_logo, hom_city, week_time, t_info, t_c_day, max_p_num, t_skill, t_sns, t_age) values(default,'%s','%s','%s','%s','%s','%s',now(),'%s','%s','%s','%s');",id, name, logo, city, week, info, maxNum, skill, sns, age);
			} else {
				insertSql = String.format("insert into fc_java.team_info (t_num, id, t_name, hom_city, week_time, t_info, t_c_day, max_p_num, t_skill, t_sns, t_age) values(default,'%s','%s','%s','%s','%s',now(),'%s','%s','%s','%s');",id, name, city, week, info, maxNum, skill, sns, age);
			}
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
		//팀 번호 확인
		public String getTeamNum(String id) throws Exception {
			Connection conn = null;
			Statement stmt = null;
			String t_num = null;
			String sql = "SELECT * FROM fc_java.team_info WHERE BINARY id = '"+id+"' ORDER BY t_c_day desc;";
			try {
				conn = startConnection();
				stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				if (rs.next()) {
					t_num = rs.getString("t_num");
				}
			} finally {
				endConnection(conn, stmt);
			}

			return t_num;
		}
		public List<TeamDTO> getTeamList(String id) throws Exception {
			Connection conn = null;
			Statement stmt = null;
			List<TeamDTO> myTeamList = new ArrayList<>();
			String sql = "SELECT fc_java.team_info.* FROM fc_java.team_info JOIN fc_java.pl_info ON fc_java.team_info.t_num = fc_java.pl_info.t_num WHERE fc_java.pl_info.id = '"+id+"' order by fc_java.pl_info.pl_ap_date desc;";
			try {
				conn = startConnection();
				stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
					TeamDTO team = new TeamDTO();
					team.setT_num(rs.getInt("t_num"));
					team.setT_name(rs.getString("t_name"));
					team.setT_logo(rs.getString("t_name"));
					team.setMax_p_num(rs.getInt("max_p_num"));
					myTeamList.add(team);
				}
			} finally {
				endConnection(conn, stmt);
			}
			
			return myTeamList;
		}
}
