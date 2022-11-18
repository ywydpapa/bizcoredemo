package kr.swcore.sderp.mis.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class MisDTO {

    private Integer compNo;
    private Integer userNo;
    private Integer mdays;
    private Integer ydays;
    private Integer edays;
    private Integer hdays;
    private Integer kdays;
    private String userName;
    private Integer sYear;
    //sopp
    private Integer soppNo;
    private Integer custNo;
    private Integer contNo;
    private Integer custMemberNo;
    private Integer ptncNo;
    private Integer ptncMemberNo;
    private Integer buyrNo;
    private Integer buyrMemberNo;
    private Integer cntrctMth;
    private String soppTitle;
    private String soppDesc;
    private BigDecimal soppTargetAmt;
    private BigDecimal cost;
    private BigDecimal income;
    private String soppTargetDate;
    private Integer soppType;
    private Integer soppStatus;
    private Integer soppSrate;
    private Integer soppSource;
    private String sopp2Desc;
    private String sopp2regDatetime;
    private String businessType;
    private String op_priority;
    private String regDatetime;
    private String modDatetime;
    private String attrib;

    private String desc03;
    private String contTitle;
    private String bacNo;
    private String baclogTime;
    private BigDecimal balanceAmt;
    private String select_regDate;
    //bac inout


}
