package kr.swcore.sderp.sopp.service;

import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.common.dto.WrapperDTO;
import kr.swcore.sderp.sopp.dao.SoppDAO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.sopp.dto.SoppFileDataDTO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class SoppServiceImpl implements SoppService {

	@Inject
	SoppDAO soppDao;
	
	@Override
	public List<SoppDTO> listSopp() {
		// TODO Auto-generated method stub
		return soppDao.listSopp();
	}
	
	@Override
	public List<SoppDTO> listSopp(HttpSession session, PageDTO pageDTO) {
		Integer compNo = SessionInfoGet.getCompNo(session);
		SoppDTO dto = new SoppDTO();
		dto.setCompNo(compNo);

		if(pageDTO != null) {
			Integer limit = pageDTO.getLimit();
			dto.setLimit(limit);
			Integer offset = pageDTO.getOffset();
			dto.setOffset(offset);
		}

		dto.setOrderColumn("regDatetime");
		dto.setOrderOption("desc");

		return soppDao.listSopp(dto);
	}

	@Override
	public Object listSopp(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response) {
		SoppDTO dto = new SoppDTO();
		Integer compNo = SessionInfoGet.getCompNo(session);											// 로그인 회사 구분 코드
		String userNostr = request.getParameter("userNo");
		Integer userNo = userNostr.equals("") == true ? 0 : Integer.valueOf(userNostr);				// 담당자
		String custNostr =  request.getParameter("custNo");
		Integer custNo = custNostr.equals("") == true ? 0 : Integer.valueOf(custNostr);				// 거래처
		String buyrNostr = request.getParameter("buyrNo");
		Integer buyrNo = buyrNostr.equals("") == true ? 0 : Integer.valueOf(buyrNostr);				// 엔드유저
		String soppTypestr = request.getParameter("soppType");
		Integer soppType = soppTypestr.equals("") == true ? 0 : Integer.valueOf(soppTypestr);		// 판매방식
		String cntrctMthstr = request.getParameter("cntrctMth");
		Integer cntrctMth = cntrctMthstr.equals("") == true ? 0 : Integer.valueOf(cntrctMthstr);	// 계약구분
		String soppStatus = request.getParameter("soppStatus") != null ? (String) request.getParameter("soppStatus") : "";				// 진행단계	// TODO : varchar 에서 int 변경시 수정해야할 변경
		String targetDatefrom = request.getParameter("targetDatefrom") != null ? (String) request.getParameter("targetDatefrom") : "";	// 매출예정 시작일
		String targetDateto = request.getParameter("targetDateto") != null ? (String) request.getParameter("targetDateto") : "";		// 매출예정 마감일
		String targetDatefrom2 = request.getParameter("targetDatefrom2") != null ? (String) request.getParameter("targetDatefrom2") : "";	// 등록/수정 시작일
		String targetDateto2 = request.getParameter("targetDateto2") != null ? (String) request.getParameter("targetDateto2") : "";		// 등록/수정 마감일

		dto.setCompNo(compNo);
		dto.setUserNo(userNo);
		dto.setCustNo(custNo);
		dto.setBuyrNo(buyrNo);
		dto.setSoppType(soppType);
		dto.setCntrctMth(cntrctMth);
		dto.setSoppStatus(soppStatus);
		dto.setTargetDatefrom(targetDatefrom);
		dto.setTargetDateto(targetDateto);
		dto.setTargetDatefrom2(targetDatefrom2);
		dto.setTargetDateto2(targetDateto2);

		String sEcho = request.getParameter("sEcho");
		String limitstr = request.getParameter("iDisplayLength");
		Integer limit = limitstr != null ? Integer.valueOf(limitstr) : 20;	// 기본값 20 세팅
		String offsetstr = request.getParameter("iDisplayStart");
		Integer offset = offsetstr != null ? Integer.valueOf(offsetstr) : 0;
		String sSearch = (String) request.getParameter("sSearch");

		String orderColumn = request.getParameter("iSortCol_0");
		String orderOption = request.getParameter("sSortDir_0");

		String column = "";
		switch (orderColumn){
			case "0" : column = "modDatetime"; break;	// 수정일
			case "1" : column = "soppTypeN"; break;		// 판매방식
			case "2" : column = "cntrctMthN"; break;	// 계약구분
			case "3" : column = "soppTitle"; break;		// 영업기회명
			case "4" : column = "custName"; break;		// 거래처
			case "5" : column = "buyrName"; break;		// 거래처
			case "6" : column = "userName"; break;		// 담당자
			case "7" : column = "soppTargetAmt"; break;	// 예상매출액
			case "8" : column = "soppStatusN"; break;	// 진행단계
			case "9" : column = "soppTargetDate"; break;// 매출예정일
			default : column = "modDatetime"; break;	// 수정일
		}

		String option = "";
		switch (orderOption){
			case "desc" : option = "desc"; break;
			case "asc" : option = "asc"; break;
			default : option = "desc"; break;
		}

		dto.setLimit(limit);
		dto.setOffset(offset);
		dto.setSSearch(sSearch);

		dto.setOrderColumn(column);
		dto.setOrderOption(option);

		WrapperDTO wrapperDTO = new WrapperDTO();
		wrapperDTO.setAaData(soppDao.listSopp(dto));

		Integer cnt = soppDao.listSoppCnt(dto);
		wrapperDTO.setITotalRecords(cnt);
		wrapperDTO.setITotalDisplayRecords(cnt);

		return wrapperDTO;
	}

	@Override
	public Object listSopp2(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response) {
		SoppDTO dto = new SoppDTO();
		Integer compNo = SessionInfoGet.getCompNo(session);											// 로그인 회사 구분 코드
		String userNostr = request.getParameter("userNo");
		Integer userNo = userNostr.equals("") == true ? 0 : Integer.valueOf(userNostr);				// 담당자
		String custNostr =  request.getParameter("custNo");
		Integer custNo = custNostr.equals("") == true ? 0 : Integer.valueOf(custNostr);				// 거래처
		String buyrNostr = request.getParameter("buyrNo");
		Integer buyrNo = buyrNostr.equals("") == true ? 0 : Integer.valueOf(buyrNostr);				// 엔드유저
		String soppTypestr = request.getParameter("soppType");
		Integer soppType = soppTypestr.equals("") == true ? 0 : Integer.valueOf(soppTypestr);		// 판매방식
		String cntrctMthstr = request.getParameter("cntrctMth");
		Integer cntrctMth = cntrctMthstr.equals("") == true ? 0 : Integer.valueOf(cntrctMthstr);	// 계약구분
		String soppStatus = request.getParameter("soppStatus") != null ? (String) request.getParameter("soppStatus") : "";				// 진행단계	// TODO : varchar 에서 int 변경시 수정해야할 변경
		String targetDatefrom = request.getParameter("targetDatefrom") != null ? (String) request.getParameter("targetDatefrom") : "";	// 매출예정 시작일
		String targetDateto = request.getParameter("targetDateto") != null ? (String) request.getParameter("targetDateto") : "";		// 매출예정 마감일
		String targetDatefrom2 = request.getParameter("targetDatefrom2") != null ? (String) request.getParameter("targetDatefrom2") : "";	// 등록/수정 시작일
		String targetDateto2 = request.getParameter("targetDateto2") != null ? (String) request.getParameter("targetDateto2") : "";		// 등록/수정 마감일

		dto.setCompNo(compNo);
		dto.setUserNo(userNo);
		dto.setCustNo(custNo);
		dto.setBuyrNo(buyrNo);
		dto.setSoppType(soppType);
		dto.setCntrctMth(cntrctMth);
		dto.setSoppStatus(soppStatus);
		dto.setTargetDatefrom(targetDatefrom);
		dto.setTargetDateto(targetDateto);
		dto.setTargetDatefrom2(targetDatefrom2);
		dto.setTargetDateto2(targetDateto2);

		String sEcho = request.getParameter("sEcho");
		String limitstr = request.getParameter("iDisplayLength");
		Integer limit = limitstr != null ? Integer.valueOf(limitstr) : 20;	// 기본값 20 세팅
		String offsetstr = request.getParameter("iDisplayStart");
		Integer offset = offsetstr != null ? Integer.valueOf(offsetstr) : 0;
		String sSearch = (String) request.getParameter("sSearch");

		String orderColumn = request.getParameter("iSortCol_0");
		String orderOption = request.getParameter("sSortDir_0");

		String column = "";
		switch (orderColumn){
			case "1" : column = "modDatetime"; break;	// 수정일
			case "2" : column = "soppTypeN"; break;		// 판매방식
			case "3" : column = "cntrctMthN"; break;	// 계약구분
			case "4" : column = "soppTitle"; break;		// 영업기회명
			case "5" : column = "custName"; break;		// 거래처
			case "6" : column = "buyrName"; break;		// 거래처
			case "7" : column = "userName"; break;		// 담당자
			case "8" : column = "soppTargetAmt"; break;	// 예상매출액
			case "9" : column = "soppStatusN"; break;	// 진행단계
			case "10" : column = "soppTargetDate"; break;// 매출예정일
			default : column = "modDatetime"; break;	// 수정일
		}

		String option = "";
		switch (orderOption){
			case "desc" : option = "desc"; break;
			case "asc" : option = "asc"; break;
			default : option = "desc"; break;
		}

		dto.setLimit(limit);
		dto.setOffset(offset);
		dto.setSSearch(sSearch);

		dto.setOrderColumn(column);
		dto.setOrderOption(option);

		WrapperDTO wrapperDTO = new WrapperDTO();
		wrapperDTO.setAaData(soppDao.listSopp2(dto));

		Integer cnt = soppDao.listSoppCnt2(dto);
		wrapperDTO.setITotalRecords(cnt);
		wrapperDTO.setITotalDisplayRecords(cnt);

		return wrapperDTO;
	}

	@Override
	public List<SoppDTO> listconSopp(HttpSession session, SoppDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return soppDao.listconSopp(dto);
	}
	
	@Override
	public List<SoppDTO> listSopp2() {
		// TODO Auto-generated method stub
		return soppDao.listSopp2();
	}
	
	@Override
	public List<SoppDTO> listSopp2(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return soppDao.listSopp2(soppdto);
	}
	
	@Override
	public List<SoppDTO> listconSopp2(HttpSession session, SoppDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return soppDao.listconSopp2(dto);
	}
	
	@Override
	public List<SoppDTO> listFile(int soppNo) {
		return soppDao.listFile(soppNo);
	}
	
	@Override
	public SoppDTO detailSopp(int soppNo) {
		// TODO Auto-generated method stub
		return soppDao.detailSopp(soppNo);
	}

	@Override
	public int updateSopp(HttpSession session, SoppDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		dto.setCompNo(compNo);
		return soppDao.updateSopp(dto);
	}

	@Override
	public int deleteSopp(int soppNo) {
		// TODO Auto-generated method stub
		return soppDao.deleteSopp(soppNo);
	}

	@Override
	public int insertSopp(SoppDTO dto) {
		// TODO Auto-generated method stub
		return soppDao.insertSopp(dto);
	}
	
	@Override
	public int insertSopp(HttpSession session, SoppDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		dto.setCompNo(compNo);
		
		int schedInsert = 0;
		schedInsert = soppDao.insertSopp(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}

	@Override
	public int update2Sopp(HttpSession session, SoppDTO dto) {
		Integer compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return soppDao.update2Sopp(dto);
	}

	@Override
	public Map<String, Object> updateAprvOrReject(HttpSession session, SoppDTO dto) {
		Integer compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		String soppStatus = dto.getSoppStatus();
		Map<String, Object> param = new HashMap<>();

		List<SoppDTO> newDTOList = dto.getSoppDTOList();
		if(newDTOList == null){
			param.put("code", 10001);
			param.put("msg", "승인/거절할 데이터가 존재하지 않습니다.");
			return param;
		}

		for(int i=0; i<newDTOList.size(); i++){
			newDTOList.get(i).setCompNo(compNo);
			newDTOList.get(i).setSoppStatus(soppStatus);
		}

		List<SoppDTO> oldDTOList = soppDao.listWithSoppNoArray(newDTOList);
		Boolean result = false;
		try {
			for(int i=0; i<newDTOList.size(); i++){
				soppDao.update2Sopp(newDTOList.get(i));
			}
			result = true;
		} catch (Exception e){
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); // 쿼리 에러시 롤백
		}
		
		if(result){
			param.put("code", 10001);
		} else {
			param.put("code", 20001);
			param.put("msg", "실패");
		}
		return param;
	}

	@Override
	public int uploadFile(HttpSession session, int soppNo, MultipartHttpServletRequest fileList) throws IOException {
		MultipartFile file = fileList.getFile("file");
		SoppFileDataDTO soppFile = new SoppFileDataDTO();
		soppFile.setFileId(UUID.randomUUID().toString());
		soppFile.setFileName(file.getOriginalFilename());
		soppFile.setFileContent(file.getBytes());
		soppFile.setFileDesc(fileList.getParameter("fileDesc"));
		soppFile.setSoppNo(soppNo);
		soppFile.setUserNo(Integer.valueOf((String)session.getAttribute("userNo")));
		
		return soppDao.uploadFile(soppFile);
	}

	@Override
	public Integer deleteFile(HttpSession session, SoppFileDataDTO dto) {
		return soppDao.deleteFile(dto);
	}

	@Override
	public SoppFileDataDTO downloadFile(SoppFileDataDTO dto) {
		return soppDao.downloadFile(dto);
	}
	

}
