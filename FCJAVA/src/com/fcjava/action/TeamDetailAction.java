package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.PageDTO;
import com.fcjava.dto.PlayerDTO;
import com.fcjava.dto.TeamBoardDTO;
import com.fcjava.dto.TeamDTO;
import com.fcjava.dto.TeamFormationDTO;
import com.fcjava.dto.TeamGameResultDTO;
import com.fcjava.dto.TeamScheduleDTO;
import com.fcjava.service.TeamService;

public class TeamDetailAction implements Action{
	
	private static final TeamDetailAction instance = new TeamDetailAction();

	private final TeamService teamService = TeamService.getInstance();
	
	private TeamDetailAction() {}
	
	public static TeamDetailAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String teamNumber = request.getParameter("teamNumber");
		String url = null;

		//팀 정보
		TeamDTO team = teamService.findTeam(teamNumber);
		
		int tabNumber = 0;
		if(request.getParameter("tabNumber")!=null){
			tabNumber = Integer.parseInt(request.getParameter("tabNumber"));
		}
		
		//선수 목록
		List<PlayerDTO> playerList = teamService.findPlayerList(teamNumber);
		
		// 성별, 나이, 포지션 정보 카운트
		TeamPlayerSummaryCounter playerInfoCounter = new TeamPlayerSummaryCounter();
		for(PlayerDTO player : playerList) {
			playerInfoCounter.countGender(player.getGender());
            playerInfoCounter.countAge(player.getB_day());
            playerInfoCounter.countPosition(player.getPosition());
		};
		
		//포메이션 목록
		List<TeamFormationDTO> teamFormations = teamService.findTeamFormations(teamNumber);
		
		//결과 목록
		List<TeamGameResultDTO> teamGameResultList = teamService.findTeamGameResults(teamNumber);
		
		//게시판 목록
		int page=1;
		int limit=13;
		List<TeamBoardDTO> teamBoardList = null;
		if(request.getParameter("boardpage")!=null){
			page=Integer.parseInt(request.getParameter("boardpage"));
		}
		
		int listCount = teamService.countTeamBoards(teamNumber);
		teamBoardList = teamService.findTeamBoardList(teamNumber, page, limit);
		int maxPage=(int)((double)listCount/limit+0.95);
		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   	    int endPage = startPage+10-1;
   	    if (endPage> maxPage) endPage= maxPage;
   	    PageDTO pageInfo = new PageDTO();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		
		//팀 일정목록
		List<TeamScheduleDTO> teamScheduleList = teamService.findScheduleList(teamNumber);
		
		request.setAttribute("team", team);
		request.setAttribute("tabNumber", tabNumber);
		request.setAttribute("playerList", playerList);
		request.setAttribute("genders", playerInfoCounter.getGenders());
		request.setAttribute("ages", playerInfoCounter.getAges());
		request.setAttribute("positions", playerInfoCounter.getPositions());
		request.setAttribute("teamFormations", teamFormations);
		request.setAttribute("teamGameResultList", teamGameResultList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("teamBoardList", teamBoardList);
		request.setAttribute("teamScheduleList", teamScheduleList);
   	    
		url = "teamDetail.jsp";
		return url;
	}

}
