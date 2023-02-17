package kr.swcore.sderp.cust.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.cust.dao.CustDAO;
import kr.swcore.sderp.cust.dto.CustDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;
@Service
public class CustServiceImpl implements CustService {

	@Inject
	CustDAO custDao;
	
	@Override
	public List<CustDTO> listCust() {
		// TODO Auto-generated method stub
		return custDao.listCust();
	}
	
	@Override
	public List<CustDTO> listCust(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return custDao.listCust(soppdto);
	}

	@Override
	public CustDTO detailCust(int custNo) {
		// TODO Auto-generated method stub
		return custDao.detailCust(custNo);
	}

	@Override
	public int updateCust01(CustDTO dto) {
		// TODO Auto-generated method stub
		return custDao.updateCust01(dto);
	}

	@Override
	public int deleteCust(int custNo) {
		// TODO Auto-generated method stub
		return custDao.deleteCust(custNo);
	}

	@Override
	public int insertCust(CustDTO dto) {
		// TODO Auto-generated method stub
		return custDao.insertCust(dto);
	}

	@Override
	public String fileInfo(int custNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CustDTO detailsCust(int custNo) {
		// TODO Auto-generated method stub
		return (CustDTO) custDao.detailsCust(custNo);
	}

	@Override
	public List<CustDTO> listBuyr() {
		// TODO Auto-generated method stub
		return custDao.listBuyr();
	}
	
	@Override
	public List<CustDTO> listBuyr(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);

		return custDao.listBuyr(soppdto);
	}

	@Override
	public List<CustDTO> listPtnc() {
		// TODO Auto-generated method stub
		return custDao.listPtnc();
	}
	
	@Override
	public List<CustDTO> listPtnc(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		
		return custDao.listPtnc(soppdto);
	}

	@Override
	public List<CustDTO> listSupply() {
		// TODO Auto-generated method stub
		return custDao.listSupply();
	}
	
	@Override
	public List<CustDTO> listSupply(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		
		return custDao.listSupply(soppdto);
	}

	@Override
	public int custCheck(CustDTO dto) {
		// TODO Auto-generated method stub
		int result =  custDao.custCheck(dto);
		return result;
	}

	@Override
	public int insertCust02(CustDTO dto) {
		// TODO Auto-generated method stub
		return custDao.insertCust02(dto);
	}

	@Override
	public int insertCust03(CustDTO dto) {
		// TODO Auto-generated method stub
		return custDao.insertCust03(dto);
	}

	@Override
	public int insertCust04(CustDTO dto) {
		// TODO Auto-generated method stub
		return custDao.insertCust04(dto);
	}

	@Override
	public Map<String, Object> insertSimpleRegister(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> rtn =  new HashMap<>();
		int compNo = SessionInfoGet.getCompNo(session);
		String custName = request.getParameter("custName");
		String custMemberName = request.getParameter("custMemberName");
		CustDTO dto = new CustDTO();
		dto.setCompNo(compNo);
		dto.setCustName(custName);

		if(custMemberName.equals("")) {
			dto.setCustMname("�떞�떦�옄");		// �떞�떦�옄 �씠由�
			dto.setCustMrank("�떞�떦");		// 吏곴툒
		} else {
			dto.setCustMname(custMemberName);
			dto.setCustMrank("�떞�떦");
		}

		try {
			custDao.insertCust(dto);
			custDao.insertCust03(dto);
			rtn.put("code","10001");
			rtn.put("data",dto);
		} catch (Exception e){
			rtn.put("code","20001");
			e.printStackTrace();
		}
		return rtn;
	}

	@Override
	public CustDTO detailCust02(int custNo) {
		// TODO Auto-generated method stub
		return custDao.detailCust02(custNo);
	}

	@Override
	public CustDTO detailCust03(int custNo) {
		// TODO Auto-generated method stub
		return custDao.detailCust03(custNo);
	}

	@Override
	public CustDTO detailCust04(int custNo) {
		// TODO Auto-generated method stub
		return custDao.detailCust04(custNo);
	}

	@Override
	public int updateCust05(CustDTO dto) {
		// TODO Auto-generated method stub
		return custDao.updateCust05(dto);
	}

	@Override
	public List<CustDTO> listCustmember(int custNo) {
		// TODO Auto-generated method stub
		return custDao.listCustmember(custNo);
	}

	@Override
	public Map<String, Object> listcustNameCheck(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response) {
		int compNo = SessionInfoGet.getCompNo(session);
		String custName = request.getParameter("custName");
		CustDTO dto = new CustDTO();
		dto.setCompNo(compNo);
		dto.setCustName(custName);

		Map<String, Object> rtn =  new HashMap<>();
		try {
			List<CustDTO> custDTOList1 = custDao.listCustNameCheck(dto);
			List<CustDTO> custDTOList2 = custDao.listCustNameSimilarCheck(dto);
			rtn.put("code","10001");
			rtn.put("result1", custDTOList1);
			rtn.put("result2", custDTOList2);
		} catch (Exception e){
			rtn.put("code","20001");
			e.printStackTrace();
		}

		return rtn;
	}

	@Override
	public CustDTO sessionSelectCust(HttpSession session) {
		int custCompNo = SessionInfoGet.getCompNo(session);
		
		return custDao.sessionSelectCust(custCompNo);
	}

	@Override
	public int tempSelectCustInsert(CustDTO dto) {
		// TODO Auto-generated method stub
		return custDao.tempSelectCustInsert(dto);
	}

	@Override
	public List<CustDTO> getAllDataList(HttpSession session) {
		int compNo = SessionInfoGet.getCompNo(session);
		return custDao.getAllDataList(compNo);

	}
}
