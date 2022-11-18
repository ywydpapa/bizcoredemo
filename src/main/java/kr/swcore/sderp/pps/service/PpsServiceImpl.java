package kr.swcore.sderp.pps.service;

import kr.swcore.sderp.pps.dao.PpsDAO;
import kr.swcore.sderp.pps.dto.PpsDTO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class PpsServiceImpl implements PpsService {
    @Inject
    PpsDAO ppsDao;

    @Override
    public List<PpsDTO> listPps(HttpSession session, PpsDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
        return ppsDao.listPps(dto);
    }

    @Override
    public PpsDTO detailPps(int ppsId) {
        return ppsDao.detailPps(ppsId);
    }

    @Override
    public int insertPps(PpsDTO dto) {
        return ppsDao.insertPps(dto);
    }

    @Override
    public int updatePps(PpsDTO dto) {
        return 0;
    }
    
	@Override
	public PpsDTO checkPps(PpsDTO dto) {
		// TODO Auto-generated method stub
		return ppsDao.checkPps(dto);
	}
	
	@Override
    public int assignUpdate(PpsDTO dto) {
        return ppsDao.assignUpdate(dto);
    }

	@Override
	public List<PpsDTO> ppsStatusList(HttpSession session, PpsDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
        String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
        return ppsDao.ppsStatusList(dto);
	}

    @Override
    public List<PpsDTO> mppsStatusList(HttpSession session, PpsDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
        return ppsDao.mppsStatusList(dto);
    }

	@Override
	public int mppsInsert(PpsDTO dto) {
		return ppsDao.mppsInsert(dto);
	}

	@Override
	public int mppsUpdate(PpsDTO dto) {
		return ppsDao.mppsUpdate(dto);
	}
}
