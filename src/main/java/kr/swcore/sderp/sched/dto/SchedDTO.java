package kr.swcore.sderp.sched.dto;

import kr.swcore.sderp.common.dto.PageDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SchedDTO extends PageDTO {
		
	private int schedNo;
	private int userNo;
	private int compNo;
	private int soppNo;
	private int custNo;
	private int contNo;
	private int salesNo;
	private int techdNo;
	private int id;
	private String schedName;
	private String schedFrom;
	private String schedTo;
	private String schedTitle;
	private String schedDesc;
	private int schedCheck;
	
	private int techdCheck;
	private int salesCheck;
	
	private String subschedNo;
	private String schedActive;
	private String schedAllday;
	private String regDatetime;
	private String remindflag;
	private String modDatetime;
	private String attrib;
	private String userName;
	private String soppTitle;
	private String custName;
	private String schedType;
	private String schedTypeN;
	private String schedPlace;
	private int custmemberNo;
	private String custmemberName;
	private String schedSdate;
	private String schedEdate;
	private String schedStime;
	private String schedEtime;
	private String schedColor;
	private String schedCat;
	private String schedCatN;
	private String sTime;
	private String eTime;
	private String userId;
	private String cntrctMth;
	private String weektype;
	private String weekdays;
	private Integer weekno;
	private String title;
	private String start;
	private String end;
	private String prComment;
	private int prCheck;
	private String thComment;
	private int thCheck;
	private String nxComment;
	private int nxCheck;
	private String srepMemo;
	private String sreportNo;
	private int endCustNo;
	private String regSDate;
	private String regEDate;
	private Integer ord_id;
	private Integer weekNum;
	private String org_title;
	private String stype;
	
	private String listDateFrom;

	public SchedDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
}
