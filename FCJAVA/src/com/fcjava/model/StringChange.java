package com.fcjava.model;

public class StringChange {
	
	//Date의 요일 int값을 문자로 바꿔줌
	public static String getDay(int day) {
		String returnDay ="";
		switch (day) {
	    case 0:
	    	returnDay = "일";
	        break;
	    case 1:
	    	returnDay = "월";
	        break;
	    case 2:
	    	returnDay = "화";
	        break;
	    case 3:
	    	returnDay = "수";
	    	break;
	    case 4:
	    	returnDay = "목";
	    	break;
	    case 5:
	    	returnDay = "금";
	    	break;
	    case 6:
	    	returnDay = "토";
	    	break;
	}
		return returnDay;
	}
	
	//날짜,시간이 1글자일경우 앞에 0붙여줌
	public static String lengthCheck(String time) {
		if(time.length() == 1) {
			time = "0"+time;
		}
		
		return time;
	}
}
