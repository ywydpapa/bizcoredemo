package kr.swcore.sderp.allim.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.allim.dto.AllimDTO;

@Repository
public class AllimDAOImpl implements AllimDAO{
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int insertAllim(AllimDTO dto) {
		return sqlSession.insert("allim.insertAllim", dto);
	}

	@Override
	public List<AllimDTO> timeAllimSelect(AllimDTO dto) {
		return sqlSession.selectList("allim.timeAllimSelect", dto);
	}

	@Override
	public int allimReadUpdate(AllimDTO dto) {
		return sqlSession.update("allim.allimReadUpdate", dto);
	}
	
}
