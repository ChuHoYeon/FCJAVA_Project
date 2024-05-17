package com.fcjava.action;

import java.util.Calendar;

public class TeamCountPlayerInfo {
	private int[] genders = new int[2];
	private int[] ages = new int[6];
	private int[] positions = new int[4];
	private Calendar cal;
	
	public TeamCountPlayerInfo() {
        cal = Calendar.getInstance();
    }
    
    public void countGender(String gender) {
        if (gender.equals("man")) {
            genders[0]++;
        } else if (gender.equals("woman")) {
            genders[1]++;
        }
    }
    
    public void countAge(String birthDate) {
        // 생년월일 문자열을 년, 월, 일로 분리
        int year = Integer.parseInt(birthDate.substring(0, 4));
        // 현재 연도를 구하기 위해 Calendar 객체 생성
        int currentYear = cal.get(Calendar.YEAR);
        // 한국 나이 계산 (만 나이)
        int koreanAge = currentYear - year + 1;
        // 연령대 구분
        if (koreanAge >= 10 && koreanAge < 20) {
            ages[0]++; // 10대
        } else if (koreanAge >= 20 && koreanAge < 30) {
            ages[1]++; // 20대
        } else if (koreanAge >= 30 && koreanAge < 40) {
            ages[2]++; // 30대
        } else if (koreanAge >= 40 && koreanAge < 50) {
            ages[3]++; // 40대
        } else if (koreanAge >= 50 && koreanAge < 60) {
            ages[4]++; // 50대
        } else {
            ages[5]++; // 60대 이상
        }
    }
    
    public void countPosition(String position) {
        switch (position) {
            case "공격수":
                positions[0]++;
                break;
            case "미드필더":
                positions[1]++;
                break;
            case "수비수":
                positions[2]++;
                break;
            case "골키퍼":
                positions[3]++;
                break;
            default:
                // 다른 포지션은 무시
                break;
        }
    }
    
    public int[] getGenders() {
		return genders;
	}

	public int[] getAges() {
		return ages;
	}

	public int[] getPositions() {
		return positions;
	}
}
