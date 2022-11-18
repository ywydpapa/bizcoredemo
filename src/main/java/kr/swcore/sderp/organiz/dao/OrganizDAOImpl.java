package kr.swcore.sderp.organiz.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.organiz.dto.OrganizDTO;

@Repository
public class OrganizDAOImpl implements OrganizDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<OrganizDTO> listDept(int compNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("organiz.listDept", compNo);
	}

	@Override
	public List<OrganizDTO> listDeptChainExtend(OrganizDTO organizDTO) {
		return sqlSession.selectList("organiz.listDeptChainExtend", organizDTO);
	}

}
