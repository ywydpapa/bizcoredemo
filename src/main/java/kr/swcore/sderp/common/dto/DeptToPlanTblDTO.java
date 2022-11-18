package kr.swcore.sderp.common.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class DeptToPlanTblDTO {
    private int id;
    private int orgId;
    private String tableName;

    // 확장
    private int compNo;
}
