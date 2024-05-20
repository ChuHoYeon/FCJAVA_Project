package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.PageDTO;
import com.fcjava.dto.PlayerDTO;
import com.fcjava.dto.TeamBoardDTO;
import com.fcjava.dto.TeamDTO;
import com.fcjava.dto.TeamFormationDTO;
import com.fcjava.dto.TeamGameResultDTO;
import com.fcjava.model.TeamBoard;
import com.fcjava.model.TeamDetail;
import com.fcjava.model.TeamFormation;
import com.fcjava.model.TeamGameResult;
import com.fcjava.model.TeamPlayersList;

public class TeamDetailAction implements DBinterface{
	static TeamDetailAction teamDetailAction = new TeamDetailAction();
	public static TeamDetailAction getTeamDetailAction() {
		return teamDetailAction;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String teamNumber = request.getParameter("teamNumber");
		String url = null;
		if(teamNumber != null) {
			
			//팀 정보
			TeamDetail teamDetail = TeamDetail.getTeamDetail();
			TeamDTO team = teamDetail.getTeam(teamNumber);
			request.setAttribute("team", team);
			
			int tabNumber = 0;
			if(request.getParameter("tabNumber")!=null){
				tabNumber = Integer.parseInt(request.getParameter("tabNumber"));
			}
			request.setAttribute("tabNumber", tabNumber);
			//선수 목록
			TeamPlayersList teamPlayersList = TeamPlayersList.getTeamPlayersList();
			List<PlayerDTO> playerList = teamPlayersList.getPlayerList(teamNumber);
			request.setAttribute("playerList", playerList);
			
			// 성별, 나이, 포지션 정보 카운트
			TeamCountPlayerInfo playerInfoCounter = new TeamCountPlayerInfo();
			for(PlayerDTO player : playerList) {
				playerInfoCounter.countGender(player.getGender());
                playerInfoCounter.countAge(player.getB_day());
                playerInfoCounter.countPosition(player.getPosition());
			};
			request.setAttribute("genders", playerInfoCounter.getGenders());
			request.setAttribute("ages", playerInfoCounter.getAges());
			request.setAttribute("positions", playerInfoCounter.getPositions());
			
			//포메이션 목록
			TeamFormation teamFormation = TeamFormation.getTeamFormation();
			List<TeamFormationDTO> teamFormations = teamFormation.getTeamFormations(teamNumber);
			request.setAttribute("teamFormations", teamFormations);
			
			//결과 목록
			TeamGameResult teamGameResult = TeamGameResult.getTeamGameResult();
			List<TeamGameResultDTO> teamGameResultList = teamGameResult.getTeamGameAllResult(teamNumber);
			request.setAttribute("teamGameResultList", teamGameResultList);
			
			//게시판 목록
			int page=1;
			int limit=13;
			List<TeamBoardDTO> teamBoardList = null;
			if(request.getParameter("boardpage")!=null){
				page=Integer.parseInt(request.getParameter("boardpage"));
			}
			TeamBoard teamBoard = TeamBoard.getTeamBoard();
			int listCount = teamBoard.getBoardCount(teamNumber);
			teamBoardList = teamBoard.getBoardList(teamNumber, page, limit);
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
			
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("teamBoardList", teamBoardList);
	   	    
			url = "teamDetail.jsp";
		} else {
			url = "index.jsp";
		}
		return url;
	}

}
