package kr.swcore.sderp.code.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.code.dto.CodeDTO;

public interface CodeService {
	
	List<CodeDTO> listCode();
	List<CodeDTO> listCode(HttpSession session);
	List<CodeDTO> listCode01();
	List<CodeDTO> listCode01(HttpSession session);
	List<CodeDTO> listCode02();
	List<CodeDTO> listCode02(HttpSession session);
	List<CodeDTO> listCode02n(String code01);
	List<CodeDTO> listCode03();
	List<CodeDTO> listCode03(HttpSession session);
	List<CodeDTO> listCode03n(String code02);
	List<CodeDTO> listCode003(String code02);
	CodeDTO detailCode(int codeNo);
	int updateCode(CodeDTO dto);
	int updateCode01(CodeDTO dto);
	int updateCode02(CodeDTO dto);
	int updateCode03(CodeDTO dto);
	int deleteCode(int codeNo);
	int insertCode(CodeDTO dto);
	List<CodeDTO> listComp();
	List<CodeDTO> listDept();
	List<CodeDTO> listRank();
	List<CodeDTO> listSaletype();
	List<CodeDTO> listComptype(HttpSession session);
	List<CodeDTO> listActtype();
	List<CodeDTO> listActtype(HttpSession session);
	List<CodeDTO> listSalestype();
	List<CodeDTO> listSalestype(HttpSession session);
	List<CodeDTO> listSstatus();
	List<CodeDTO> listSstatus(HttpSession session);
	List<CodeDTO> listSchedtype();
	List<CodeDTO> listSchedtype(HttpSession session);
	List<CodeDTO> listSprttype();
	List<CodeDTO> listSprttype(HttpSession session);
	List<CodeDTO> listSprtstat();
	List<CodeDTO> listSprtstat(HttpSession session);
	List<CodeDTO> listBoardtype();
	List<CodeDTO> listBoardtype(HttpSession session);
	List<CodeDTO> listBusinessType(HttpSession session);
	List<CodeDTO> listContractType(HttpSession session);
	List<CodeDTO> listTechdSteps(HttpSession session);
	List<CodeDTO> listSchedDetailType(HttpSession session);
	List<CodeDTO> listActSprtScheduleDetailType(HttpSession session);
	List<CodeDTO> listContType(HttpSession session);
	List<CodeDTO> listSchdType(HttpSession session);
	List<CodeDTO> listAreaType(HttpSession session);
	List<CodeDTO> listLoc(CodeDTO dto);
	int autoInsert(CodeDTO dto);
	int autoInsert3(CodeDTO dto);
}
