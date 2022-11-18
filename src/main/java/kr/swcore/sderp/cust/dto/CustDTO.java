package kr.swcore.sderp.cust.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
public class CustDTO {
	
	private int custNo;
	private int compNo;
	private int custCompNo;
	private String custName;
	private String custVatno;
	private String custEmail;
	private String custVatemail;
	private String custBossname;
	private int custdataNo;
	private int catNo;
	private String dataStr;
	private int dataNum;
	private MultipartFile dataBlob;
	private String attrib;
	private int buyrNo;
	private String buyrName;
	private int ptncNo;
	private String ptncName;
	private String custYn;
	private String buyrYn;
	private String ptncYn;
	private String suppYn;
	private int supplyNo;
	private String supplyName;
	private String custVattype;
	private String custVatbiz;
	private String custVatmemo;
	private String custMname;
	private String custMrank;
	private String custMmobile;
	private String custMtel;
	private String custMemail;
	private String custMmemo;
	private String custPostno;
	private String custAddr;
	private String custAddr2;
	private String custTel;
	private String custFax;
	private String custMemo;
	private String compType;
	private String saleType;
	private int custData02no;
	private int custData03no;
	private int custData04no;
	private String custByear;
	private BigDecimal custCRbalance;
	private BigDecimal custDRbalance;

	public CustDTO() {
		super();
		// TODO Auto-generated constructor stub
	} 

}
