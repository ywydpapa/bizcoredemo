package kr.swcore.sderp.techd.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.techd.dto.TechdDTO;

@Repository
public class TechdDAOImpl implements TechdDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<TechdDTO> listTechd() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("techd.listTechd");
	}

	@Override
	public List<TechdDTO> listTechdbycust(int custNo) {
		return sqlSession.selectList("techd.listTechdbycust", custNo);
	}

	@Override
	public List<TechdDTO> listTechd(TechdDTO dto) {
		return sqlSession.selectList("techd.listTechd", dto);
	}

	@Override
	public int listTechdCnt(TechdDTO dto) {
		return sqlSession.selectOne("techd.listTechdCnt", dto);
	}

	@Override
	public List<TechdDTO> listconTechd(TechdDTO dto) {
		return sqlSession.selectList("techd.listconTechd", dto);
	}
	
	@Override
	public List<SalesDTO> listTechdinsopp(SoppDTO soppDto) {
		return sqlSession.selectList("techd.listTechdinsopp", soppDto);
	}

	@Override
	public TechdDTO detailTechd(int techdNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("techd.detailTechd", techdNo);
	}

	@Override
	public int updateTechd(TechdDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("techd.updateTechd",dto);
	}

	@Override
	public int deleteTechd(int techdNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("techd.deleteTechd", techdNo);
	}

	@Override
	public int insertTechd(TechdDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("techd.insertTechd", dto);
	}

	

}
