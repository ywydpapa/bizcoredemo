package kr.swcore.sderp.mis.dao;

import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.mis.dto.MisDTO;
import kr.swcore.sderp.sopp.dto.SoppdataDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class MisDAOImpl implements MisDAO {

    @Inject
    SqlSession sqlSession;

    @Override
    public List<MisDTO> listHRduty(MisDTO dto) {
        return sqlSession.selectList("mis.hrdutylist",dto);
    }

    @Override
    public List<MisDTO> listHRcost(MisDTO dto) {
        return sqlSession.selectList("mis.hrcostlist",dto);
    }

    @Override
    public List<MisDTO> listSopp(MisDTO dto) {
        return sqlSession.selectList("mis.soppList", dto);
    }

    @Override
    public List<MisDTO> listSoppcost(MisDTO dto) {
        return sqlSession.selectList("mis.soppCost", dto);
    }

    @Override
    public List<MisDTO> listSoppmargin(ContDTO dto) {
        return sqlSession.selectList("mis.soppMargin", dto);
    }

    @Override
    public List<MisDTO> listBacinout(MisDTO dto) {
        return sqlSession.selectList("mis.bacinout" ,dto);
    }

    @Override
    public List<MisDTO> listBacstatus(MisDTO dto) {
        return sqlSession.selectList("mis.bacstatus",dto);
    }

	@Override
	public List<AccountDTO> sumSvat(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mis.sumSVat",dto);
	}

	@Override
	public List<AccountDTO> sumSvat_sub(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mis.sumSvat_sub",dto);
	}

	@Override
	public List<AccountDTO> sumSvatSearch(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mis.sumSVatSearch",dto);
	}

	@Override
	public List<AccountDTO> sumBvat(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mis.sumBVat",dto);
	}

	@Override
	public List<AccountDTO> sumBvat_sub(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mis.sumBvat_sub",dto);
	}

	@Override
	public List<AccountDTO> sumBvatSearch(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mis.sumBVatSearch",dto);
	}

	@Override
	public List<SoppdataDTO> listIOsum(SoppdataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mis.listIOsum",dto);
	}

	@Override
	public List<SoppdataDTO> listSearchIO(SoppdataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mis.listSearchIO",dto);
	}

	@Override
	public List<AccountDTO> listbac(int compNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mis.baclist", compNo);
	}

	@Override
	public List<AccountDTO> bacSelectList(AccountDTO dto) {
		return sqlSession.selectList("mis.bacSelectList", dto);
	}

	@Override
	public List<AccountDTO> bacInOutList(AccountDTO dto) {
		return sqlSession.selectList("mis.bacInOutList", dto);
	}

	@Override
	public List<MisDTO> listBacstatus_select(MisDTO dto) {
		return sqlSession.selectList("mis.bacstatus_select",dto);
	}
}
