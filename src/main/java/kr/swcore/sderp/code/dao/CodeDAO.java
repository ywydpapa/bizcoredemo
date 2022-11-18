package kr.swcore.sderp.code.dao;

import java.util.List;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

public interface CodeDAO {
	List<CodeDTO> listCode();
	List<CodeDTO> listCode(SoppDTO soppdto);
	List<CodeDTO> listCode01();
	List<CodeDTO> listCode01(SoppDTO soppdto);
	List<CodeDTO> listCode02();
	List<CodeDTO> listCode02(SoppDTO soppdto);
	List<CodeDTO> listCode02n(String code01);
	List<CodeDTO> listCode03();
	List<CodeDTO> listCode03(SoppDTO soppdto);
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
	List<CodeDTO> listComptype(Integer compNo);
	List<CodeDTO> listActtype();
	List<CodeDTO> listActtype(SoppDTO soppdto);
	List<CodeDTO> listSalestype();
	List<CodeDTO> listSalestype(SoppDTO soppdto);
	List<CodeDTO> listSstatus();
	List<CodeDTO> listSstatus(SoppDTO soppdto);
	List<CodeDTO> listSchedtype();
	List<CodeDTO> listSchedtype(SoppDTO soppdto);
	List<CodeDTO> listSprttype();
	List<CodeDTO> listSprttype(SoppDTO soppdto);
	List<CodeDTO> listSprtstat();
	List<CodeDTO> listSprtstat(SoppDTO soppdto);
	List<CodeDTO> listBoardType();
	List<CodeDTO> listBoardType(SoppDTO soppdto);
	List<CodeDTO> listBusinessType(SoppDTO soppdto);
	List<CodeDTO> listContractType(SoppDTO soppdto);
	List<CodeDTO> listTechdSteps(SoppDTO soppdto);
	List<CodeDTO> listSchedDetailType(SoppDTO soppdto);
	List<CodeDTO> listActSprtScheduleDetailType(SoppDTO soppdto);
	List<CodeDTO> listContType(SoppDTO soppdto);
	List<CodeDTO> listSchdType(int compNo);
	List<CodeDTO> listAreaType(int compNo);
}
