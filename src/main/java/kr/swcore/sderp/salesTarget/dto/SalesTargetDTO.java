package kr.swcore.sderp.salesTarget.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@ToString
public class SalesTargetDTO {
	private int compNo;
	private int deptNo;
	private int userNo;
	private String targetYear;
	private String targetType;
	private int mm01;
	private int mm02;
	private int mm03;
	private int mm04;
	private int mm05;
	private int mm06;
	private int mm07;
	private int mm08;
	private int mm09;
	private int mm10;
	private int mm11;
	private int mm12;
	private String attrib;
	
	// 확장
	private int orgId;
	private String userName;
	private List<SalesTargetDTO> salesTargetlist;
	private String targetMonth;
	private BigDecimal percent;
	private BigDecimal profitTarget;
	private BigDecimal salesTarget;
	private BigDecimal overTarget;

	// VIEW 전용 변수 확장
	private String monthDate_Group;
	private String salesTarget_Group;
	private String profitTarget_Group;
	private String percent_Group;
	private String overTarget_Group;
	private String cnt01_Group;
	private String cnt01_SUM_Group;
	private String cnt02_Group;
	private String cnt02_SUM_Group;
	private String cnt03_Group;
	private String cnt03_SUM_Group;
	private String cnt04_Group;
	private String cnt04_SUM_Group;
	private String cnt05_Group;
	private String cnt05_SUM_Group;
	private String cnt06_Group;
	private String cnt06_SUM_Group;
	private String org_id_Group;
	private String org_title_Group;

}
