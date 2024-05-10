package com.fcjava.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.TeamBoardDTO;
import com.fcjava.model.TeamBoardWrite;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class TeamBoardWriteAction implements DBinterface{
	static TeamBoardWriteAction teamBoardWriteAction = new TeamBoardWriteAction();
	public static TeamBoardWriteAction getTeamBoardWriteAction() {
		return teamBoardWriteAction;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String url = null;
		String t_num = null;
		String realFolder="";
		String saveFolder="/png/boardUpload";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);
		
		MultipartRequest multi=new MultipartRequest(request,realFolder,fileSize, "UTF-8", new DefaultFileRenamePolicy());
		t_num = multi.getParameter("t_num");
		TeamBoardDTO teamBoard = new TeamBoardDTO();
		teamBoard.setT_num(Integer.parseInt(t_num));
		teamBoard.setBoard_id(multi.getParameter("board_id"));
		teamBoard.setBoard_title(multi.getParameter("board_title"));
		teamBoard.setBoard_content(multi.getParameter("board_content"));
		teamBoard.setBoard_file(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		TeamBoardWrite write = TeamBoardWrite.getTeamBoardWrite();
		write.insertTeamBoard(teamBoard);
		
		url="fcjava.team?page=detail&teamNumber="+t_num;
		return url;
	}

}
