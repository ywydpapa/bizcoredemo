package kr.swcore.sderp.account.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class AccountDTO {
    private Integer vatId;
    private Integer compNo;
    private Integer vatBuyerCustNo;
    private Integer vatSellerCustNo;
    private String vatBuyerName;
    private String vatSellerName;
    private String vatStatus;
    private String vatNo;
    private String vatIssueDate;
    private String vatTradeDate;
    private String vatType;
    private BigDecimal vatTax;
    private BigDecimal vatAmount;
    private String vatRemark;
    private String regDate;
    private String modDate;
    private String attrib;
    private Integer vatdataId;
    private String tradeDate;
    private Integer itemNo;
    private String itemTitle;
    private String itemUnit;
    private BigDecimal itemNetprice;
    private Integer itemQuty;
    private BigDecimal itemAmount;
    private BigDecimal itemVat;
    private BigDecimal itemRemark;
    private Integer linkedDocNo;
    private String vatTransDate;
    private String vatSerial;
    private String vatIssueType;
    private String vatEmail;
    private BigDecimal vatSum;
    private String custName;
    private String custName_sub;
    private int resultCount;

    private Integer bacId;
    private String bankCode;
    private String bacNo;
    private String bacSerial;
    private String bacIssueDate;
    private String lastUpdTime;
    private String bacOwner;
    private String bacType;
    private BigDecimal bacBalance;
    private Integer baclogId;
    private BigDecimal inAmt;
    private BigDecimal outAmt;
    private String baclogTime;
    private String logType;
    private String logRemark;
    private BigDecimal balanceAmt;
    private String branchCode;
    private String linkDoc;
    private BigDecimal bacLimit;
    private String bacMemo;
    private String bacBranch;
    private String bacTypeN;
    private String bankCodeN;
    private String bacStatus;
    
    private String regDatetime;
    private String issueDate;
    private int userNo;
    private String userName;
    private String dataTitle;
    private String dataQuanty;
    private String dataVat;
    private String dataAmt;
    private String dataTotal;
    private String dataRemark;
    private String vatDate;
    private String soppTitle;
    private int soppNo;
    private int getNo;
    private int count;
    private String bacDesc;
    
    private String vatIssueDateFrom;
    private String vatIssueDateTo;
    
    private String listDateFrom;
    private BigDecimal amount;
    private BigDecimal tax;
    
    private int cardNo;
    private String depName;
    private String cardSerial;
    private String cardDivision;
    private String cardBank;
    private String cardStatus;
    private String cardMemo;
    private String cardIssueDate;
    private int cardLogNo;
    private String appContents;
    private String appSerial;
    private String useDivision;
    private String salesType;
    private int instPeriod;
    private BigDecimal appAmount;
    private String appExchange;
    private String appDate;
    private String appTime;
    private BigDecimal vatAmountB;
    private BigDecimal vatAmountS;
    private BigDecimal serialTotalB;
    private BigDecimal serialTotalS;
    private int custNo;
    private int custCRbalance;
    private int custDRbalance;
    private int custBalance;
    private String vatProductName;
    private int betFirstNum;
    private int betLastNum;
    private int detailId;
    private String linkType;
    private String linkDocno;
    private String vatMemo;
    private int buyrNo;
    private int buyrMemberNo;
    private String custMname;
    private String modal_vatmemo;
    private BigDecimal modal_receive_data;
    private BigDecimal modal_vatmemo_secound;
    private BigDecimal total_Amt;
    private BigDecimal received_price;
    private BigDecimal difference_price;
    private String difference_memo;
    private BigDecimal receive_data;
    private BigDecimal remain_data;
    private BigDecimal modal_receive_data_sole;
    private BigDecimal cancel_lincked_price;
    
    //계산서 추가 컬럼
    private int contNo;
    private String contTitle;
    private String vatBillType;
    private String vatRecType;
    private String vatStandard;
    private int vatQuan;
    private BigDecimal vatNet;
    private int selectYear;
    private BigDecimal test;
    private String custName_modal;
    private String regSDate_modal;
    private String regEDate_modal;
    
    //vatHtml
    private String recCustName;
    private String recBossName;
    private String recCustAddrFirst;
    private String recCustAddrLast;
    private String recCustVatType;
    private String recCustVatBiz;
    private String recCustVatNo;
    private String proCustName;
    private String proBossName;
    private String proCustEmail;
    private String proCustAddrFirst;
    private String proCustAddrLast;
    private String proCustVatType;
    private String proCustVatBiz; 
    private String proCustVatNo;
    
    //계좌내역 메모 기능
    private String bacUpdateMemo;
    
    //아이디 값 들고오기
    private int getId;
    
    //계좌내역검색
    private String baclogTimeFrom;
    private String baclogTimeTo;
    
    //카드구별번호
    private String cardDisNum;
    
    //거래처별 계산서
    private BigDecimal sumVatTax;
    private BigDecimal sumVatAmount;
    
    //원장
    private String custVatno;
    private String custBossname;
    private BigDecimal vatTotal;
    
    
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
	private String mouth;
	private String last_mouth;
	private BigDecimal month_target;

	private BigDecimal settleCRbalance;
	private BigDecimal settleDRbalance;
	private int contribution_percent;
	private int main_userNo;
	
	//금액 검색
	private BigDecimal vatTotalFrom;
	private BigDecimal vatTotalTo;
	
	private BigDecimal inListAmt;
    private BigDecimal outListAmt;
    private int user_card;
    private String vatSdate;
    private String vatEdate;
    private Integer docUserNo;
    private String appDateFrom;
    private String appDateTo;
    
    //메인 대쉬보드 추가.
    private String appStatus;
    private String docType;
    private BigDecimal docAmount;
    private String firstUser;
    private Integer attType;
    private String attStart;
    private String attEnd;
    private String maintenance_s;
    private String maintenance_e;
    private BigDecimal maintenance_sum;
    
}

