package com.fcjava.action;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.TeamDTO;
import com.fcjava.service.TeamService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class TeamCreateAction implements Action {
	private static final TeamCreateAction instance = new TeamCreateAction();

	private final TeamService teamService = TeamService.getInstance();

	private TeamCreateAction() {}

	public static TeamCreateAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uploadPath = request.getServletContext().getRealPath("/png/playerPhoto");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

		Enumeration<?> files = multi.getFileNames();
		String firstFile = files.hasMoreElements() ? (String) files.nextElement() : null;
		String secondFile = files.hasMoreElements() ? (String) files.nextElement() : null;

		String id = (String) request.getSession().getAttribute("ID");
		String[] weekTime = multi.getParameterValues("week");
		StringBuilder week = new StringBuilder();
		if (weekTime != null) {
			for (String str : weekTime) {
				week.append(str);
			}
		}

		TeamDTO team = TeamDTO.builder()
				.id(id)
				.t_name(multi.getParameter("teamName"))
				.t_logo(secondFile != null ? multi.getFilesystemName(secondFile) : null)
				.hom_city(multi.getParameter("city"))
				.week_time(week.toString())
				.t_info(multi.getParameter("teamInfo"))
				.max_p_num(Integer.parseInt(multi.getParameter("maxNum")))
				.t_skill(multi.getParameter("skill"))
				.t_sns(multi.getParameter("teamSns"))
				.t_age(multi.getParameter("age"))
				.build();

		teamService.createTeam(team);

		String teamNumber = teamService.findLatestTeamNumByUser(id);
		teamService.applyTeam(
				teamNumber,
				id,
				firstFile != null ? multi.getFilesystemName(firstFile) : null,
				multi.getParameter("back_num"),
				multi.getParameter("position"),
				multi.getParameter("pl_memo"),
				multi.getParameter("height"),
				multi.getParameter("weight"));

		List<TeamDTO> myTeamList = teamService.findMyTeamList(id);
		request.getSession().setAttribute("MyTeamList", myTeamList);
		return "redirect:fcjava.team?page=detail&teamNumber=" + teamNumber;
	}
}
