package kr.swcore.sderp.bcode.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.code.dto.CodeDTO;

@Repository
public class BcodeDAOImpl implements BcodeDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<CodeDTO> listCode03(String code02) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bcode.listCode03");
	}

}
