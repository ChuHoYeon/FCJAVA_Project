package com.fcjava.action;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fcjava.dto.TeamDTO;
import com.fcjava.service.TeamService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class TeamApplyAction implements Action {
	
	private static final TeamApplyAction instance = new TeamApplyAction();
	
	private final TeamService teamService = TeamService.getInstance();
	
	private TeamApplyAction() {}
	
	public static TeamApplyAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String uploadPath = request.getServletContext().getRealPath("/png/playerPhoto");//어느위치에 저장할것인지. 폴더위치
		int size = 10 * 1024 * 1024; //업로드하는 용량
		
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		Enumeration<?> files = multi.getFileNames(); //모든 파일의 정보를 읽어온다
		
		String fileInputName = files.hasMoreElements() ? (String) files.nextElement() : null;
		String plPic = fileInputName != null ? multi.getFilesystemName(fileInputName) : null; //실제 서버에 저장되는 파일명
		
		TeamDTO team;
		String t_num = multi.getParameter("t_num");
		String id = multi.getParameter("id");
		String back_num = multi.getParameter("back_num");
		String position = multi.getParameter("position");
		String pl_memo = multi.getParameter("pl_memo");
		String height = multi.getParameter("height");
		String weight = multi.getParameter("weight");
		
		teamService.applyTeam(t_num, id, plPic, back_num, position, pl_memo, height, weight);

		
		List<TeamDTO> myTeamList = teamService.findMyTeamList(id);
		session.setAttribute("MyTeamList", myTeamList);
		
		return "redirect:fcjava.team?page=detail&teamNumber="+t_num;
	}

}
