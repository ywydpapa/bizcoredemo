package kr.swcore.sderp.mis.service;

import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.mis.dao.MisDAO;
import kr.swcore.sderp.mis.dto.MisDTO;
import kr.swcore.sderp.sopp.dto.SoppdataDTO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class MisServiceImpl implements MisService{
    @Inject
    MisDAO misDAO;
    @Override
    public List<MisDTO> listHRduty(HttpSession session, MisDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listHRduty(dto);
    }

    @Override
    public List<MisDTO> listHRcost(HttpSession session, MisDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listHRcost(dto);
    }

    @Override
    public List<MisDTO> listSopp(HttpSession session, MisDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listSopp(dto);
    }

    @Override
    public List<MisDTO> listSoppcost(HttpSession session, MisDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listSoppcost(dto);
    }

    @Override
    public List<MisDTO> listSoppmargin(HttpSession session, ContDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listSoppmargin(dto);
    }

    @Override
    public List<MisDTO> listBacinout(HttpSession session, MisDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listBacinout(dto);
    }

    @Override
    public List<MisDTO> listBacstatus(HttpSession session, MisDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listBacstatus(dto);
    }

	@Override
	public List<AccountDTO> sumSvat(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return misDAO.sumSvat(dto);
	}

	@Override
	public List<AccountDTO> sumSvat_sub(HttpSession session, AccountDTO dto) {
		// TODO Auto-generated method stub
		return misDAO.sumSvat_sub(dto);
	}

	@Override
	public List<AccountDTO> sumSvatSearch(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return misDAO.sumSvatSearch(dto);
	}

	@Override
	public List<AccountDTO> sumBvat(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return misDAO.sumBvat(dto);
	}

	@Override
	public List<AccountDTO> sumBvat_sub(HttpSession session, AccountDTO dto) {
		return misDAO.sumBvat_sub(dto);
	}

	@Override
	public List<AccountDTO> sumBvatSearch(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return misDAO.sumBvatSearch(dto);
	}

	@Override
	public List<SoppdataDTO> listIOsum(HttpSession session, SoppdataDTO dto) {
		// TODO Auto-generated method stub
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setListDateFrom(listDateFrom);
		dto.setCompNo(compNo);
		return misDAO.listIOsum(dto);
	}

	@Override
	public List<SoppdataDTO> listSearchIO(HttpSession session, SoppdataDTO dto) {
		// TODO Auto-generated method stub
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setListDateFrom(listDateFrom);
		dto.setCompNo(compNo);
		return misDAO.listSearchIO(dto);
	}

	@Override
	public List<AccountDTO> listbac(HttpSession session) {
		int compNo = SessionInfoGet.getCompNo(session);
        return misDAO.listbac(compNo);
	}

	@Override
	public List<AccountDTO> bacSelectList(AccountDTO dto) {
		return misDAO.bacSelectList(dto);
	}

	@Override
	public List<AccountDTO> bacInOutList(AccountDTO dto) {
		return misDAO.bacInOutList(dto);
	}

	@Override
	public List<MisDTO> listBacstatus_select(HttpSession session, MisDTO dto) {
		 int compNo = SessionInfoGet.getCompNo(session);
	     dto.setCompNo(compNo);
	     return misDAO.listBacstatus_select(dto);
	}
}
