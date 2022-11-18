package kr.swcore.sderp.cont.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.cont.dto.ContDTO;
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
}
