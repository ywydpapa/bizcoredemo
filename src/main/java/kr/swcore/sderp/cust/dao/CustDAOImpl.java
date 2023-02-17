package kr.swcore.sderp.cust.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.cust.dto.CustDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
@Repository
public class CustDAOImpl implements CustDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<CustDTO> listCust() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cust.listCust");
	}
	
	@Override
	public List<CustDTO> listCust(SoppDTO soppdto) {
		return sqlSession.selectList("cust.listCust", soppdto);
	}

	@Override
	public CustDTO detailCust(int custNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cust.detailCust",custNo);
	}

	@Override
	public int insertCust(CustDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cust.insertCust",dto);
	}

	@Override
	public int deleteCust(int custNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cust.deleteCust",custNo);
	}

	@Override
	public int updateCust01(CustDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cust.updateCust", dto);
	}

	@Override
	public String fileInfo(int custNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CustDTO> detailsCust(int custNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cust.detailsCust",custNo);
	}

	@Override
	public List<CustDTO> listBuyr() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cust.listBuyr");
	}
	
	@Override
	public List<CustDTO> listBuyr(SoppDTO soppDto) {
		return sqlSession.selectList("cust.listBuyr", soppDto);
	}

	@Override
	public List<CustDTO> listPtnc() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cust.listPtnc");
	}
	
	@Override
	public List<CustDTO> listPtnc(SoppDTO soppDto) {
		return sqlSession.selectList("cust.listPtnc", soppDto);
	}

	@Override
	public List<CustDTO> listSupply() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cust.listSupply");
	}
	
	@Override
	public List<CustDTO> listSupply(SoppDTO soppDto) {
		return sqlSession.selectList("cust.listSupply", soppDto);
	}

	@Override
	public int custCheck(CustDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cust.custCheck",dto);
	}

	@Override
	public int insertCust02(CustDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cust.insertCust02",dto);
	}

	@Override
	public int insertCust03(CustDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cust.insertCust03",dto);
	}

	@Override
	public int insertCust04(CustDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cust.insertCust04",dto);
	}

	@Override
	public CustDTO detailCust02(int custNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cust.detailCust02",custNo);
	}

	@Override
	public CustDTO detailCust03(int custNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cust.detailCust03",custNo);
	}

	@Override
	public CustDTO detailCust04(int custNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cust.detailCust04",custNo);
	}

	@Override
	public int updateCust05(CustDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cust.updateCust05", dto);
	}

	@Override
	public List<CustDTO> listCustmember(int custNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cust.listCustmember", custNo);
	}

	@Override
	public List<CustDTO> listCustNameCheck(CustDTO custDTO) {
		return sqlSession.selectList("cust.listCustNameCheck", custDTO);
	}

	@Override
	public List<CustDTO> listCustNameSimilarCheck(CustDTO custDTO) {
		return sqlSession.selectList("cust.listCustNameSimilarCheck", custDTO);
	}

	@Override
	public CustDTO sessionSelectCust(int custCompNo) {
		return sqlSession.selectOne("cust.sessionSelectCust", custCompNo);
	}

	@Override
	public int tempSelectCustInsert(CustDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cust.tempSelectCustInsert",dto);
	}

	@Override
	public List<CustDTO> getAllDataList(int compNo) {
		return sqlSession.selectList("cust.getAllCustDataList",compNo);
		
	}
}
