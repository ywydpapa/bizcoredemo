package kr.swcore.sderp.cont.service;

import java.io.IOException;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.cont.dto.ContFileDataDTO;

public interface ContService {
	
	List<ContDTO> listCont();
	List<ContDTO> listCont3m(HttpSession session, ContDTO dto);
	List<ContDTO> listContbycust(int custNo);
	List<ContDTO> listCont(HttpSession session, PageDTO pageDTO, ContDTO dto);
	List<ContDTO> listconCont(HttpSession session, ContDTO dto);
	ContDTO detailCont(int contNo);
	int updateCont(ContDTO dto);
	int deleteCont(int contNo);
	int insertCont(ContDTO dto);
	int insertCont(HttpSession session, ContDTO dto);

	Map<String, Object> listSalesTargetMonthIndividual(HttpSession session, ContDTO contDTO);
	
	List<ContDTO> listFile(int contNo);
	int uploadFile(HttpSession session, int contNo, MultipartHttpServletRequest fileList) throws IOException;
	Integer deleteFile(HttpSession session, ContFileDataDTO dto);
	ContFileDataDTO downloadFile(ContFileDataDTO dto);
	ContDTO listSumCont(HttpSession session);
	int soppListUpdate(HttpSession session, ContDTO dto);
	int extInsert(ContDTO dto);
	int extAttUpdate(ContDTO dto);
	List<ContDTO> defaultgradata01();
	int insert_maintenance(HttpSession session, ContDTO dto);
	int update_maintenance(ContDTO dto);
	int contAmtUpdate(ContDTO dto);
	void updateSopp_buyrno(ContDTO dto);
}
