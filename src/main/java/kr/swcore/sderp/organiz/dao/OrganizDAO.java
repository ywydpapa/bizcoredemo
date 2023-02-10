package kr.swcore.sderp.organiz.dao;

import java.util.List;

import kr.swcore.sderp.organiz.dto.OrganizDTO;

public interface OrganizDAO {
	
	List<OrganizDTO> listDept(int compNo);
	List<OrganizDTO> listDept2(int compNo);
	List<OrganizDTO> listDeptChainExtend(OrganizDTO organizDTO);
	int insertOrg(OrganizDTO dto);
	OrganizDTO getOrgByCode(String org_code);
	int updateOrg(OrganizDTO dto);
	int deleteOrg(OrganizDTO dto);
}
