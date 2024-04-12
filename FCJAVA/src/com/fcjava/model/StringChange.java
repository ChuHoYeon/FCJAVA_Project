package com.fcjava.model;

public class StringChange {
	
	//Date의 요일 int값을 문자로 바꿔줌
	public String getDay(int day) {
		String returnDay ="";
		switch (day) {
	    case 0:
	    	returnDay = "일요일";
	        break;
	    case 1:
	    	returnDay = "월요일";
	        break;
	    case 2:
	    	returnDay = "화요일";
	        break;
	    case 3:
	    	returnDay = "수요일";
	    	break;
	    case 4:
	    	returnDay = "목요일";
	    	break;
	    case 5:
	    	returnDay = "금요일";
	    	break;
	    case 6:
	    	returnDay = "토요일";
	    	break;
	}
		return returnDay;
	}
	
	//날짜,시간이 1글자일경우 앞에 0붙여줌
	public String lengthCheck(String time) {
		if(time.length() == 1) {
			time = "0"+time;
		}
		
		return time;
	}
}
