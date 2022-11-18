package kr.swcore.sderp.cont.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class ContDTO implements Cloneable{

	private int contNo;
	private String contTitle;
	private int soppNo;
	private int exContNo;
	private int userNo;
	private int compNo;
	private int custNo;
	private String salesType;
	private int custmemberNo;
	private int maintcustNo;
	private int supplyNo;
	private int ptncNo;
	private String contOrddate;
	private String supplyDate;
	private String delivDate;
	private BigDecimal contAmt;
	private String freemaintSdate;
	private String freemaintEdate;
	private String paymaintSdate;
	private String paymaintEdate;
	private String vatYn;
	private String contArea;
	private String contType;
	private String contDesc;
	private String attrib;
	private String soppTitle;
	private String userName;
	private String custName;
	private String supplyName;
	private String custmemberName;
	private String ptncName;
	private String targetDatefrom;
	private String targetDateto;
	private int buyrNo;
	private String buyrName;
	private String businessType;
	private String contTypeN;
	private String cntrctMth;
	private String net_profit;

	// 확장
	private String exContName;
	private String targetType;
	private String targetYear;
	private String targetMonth;
	private Integer contTypeCount;
	private Integer endCustmemberNo;
	private String endCustmemberName;
	private String regSDate;	// 등록일 시작
	private String regEDate;	// 등록일 끝
	
	// sopp 복사 시작
	private int custMemberNo;
	private int ptncMemberNo;
	private int buyrMemberNo;
	private String soppDesc;
	private BigDecimal soppTargetAmt;
	private String soppTargetDate;
	private int soppType;
	private String soppStatus;	// TODO : 추후 DB에서 varchar -> int로 변경예정
	private Double soppSrate;
	private String soppSource;	// TODO : 출처 -> 삭제예정
	private String regDatetime;
	private String modDatetime;
	private String sopp2Desc;
	private Timestamp sopp2regDatetime;
	private String op_priority;

	// 확장
	private String soppTypeN;
	private String soppStatusN;
	private String cntrctMthN;

	private String custMemberName;
	private String buyrMemberName;
	// sopp 복사 끝
	
	public ContDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}
