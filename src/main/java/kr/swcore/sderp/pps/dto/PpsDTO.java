package kr.swcore.sderp.pps.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class PpsDTO {
    private Integer ppsId;
    private Integer compNo;
    private String buyerCode;
    private String buyerName;
    private String buyerArea;
    private String buyerAreacode;
    private String reqNo;
    private String reqItemcode;
    private String reqItem;
    private BigDecimal itemNetprice;
    private Integer itemQty;
    private String itemUnit;
    private BigDecimal itemAmount;
    private String contractTitle;
    private Integer modQty;
    private BigDecimal modAmount;
    private String contractDate;
    private String deliveryDate;
    private String deliveryPlace;
    private String regDate;
    private String modDate;
    private String attrib;
    private Integer soppNo;
    private int resultCount;
    private String listDateFrom;
    private Integer detailId;
    private BigDecimal storeAmount;
    private BigDecimal ordAmount;
    private String makerName;
    private String sellerName;
    private String ordDate;
    private String confDate;
    private String vatDate;
    private String billingDate;
    private String ppsincomeDate;
    private String storeDate;
    private String payDate;
    private String commiDate;
    private String commiCust;
    private BigDecimal commiAmount;
    private String commipayDate;
    private String feeDate;
    private String feeCust;
    private BigDecimal feeAmount;
    private BigDecimal feevatAmount;
    private String feeincomeDate;
    private String remark1;
    private String remark2;
    
    private String userName;
}
