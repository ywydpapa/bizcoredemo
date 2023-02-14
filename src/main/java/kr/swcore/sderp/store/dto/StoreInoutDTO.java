package kr.swcore.sderp.store.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class StoreInoutDTO {
    private int inoutNo;
    private String inoutType;
    private int inoutQty;
    private int storeNo;
    private String locationNo;
    private String comment;
    private String regDate;
    private String modDate;
    private String attrib;
    
    
    /* 23-02-14 Ãß°¡ */ 
    private int productNo;
    private String productName;
    private String serialNo;
    
    
    
    public StoreInoutDTO(){
        super();
    }
    
}
