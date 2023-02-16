package kr.swcore.sderp.store.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class StoreDTO {
    private int storeNo;
    private int compNo;
    private int userNo;
    private String storeType;
    private int productNo;
    private String storeUnit;
    private int storeQty;
    private String locationNo;
    private String regDate;
    private String modDate;
    private String attrib;
    private String comment;
    private BigDecimal storeAmount;
    private String serialNo;
    /* 23-02-09 Ãß°¡ÇÔ */  
    private String productName;
    private int custNo;
    private String custName;
    private String productCategoryNo; 
    private String productCategoryName; 
    
    public StoreDTO(){
        super();
    }
    
}
