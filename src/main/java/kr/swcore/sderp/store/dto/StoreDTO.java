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
    private String inoutType;
    private int productNo;
    private int suppNo;
    private String storeUnit;
    private int storeQty;
    private String locateCode;
    private String regDate;
    private String modDate;
    private String attrib;
    private String comment;
    private BigDecimal storeNetprice;
    private String serialNo;

    public StoreDTO(){
        super();
    }

}
