package kr.swcore.sderp.common.dao;

import kr.swcore.sderp.common.dto.DeptToPlanTblDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class DeptToPlanTblDAOImpl implements DeptToPlanTblDAO {

    @Inject
    SqlSession sqlSession;

    @Override
    public List<DeptToPlanTblDTO> listWithOrgId(DeptToPlanTblDTO dto) {
        return sqlSession.selectList("deptToPlanTbl.listWithOrgId", dto);
    }
}
