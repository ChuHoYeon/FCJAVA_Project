package com.fcjava.controller.interfaces;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DBinterface {
	
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception ;

}
