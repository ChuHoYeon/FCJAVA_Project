package com.fcjava.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.model.TeamApply;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class TeamApplyAction implements DBinterface {
	static TeamApplyAction teamApplyAction = new TeamApplyAction();
	public static TeamApplyAction getTeamApplyAction() {
		return teamApplyAction;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String url = null;
		
		String uploadPath = request.getRealPath("/png/playerPhoto"); //어느위치에 저장할것인지. 폴더위치
		int size = 10*1024*1024; //업로드하는 용량
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();//모든 파일의 정보를 읽어온다
		
		String file1 =(String)files.nextElement();
		
		String t_num = multi.getParameter("t_num");
		String id = multi.getParameter("id");
		String pl_pic = multi.getFilesystemName(file1);//실제 서버에 저장되는 파일명
		if(pl_pic == null) {pl_pic = "png/son.png";};
		String back_num = multi.getParameter("back_num");
		String pl_memo = multi.getParameter("pl_memo");
		String height = multi.getParameter("height");
		String weight = multi.getParameter("weight");
		
		TeamApply teamApply = TeamApply.getTeamApply();
		teamApply.insertTeamApply(t_num, id, pl_pic, back_num, pl_memo, height, weight);
		
		System.out.println("성공 3");
		url = "fcjava.team?page=detail&teamNumber="+t_num;
		return url;
	}

}
