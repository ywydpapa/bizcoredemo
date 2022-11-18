package kr.swcore.sderp.sopp.dto;

import kr.swcore.sderp.common.dto.PageDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

@Getter
@Setter
@ToString
public class SoppDTO extends PageDTO {

	private int soppNo;
	private int compNo;
	private int userNo;
	private int custNo;
	private int custMemberNo;
	private int ptncNo;
	private int ptncMemberNo;
	private int buyrNo;
	private int buyrMemberNo;
	private String soppTitle;
	private String soppDesc;
	private BigDecimal soppTargetAmt;
	private String soppTargetDate;
	private int soppType;
	private String soppStatus;	// TODO : 추후 DB에서 varchar -> int로 변경예정
	private Double soppSrate;
	private String soppSource;	// TODO : 출처 -> 삭제예정
	private String attrib;
	private String regDatetime;
	private String modDatetime;
	private String sopp2Desc;
	private Timestamp sopp2regDatetime;
	private String op_priority;
	private Integer cntrctMth;
	private Integer custmemberNo;
	
	// 확장
	private List<SoppDTO> soppDTOList;
	private String userName;
	private String custName;
	private String buyrName;
	private String ptncName;
	private String custMemberName;
	private String soppTypeN;
	private String soppStatusN;
	private String cntrctMthN;
	private String targetDatefrom;
	private String targetDateto;
	private String targetDatefrom2;
	private String targetDateto2;

	private String businessType;	// TODO : 영업타입 -> 삭제예정

	public SoppDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
