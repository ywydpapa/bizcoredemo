package kr.swcore.sderp.allim.service;

import java.util.List;

import kr.swcore.sderp.allim.dto.AllimDTO;

public interface AllimService {
	int insertAllim(AllimDTO dto);
	List<AllimDTO> timeAllimSelect(AllimDTO dto);
	int allimReadUpdate(AllimDTO dto);
}
