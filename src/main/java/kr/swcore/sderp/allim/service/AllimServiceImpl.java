package kr.swcore.sderp.allim.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.allim.dao.AllimDAO;
import kr.swcore.sderp.allim.dto.AllimDTO;

@Service
public class AllimServiceImpl implements AllimService{
	@Inject
	AllimDAO allimDao;
	
	@Override
	public int insertAllim(AllimDTO dto) {
		return allimDao.insertAllim(dto);
	}

	@Override
	public List<AllimDTO> timeAllimSelect(AllimDTO dto) {
		return allimDao.timeAllimSelect(dto);
	}

	@Override
	public int allimReadUpdate(AllimDTO dto) {
		return allimDao.allimReadUpdate(dto);
	}

}
