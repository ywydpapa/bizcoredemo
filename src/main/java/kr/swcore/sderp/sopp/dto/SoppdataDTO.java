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
	private String dataRemark;
	private String linkType;
	private String linkNo;
	private String attrib;
	private String regDatetime;
	private Boolean distMargin;

	// 확장
	private String salesCustNoN;
	private Integer productDataNo;

	public SoppdataDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
