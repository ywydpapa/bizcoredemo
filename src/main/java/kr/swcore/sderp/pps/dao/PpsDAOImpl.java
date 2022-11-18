package kr.swcore.sderp.pps.dao;

import kr.swcore.sderp.pps.dto.PpsDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class PpsDAOImpl implements PpsDAO{

    @Inject
    SqlSession sqlSession;

    @Override
    public List<PpsDTO> listPps(PpsDTO dto) {
        return sqlSession.selectList("pps.ppsList", dto);
    }

    @Override
    public PpsDTO detailPps(int ppsId) {
        return sqlSession.selectOne("pps.ppsDetail", ppsId);
    }

    @Override
    public int insertPps(PpsDTO dto) {
        return sqlSession.insert("pps.ppsInsert", dto);
    }

    @Override
    public int updatePps(PpsDTO dto) {
        return 0;
    }

	@Override
	public PpsDTO checkPps(PpsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("pps.checkPps", dto);
	}

	@Override
	public int assignUpdate(PpsDTO dto) {
		return sqlSession.update("pps.assignUpdate", dto);
	}

	@Override
	public List<PpsDTO> ppsStatusList(PpsDTO dto) {
		return sqlSession.selectList("pps.ppsStatusList", dto);
	}

    @Override
    public List<PpsDTO> mppsStatusList(PpsDTO dto) {
        return sqlSession.selectList("pps.mppsStatusList", dto);
    }

	@Override
	public int mppsInsert(PpsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("pps.mppsInsert", dto);
	}

	@Override
	public int mppsUpdate(PpsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("pps.mppsUpdate", dto);
	}
}
