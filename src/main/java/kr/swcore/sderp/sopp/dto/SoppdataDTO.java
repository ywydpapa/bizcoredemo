package kr.swcore.sderp.sopp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class SoppdataDTO {
		
	private int soppdataNo;
	private int soppNo;
	private int userNo;
	private String userName;
	private int custNo;
	private int compNo;
	private String soppTitle;
	private int catNo;
	private int productNo;
	private int salesCustNo;
	private String catTitle;
	private String dataTitle;
	private String dataDesc;
	private String dataType;
	private int dataQuanty;
	private BigDecimal dataAmt;
	private BigDecimal dataNetprice;
	private BigDecimal dataVat;
	private BigDecimal dataTotal;
	private float dataDiscount;
	private String dataRemark;
	private String linkType;
	private String linkNo;
	private String attrib;
	private String regDatetime;
	private String issueDate;
	private String vatDate;
	private String endvataDate;
	private String vatDatefrom;
	private String vatDateto;
	private Boolean distMargin;


	private String salesCustNoN;
	private String custName;
	private Integer productDataNo;
	private int amount;
	private int take;

	private String contTitle;
	
	private String vatSerial;
	
	private String listDateFrom;
	
	private String cntrctMth;
	private String freemaintSdate;
	private String freemaintEdate;
	private int divisionMonth;
	
	public SoppdataDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
