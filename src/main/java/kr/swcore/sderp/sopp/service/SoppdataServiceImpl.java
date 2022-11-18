package kr.swcore.sderp.sopp.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.stereotype.Service;

import kr.swcore.sderp.sopp.dao.SoppdataDAO;
import kr.swcore.sderp.sopp.dto.SoppdataDTO;
@Service
public class SoppdataServiceImpl implements SoppdataService {

	@Inject
	SoppdataDAO soppdataDao;
	
	@Override
	public List<SoppdataDTO> listSoppdata01(int soppNo) {
		// TODO Auto-generated method stub
		return soppdataDao.listSoppdata01(soppNo);
	}

	@Override
	public int deleteSoppdata01(int soppdataNo) {
		// TODO Auto-generated method stub
		return soppdataDao.deleteSoppdata01(soppdataNo);
	}

	@Override
	public int insertSoppdata01(HttpSession session, SoppdataDTO dto) {
		// TODO Auto-generated method stub
		dto.setUserNo(SessionInfoGet.getUserNo(session));
		return soppdataDao.insertSoppdata01(dto);
	}

	@Override
	public int updateSoppdata01(HttpSession session, SoppdataDTO dto, HttpServletRequest servletRequest) {
		dto.setUserNo(SessionInfoGet.getUserNo(session));
		soppdataDao.deleteSoppdata01(dto.getSoppdataNo());
		return soppdataDao.insertSoppdata01(dto);
	}


	@Override
	public List<SoppdataDTO> listSoppdata02(int soppNo) {
		// TODO Auto-generated method stub
		return soppdataDao.listSoppdata02(soppNo);
	}

}
