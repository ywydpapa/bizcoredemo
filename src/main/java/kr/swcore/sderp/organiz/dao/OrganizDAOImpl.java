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
	public List<OrganizDTO> listDept2(int compNo) {
		return sqlSession.selectList("organiz.listDept2", compNo);
	}

	@Override
	public List<OrganizDTO> listDeptChainExtend(OrganizDTO organizDTO) {
		return sqlSession.selectList("organiz.listDeptChainExtend", organizDTO);
	}

	@Override
	public int insertOrg(OrganizDTO dto) {
		return sqlSession.insert("organiz.insertOrg", dto);
	}

	@Override
	public OrganizDTO getOrgByCode(String org_code) {
		return sqlSession.selectOne("organiz.getOrgByCode", org_code);

	}

	@Override
	public int updateOrg(OrganizDTO dto) {
		return sqlSession.update("organiz.updateOrg", dto);
	}

	@Override
	public int deleteOrg(OrganizDTO dto) {
		return sqlSession.update("organiz.deleteOrg", dto);
	
	}


}
