package kr.swcore.sderp.techd.dto;

import kr.swcore.sderp.common.dto.PageDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TechdDTO extends PageDTO {

	private int techdNo;
	private int custNo;
	private int compNo;
	private int soppNo;
	private int contNo;
	private int custmemberNo;
	private int userNo;
	private String techdTitle;
	private String techdDesc;
	private String techdItemmodel;
	private String techdItemversion;
	private String techdPlace;
	private String techdFrom;
	private String techdTo;
	private String techdType;
	private String techdTypeN;
	private String techdSteps;
	private String techdStepsN;
	private String custName;
	private String userName;
	private String contTitle;
	private String soppTitle;
	private String custmemberName;
	private String regdatetime;
	private String modDatetime;
	private String targetDatefrom;
	private String targetDateto;
	private String schedType;
	private String cntrctMth;

	// 확장
	private String regSDate;	// 등록일 시작
	private String regEDate;	// 등록일 끝
	private String cntrctMthN;	// 계약방법
	
	private int endCustNo;
	private String endCustName;
	private String listDateFrom;
	
	public TechdDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


}
