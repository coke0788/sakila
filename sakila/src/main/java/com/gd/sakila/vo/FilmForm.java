package com.gd.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
public class FilmForm {
	private Category category; //외래키를 참조하고 있기 때문에 filmId를 가져오는 것이 아니라 이렇게 가져와야 한다.
	private Film film;
	private String lastUpdate;
	private List<String> specialFeatures;
	
	public void setSpecialFeatures(List<String> specialFeatures) { //값을 여러개 받아와야 하기 때문에 매개변수를 List로 받는다.
		if(specialFeatures != null) { //special feature가 있으면
			StringBuffer sb = new StringBuffer(); //Stringbuffer에 문자열을 저장할것이다. (그러기 위한 new 연산자 생성--> 초기화)
			for(String sf : specialFeatures) { //받아올 값들을 foreach문으로 반복해서 가져올 것.
				sb.append(sf+","); //sb에 합칠 것이다. sf(special features들의 문자열), 형태로
			}
			this.film.setSpecialFeatures(sb.toString().substring(0, sb.toString().length()-1)); //맨 마지막의 , 빼기.
		}
	}
}
