package kr.swcore.sderp.cont.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.cont.dto.ContFileDataDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

@Repository
public class ContDAOImpl implements ContDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<ContDTO> listCont() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listCont");
	}

	@Override
	public List<ContDTO> listCont3m() {
		return sqlSession.selectList("cont.listcont3m");
	}

	@Override
	public List<ContDTO> listContbycust(int custNo) {
		return sqlSession.selectList("cont.listContbycust",custNo);
	}

	@Override
	public List<ContDTO> listCont(SoppDTO soppDto) {
		return sqlSession.selectList("cont.listCont", soppDto);
	}
	
	@Override
	public List<ContDTO> listconCont(ContDTO dto) {
		return sqlSession.selectList("cont.listconCont", dto);
	}

	@Override
	public ContDTO detailCont(int contNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cont.detailCont", contNo);
	}

	@Override
	public int updateCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updateCont",dto);
	}

	@Override
	public int deleteCont(int contNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cont.deleteCont",contNo);
	}

	@Override
	public int insertCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.insertCont",dto);
	}

	@Override
	public ContDTO listSalesTargetMonthIndividual(ContDTO contDTO) {
		return sqlSession.selectOne("cont.listSalesTargetMonthIndividual", contDTO);
	}

	@Override
	public List<ContDTO> listFile(int contNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listFile", contNo);
	}

	@Override
	public int uploadFile(ContFileDataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.uploadFile", dto);
	}

	@Override
	public Integer deleteFile(ContFileDataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cont.deleteFile", dto);
	}

	@Override
	public ContFileDataDTO downloadFile(ContFileDataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cont.downloadFile", dto);
	}

	@Override
	public ContDTO listSumCont(int compNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cont.listSumCont", compNo);
	}

	@Override
	public int soppListUpdate(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.soppListUpdate",dto);
	}

	@Override
	public int extInsert(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.extInsert", dto);
	}

	@Override
	public int extAttUpdate(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.extAttUpdate", dto);
	}

	@Override
	public List<ContDTO> defaultgradata01() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.defaultgradata01");
	}

	@Override
	public int insert_maintenance(ContDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("cont.insert_maintenance",dto);
		int contNo = dto.getContNo();
		return contNo;
	}

	@Override
	public int update_maintenance(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.update_maintenance",dto);
	}

	@Override
	public int contAmtUpdate(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.contAmtUpdate", dto);
	}

	@Override
	public void updateSopp_buyrno(ContDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("cont.updateSopp_buyrno", dto);
	}
}
