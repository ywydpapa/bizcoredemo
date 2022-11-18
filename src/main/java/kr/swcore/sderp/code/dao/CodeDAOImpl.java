package kr.swcore.sderp.code.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

@Repository
public class CodeDAOImpl implements CodeDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<CodeDTO> listCode() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode");
	}
	
	@Override
	public List<CodeDTO> listCode(SoppDTO soppdto) {
		return sqlSession.selectList("code.listCode", soppdto);
	}

	@Override
	public List<CodeDTO> listCode01() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode01");
	}
	
	@Override
	public List<CodeDTO> listCode01(SoppDTO soppdto) {
		return sqlSession.selectList("code.listCode01", soppdto);
	}

	@Override
	public List<CodeDTO> listCode02() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode02");
	}
	
	@Override
	public List<CodeDTO> listCode02(SoppDTO soppdto) {
		return sqlSession.selectList("code.listCode02", soppdto);
	}

	@Override
	public CodeDTO detailCode(int codeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("code.detailCode", codeNo);
	}

	@Override
	public int updateCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("code.updateCode",dto);
	}

	@Override
	public int deleteCode(int codeNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("code.deleteCode",codeNo);
	}

	@Override
	public int insertCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("code.insertCode",dto);
	}

	@Override
	public List<CodeDTO> listCode03() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode03");
	}
	
	@Override
	public List<CodeDTO> listCode03(SoppDTO soppdto) {
		return sqlSession.selectList("code.listCode03", soppdto);
	}

	@Override
	public List<CodeDTO> listCode003(String code02) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode003", code02);
	}

	@Override
	public List<CodeDTO> listComp() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listComp");
	}

	@Override
	public List<CodeDTO> listDept() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listDept");
	}

	@Override
	public List<CodeDTO> listRank() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listRank");
	}

	@Override
	public List<CodeDTO> listSaletype() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listSaletype");
	}

	@Override
	public List<CodeDTO> listComptype(Integer compNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listComptype",compNo);
	}

	@Override
	public List<CodeDTO> listActtype() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listActtype");
	}
	
	@Override
	public List<CodeDTO> listActtype(SoppDTO soppdto) {
		return sqlSession.selectList("code.listActtype", soppdto);
	}

	@Override
	public List<CodeDTO> listSalestype() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listSalestype");
	}
	
	@Override
	public List<CodeDTO> listSalestype(SoppDTO soppdto) {
		return sqlSession.selectList("code.listSalestype", soppdto);
	}

	@Override
	public List<CodeDTO> listSstatus() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listSoppstatus");
	}
	
	@Override
	public List<CodeDTO> listSstatus(SoppDTO soppdto) {
		return sqlSession.selectList("code.listSoppstatus", soppdto);
	}

	@Override
	public List<CodeDTO> listSchedtype() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listSchedtype");
	}
	
	@Override
	public List<CodeDTO> listSchedtype(SoppDTO soppdto) {
		return sqlSession.selectList("code.listSchedtype", soppdto);
	}

	

	@Override
	public List<CodeDTO> listCode02n(String code01) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode02n", code01);
	}

	@Override
	public List<CodeDTO> listCode03n(String code02) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode03n", code02);
	}
	
	@Override
	public List<CodeDTO> listSprttype() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listSprttype");
	}
	
	@Override
	public List<CodeDTO> listSprttype(SoppDTO soppdto) {
		return sqlSession.selectList("code.listSprttype", soppdto);
	}

	@Override
	public List<CodeDTO> listSprtstat() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listSprtstat");
	}
	
	@Override
	public List<CodeDTO> listSprtstat(SoppDTO soppdto) {
		return sqlSession.selectList("code.listSprtstat", soppdto);
	}

	@Override
	public int updateCode01(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("code.updateCode01",dto);
	}

	@Override
	public int updateCode02(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("code.updateCode02",dto);
	}

	@Override
	public int updateCode03(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("code.updateCode03",dto);
	}

	@Override
	public List<CodeDTO> listBoardType() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listBoardtype");
	}

	@Override
	public List<CodeDTO> listBoardType(SoppDTO soppdto) {
		return sqlSession.selectList("code.listBoardtype", soppdto);
	}

	@Override
	public List<CodeDTO> listBusinessType(SoppDTO soppdto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listBusinessType", soppdto);
	}
	
	@Override
	public List<CodeDTO> listContractType(SoppDTO soppdto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listContractType", soppdto);
	}
	
	@Override
	public List<CodeDTO> listTechdSteps(SoppDTO soppdto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listTechdSteps", soppdto);
	}
	
	@Override
	public List<CodeDTO> listSchedDetailType(SoppDTO soppdto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listSchedDetailType", soppdto);
	}
	
	@Override
	public List<CodeDTO> listActSprtScheduleDetailType(SoppDTO soppdto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listActSprtScheduleDetailType", soppdto);
	}

	@Override
	public List<CodeDTO> listContType(SoppDTO soppdto) {
		return sqlSession.selectList("code.listContType", soppdto);
	}

	@Override
	public List<CodeDTO> listSchdType(int compNo) {
		return sqlSession.selectList("code.listSchdType", compNo);
	}

	@Override
	public List<CodeDTO> listAreaType(int compNo) {
		return sqlSession.selectList("code.listAreaType", compNo);
	}
}
