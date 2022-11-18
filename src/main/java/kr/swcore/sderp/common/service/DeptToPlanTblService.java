package kr.swcore.sderp.common.service;

import kr.swcore.sderp.common.dto.DeptToPlanTblDTO;

import java.util.List;

public interface DeptToPlanTblService {
    List<DeptToPlanTblDTO> listWithOrgId(int orgId);
}
