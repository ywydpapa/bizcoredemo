package kr.swcore.sderp.allim.dao;

import java.util.List;

import kr.swcore.sderp.allim.dto.AllimDTO;

public interface AllimDAO {
	int insertAllim(AllimDTO dto);
	List<AllimDTO> timeAllimSelect(AllimDTO dto);
	int allimReadUpdate(AllimDTO dto);
}
