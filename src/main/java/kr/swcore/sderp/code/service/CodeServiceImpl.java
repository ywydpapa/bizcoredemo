package kr.swcore.sderp.code.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.code.dao.CodeDAO;
import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;

@Service
public class CodeServiceImpl implements CodeService {

	@Inject
	CodeDAO codeDao;
	
	@Override
	public List<CodeDTO> listCode() {
		// TODO Auto-generated method stub
		return codeDao.listCode();
	}
	
	@Override
	public List<CodeDTO> listCode(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listCode(soppdto);
	}
	
	@Override
	public List<CodeDTO> listCode01() {
		// TODO Auto-generated method stub
		return codeDao.listCode01();
	}
	
	@Override
	public List<CodeDTO> listCode01(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listCode01(soppdto);
	}
	
	@Override
	public List<CodeDTO> listCode02() {
		// TODO Auto-generated method stub
		return codeDao.listCode02();
	}
	
	@Override
	public List<CodeDTO> listCode02(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listCode02(soppdto);
	}
	
	@Override
	public List<CodeDTO> listCode03() {
		// TODO Auto-generated method stub
		return codeDao.listCode03();
	}
	
	@Override
	public List<CodeDTO> listCode03(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listCode03(soppdto);
	}

	@Override
	public CodeDTO detailCode(int codeNo) {
		// TODO Auto-generated method stub
		return codeDao.detailCode(codeNo);
	}

	@Override
	public int updateCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.updateCode(dto);
		
	}

	@Override
	public int deleteCode(int codeNo) {
		// TODO Auto-generated method stub
		return codeDao.deleteCode(codeNo);
	}

	@Override
	public int insertCode(CodeDTO dto) {
		// TODO Auto-generated method stub

		return codeDao.insertCode(dto);
	}

	@Override
	public List<CodeDTO> listCode003(String code02) {
		// TODO Auto-generated method stub
		return codeDao.listCode003(code02);
	}

	@Override
	public List<CodeDTO> listComp() {
		// TODO Auto-generated method stub
		return codeDao.listComp();
		
	}

	@Override
	public List<CodeDTO> listDept() {
		// TODO Auto-generated method stub
		return codeDao.listDept();
	}

	@Override
	public List<CodeDTO> listRank() {
		// TODO Auto-generated method stub
		return codeDao.listRank();
	}

	@Override
	public List<CodeDTO> listSaletype() {
		// TODO Auto-generated method stub
		return codeDao.listSaletype();
	}

	@Override
	public List<CodeDTO> listComptype(HttpSession session) {
		// TODO Auto-generated method stub
		Integer compNo = SessionInfoGet.getCompNo(session);
		return codeDao.listComptype(compNo);
	}

	@Override
	public List<CodeDTO> listActtype() {
		// TODO Auto-generated method stub
		return codeDao.listActtype();
	}
	
	@Override
	public List<CodeDTO> listActtype(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listActtype(soppdto);
	}

	@Override
	public List<CodeDTO> listSalestype() {
		// TODO Auto-generated method stub
		return codeDao.listSalestype();
	}
	
	@Override
	public List<CodeDTO> listSalestype(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listSalestype(soppdto);
	}

	@Override
	public List<CodeDTO> listSstatus() {
		// TODO Auto-generated method stub
		return codeDao.listSstatus();
	}
	
	@Override
	public List<CodeDTO> listSstatus(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listSstatus(soppdto);
	}

	@Override
	public List<CodeDTO> listSchedtype() {
		// TODO Auto-generated method stub
		return codeDao.listSchedtype();
	}
	
	@Override
	public List<CodeDTO> listSchedtype(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listSchedtype(soppdto);
	}

	

	@Override
	public List<CodeDTO> listCode02n(String code01) {
		// TODO Auto-generated method stub
		return codeDao.listCode02n(code01);
	}

	@Override
	public List<CodeDTO> listCode03n(String code02) {
		// TODO Auto-generated method stub
		return codeDao.listCode03n(code02);
	}
	
	@Override
	public List<CodeDTO> listSprttype() {
		// TODO Auto-generated method stub
		return codeDao.listSprttype();
	}
	
	@Override
	public List<CodeDTO> listSprttype(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listSprttype(soppdto);
	}

	@Override
	public List<CodeDTO> listSprtstat() {
		// TODO Auto-generated method stub
		return codeDao.listSprtstat();
	}
	
	@Override
	public List<CodeDTO> listSprtstat(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listSprtstat(soppdto);
	}

	@Override
	public int updateCode01(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.updateCode01(dto);
	}

	@Override
	public int updateCode02(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.updateCode02(dto);
	}

	@Override
	public int updateCode03(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.updateCode03(dto);
	}

	@Override
	public List<CodeDTO> listBoardtype() {
		// TODO Auto-generated method stub
		return codeDao.listBoardType();
	}

	@Override
	public List<CodeDTO> listBoardtype(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listBoardType(soppdto);
	}
	
	@Override
	public List<CodeDTO> listBusinessType(HttpSession session) {
		// TODO Auto-generated method stub
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listBusinessType(soppdto);
	}
	
	@Override
	public List<CodeDTO> listContractType(HttpSession session) {
		// TODO Auto-generated method stub
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listContractType(soppdto);
	}
	
	@Override
	public List<CodeDTO> listTechdSteps(HttpSession session) {
		// TODO Auto-generated method stub
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listTechdSteps(soppdto);
	}
	
	@Override
	public List<CodeDTO> listSchedDetailType(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listSchedDetailType(soppdto);
	}
	
	@Override
	public List<CodeDTO> listActSprtScheduleDetailType(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listActSprtScheduleDetailType(soppdto);
	}

	@Override
	public List<CodeDTO> listContType(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return codeDao.listContType(soppdto);
	}

	@Override
	public List<CodeDTO> listSchdType(HttpSession session) {
		Integer compNo = SessionInfoGet.getCompNo(session);
		return codeDao.listSchdType(compNo);
	}

	@Override
	public List<CodeDTO> listAreaType(HttpSession session) {
		Integer compNo = SessionInfoGet.getCompNo(session);
		return codeDao.listAreaType(compNo);
	}

}
