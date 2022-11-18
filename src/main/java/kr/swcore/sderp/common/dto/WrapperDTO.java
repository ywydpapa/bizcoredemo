package kr.swcore.sderp.common.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
// TODO dataTables return시 필요한 DTO : http://legacy.datatables.net/usage/server-side
public class WrapperDTO {
    private List<?> aaData;
    private int iTotalRecords;          // 실제로 해당 데이터의 전체 갯수
    private int iTotalDisplayRecords;   // 필터링을 거쳐 조회된 전체 데이터수
    private String sEcho;
}
