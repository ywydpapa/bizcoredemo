package kr.swcore.sderp.common.dao;

import kr.swcore.sderp.common.dto.DeptToPlanTblDTO;

import java.util.List;

public interface DeptToPlanTblDAO {
    List<DeptToPlanTblDTO> listWithOrgId(DeptToPlanTblDTO dto);
}
