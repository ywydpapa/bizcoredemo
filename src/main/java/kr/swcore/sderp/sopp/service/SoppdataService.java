package kr.swcore.sderp.sopp.service;

import java.util.List;


import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.sopp.dto.SoppdataDTO;

import javax.servlet.http.HttpSession;

public interface SoppdataService {

	List<SoppdataDTO> listSoppdata01(int soppNo);
	List<SoppdataDTO> listSoppdata02(int soppNo);
	List<SoppdataDTO> listIOsum(HttpSession session, SoppdataDTO dto);
	List<SoppdataDTO> listSearchIO(HttpSession session, SoppdataDTO dto);
	List<SoppdataDTO> listIO(HttpSession session, SoppdataDTO dto);
	int deleteSoppdata01(int soppdataNo);
	int insertSoppdata01(HttpSession session, SoppdataDTO dto);
	int updateSoppdata01(HttpSession session, SoppdataDTO dto);
	int insertdata01_defalut(HttpSession session, SoppdataDTO dto);
	
	List<SoppdataDTO> listSoppdata011(int soppNo);
	List<SoppdataDTO> listSoppdata011_1(int soppNo);
	List<SoppdataDTO> listSoppdata011_2(int soppNo);
	List<SoppdataDTO> listContdata(int contNo);
	
	List<SoppdataDTO> listSoppdata01_08(SoppDTO data);
	List<SoppdataDTO> listSoppdata01_showdetail(int soppNo);

}
