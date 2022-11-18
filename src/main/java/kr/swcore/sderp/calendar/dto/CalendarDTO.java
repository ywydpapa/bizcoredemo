package kr.swcore.sderp.calendar.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class CalendarDTO {

	private int eventNo;
	private String schedTitle;
	private String schedFrom;
	private String schedTo;
	private String shcedDetail;
	private int schedNo;
	private int userNo;
	private int soppNo;
	private int custNo;
	private String userName;
	private String custName;
	private String soppTitle;
	private String title;
	private String start;
	private String end;
	private String allday;
	private int id;
	private String schedType;
	private String color;
	private List userNoList;
	private int compNo;

	public CalendarDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
