package com.fcjava.model;

public class StringChange {
	
	//Date�� ���� int���� ���ڷ� �ٲ���
	public String getDay(int day) {
		String returnDay ="";
		switch (day) {
	    case 0:
	    	returnDay = "�Ͽ���";
	        break;
	    case 1:
	    	returnDay = "������";
	        break;
	    case 2:
	    	returnDay = "ȭ����";
	        break;
	    case 3:
	    	returnDay = "������";
	    	break;
	    case 4:
	    	returnDay = "�����";
	    	break;
	    case 5:
	    	returnDay = "�ݿ���";
	    	break;
	    case 6:
	    	returnDay = "�����";
	    	break;
	}
		return returnDay;
	}
	
	//��¥,�ð��� 1�����ϰ�� �տ� 0�ٿ���
	public String lengthCheck(String time) {
		if(time.length() == 1) {
			time = "0"+time;
		}
		
		return time;
	}
}
