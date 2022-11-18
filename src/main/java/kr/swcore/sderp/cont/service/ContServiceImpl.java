package kr.swcore.sderp.cont.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.code.dao.CodeDAO;
import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.common.dto.PageDTO;
import org.springframework.stereotype.Service;

import kr.swcore.sderp.cont.dao.ContDAO;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.cont.dto.ContFileDataDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class ContServiceImpl implements ContService {

	@Inject
	ContDAO contDao;

	@Inject
	CodeDAO codeDAO;
	
	@Override
	public List<ContDTO> listCont() {
		// TODO Auto-generated method stub
		return contDao.listCont();
	}

	@Override
	public List<ContDTO> listCont3m() {
		return contDao.listCont3m();
	}

	@Override
	public List<ContDTO> listContbycust(int custNo) {
		return contDao.listContbycust(custNo);
	}

	@Override
	public List<ContDTO> listCont(HttpSession session, PageDTO pageDTO, ContDTO dto) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		soppdto.setListDateFrom(listDateFrom);

		if(pageDTO != null) {
			Integer limit = pageDTO.getLimit();
			soppdto.setLimit(limit);
			Integer offset = pageDTO.getOffset();
			soppdto.setOffset(offset);
		}

		return contDao.listCont(soppdto);
	}
	
	@Override
	public List<ContDTO> listconCont(HttpSession session, ContDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setListDateFrom(listDateFrom);
		dto.setCompNo(compNo);
		return contDao.listconCont(dto);
	}

	@Override
	public ContDTO detailCont(int contNo) {
		// TODO Auto-generated method stub
		return contDao.detailCont(contNo);
	}

	@Override
	public int updateCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateCont(dto);
		
	}

	@Override
	public int deleteCont(int contNo) {
		// TODO Auto-generated method stub
		return contDao.deleteCont(contNo);
	}

	@Override
	public int insertCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertCont(dto);
	}

	@Override
	public int insertCont(HttpSession session, ContDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		dto.setCompNo(compNo);
		
		int schedInsert = 0;
		schedInsert = contDao.insertCont(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}

	@Override
	public Map<String, Object> listSalesTargetMonthIndividual(HttpSession session, ContDTO contDTO) {
		Map<String, Object> returnMap = new HashMap<>();
		// CODE 테이블에서 code02 가 SALETYPE 인것만 가져온다.
		SoppDTO soppDTO = new SoppDTO();
		soppDTO.setCompNo(SessionInfoGet.getCompNo(session));
		List<CodeDTO> codeDAOList = codeDAO.listContType(soppDTO);

		if(contDTO == null) contDTO = new ContDTO();

		// 시간구하기
		Calendar cal = Calendar.getInstance();
		String targetYear = contDTO.getTargetYear();
		if(targetYear == null || targetYear.equals("")) {
			targetYear = String.valueOf(cal.get(Calendar.YEAR));
			contDTO.setTargetYear(targetYear);
		}

		String targetMonth = contDTO.getTargetMonth();
		Integer month = 0;
		if(targetMonth == null || targetMonth.equals("")) {
			month = cal.get(Calendar.MONTH)+1;
		} else {
			month = Integer.valueOf(targetMonth);
		}

		if(month < 10) {
			targetMonth = "0"+String.valueOf(month);
		} else {
			targetMonth = ""+String.valueOf(month);
		}
		contDTO.setTargetMonth(targetMonth);

		if(codeDAOList.size() <= 0){
			// CODE 테이블에 SALETYPE 지정되어있지 않다.
			returnMap.put("code", 20001);
			returnMap.put("data", null);
			return returnMap;
		}

		returnMap.put("targetYear", targetYear);
		returnMap.put("targetMonth", targetMonth);

		// 회사구분값 셋팅
		contDTO.setCompNo(SessionInfoGet.getCompNo(session));
		// 유저 셋팅
		contDTO.setUserNo(SessionInfoGet.getUserNo(session));
		List<ContDTO> contDTOList = new ArrayList<>();
		try {
			for(int i=0; i<codeDAOList.size(); i++){
				// 반환시 필요한 코드명 셋팅
				ContDTO insertDto = (ContDTO) contDTO.clone();
				insertDto.setContTypeN(codeDAOList.get(i).getDesc03());
				// 검색할 코드값 셋팅
				insertDto.setContType(String.valueOf( codeDAOList.get(i).getCodeNo() ));
				// 쿼리 조건 : 회사구분코드, contType int 값, 날짜 ex) 2021-04
				ContDTO temp = contDao.listSalesTargetMonthIndividual(insertDto);
				insertDto.setContTypeCount(temp.getContTypeCount());

				contDTOList.add(insertDto);
			}
		} catch (Exception e){
			e.printStackTrace();
			returnMap.put("code", 20001);
			returnMap.put("data", null);
		}

		returnMap.put("code", 10001);
		returnMap.put("data", contDTOList);

		return returnMap;
	}

	@Override
	public List<ContDTO> listFile(int contNo) {
		// TODO Auto-generated method stub
		return contDao.listFile(contNo);
	}

	@Override
	public int uploadFile(HttpSession session, int contNo, MultipartHttpServletRequest fileList) throws IOException {
		MultipartFile file = fileList.getFile("file");
		ContFileDataDTO contFile = new ContFileDataDTO();
		contFile.setFileId(UUID.randomUUID().toString());
		contFile.setFileName(file.getOriginalFilename());
		contFile.setFileContent(file.getBytes());
		Path mimeType_base = Paths.get("D:/"+ file.getOriginalFilename());
		String mimeType = Files.probeContentType(mimeType_base);
		contFile.setFileExtention(mimeType);
		contFile.setFileSize(fileList.getParameter("fileSize"));
		contFile.setFileDesc(fileList.getParameter("fileDesc"));
		contFile.setContNo(contNo);
		contFile.setUserNo(Integer.valueOf((String)session.getAttribute("userNo")));
		
		return contDao.uploadFile(contFile);
	}

	@Override
	public Integer deleteFile(HttpSession session, ContFileDataDTO dto) {
		// TODO Auto-generated method stub
		return contDao.deleteFile(dto);
	}

	@Override
	public ContFileDataDTO downloadFile(ContFileDataDTO dto) {
		// TODO Auto-generated method stub
		return contDao.downloadFile(dto);
	}

	@Override
	public ContDTO listSumCont(HttpSession session) {
		int compNo = SessionInfoGet.getCompNo(session);
		return contDao.listSumCont(compNo);
	}

	@Override
	public int soppListUpdate(HttpSession session, ContDTO dto) {
		return contDao.soppListUpdate(dto);
	}

	@Override
	public int extInsert(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.extInsert(dto);
	}
	
	@Override
	public int extAttUpdate(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.extAttUpdate(dto);
	}

	@Override
	public List<ContDTO> defaultgradata01() {
		// TODO Auto-generated method stub
		return contDao.defaultgradata01();
	}

	@Override
	public int insert_maintenance(HttpSession session, ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insert_maintenance(dto);
	}

	@Override
	public int update_maintenance(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.update_maintenance(dto);
	}

	@Override
	public int contAmtUpdate(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.contAmtUpdate(dto);
	}

	@Override
	public void updateSopp_buyrno(ContDTO dto) {
		// TODO Auto-generated method stub
		contDao.updateSopp_buyrno(dto);
	}
}
