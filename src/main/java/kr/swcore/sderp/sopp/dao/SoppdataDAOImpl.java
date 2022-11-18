package kr.swcore.sderp.sopp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.sopp.dto.SoppdataDTO;

@Repository
public class SoppdataDAOImpl implements SoppdataDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<SoppdataDTO> listSoppdata01(int soppNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listSoppdata01", soppNo);
	}

	@Override
	public int deleteSoppdata01(int soppdataNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("sopp.deleteSoppdata01", soppdataNo);
	}

	@Override
	public int insertSoppdata01(SoppdataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sopp.insertSoppdata01",dto);
	}

	@Override
	public List<SoppdataDTO> listSoppdata02(int soppNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listSoppdata02",soppNo);
	}

	@Override
	public List<SoppdataDTO> listIOsum(SoppdataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listIOsum",dto);
	}
	
	@Override
	public List<SoppdataDTO> listSearchIO(SoppdataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listSearchIO",dto);
	}

	@Override
	public List<SoppdataDTO> listIO(SoppdataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listIO",dto);
	}

	@Override
	public List<SoppdataDTO> listSoppdata011(int soppNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listSoppdata011", soppNo);
	}

	@Override
	public List<SoppdataDTO> listSoppdata011_1(int soppNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listSoppdata011_1", soppNo);
	}

	@Override
	public List<SoppdataDTO> listSoppdata011_2(int soppNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listSoppdata011_2", soppNo);
	}

	@Override
	public List<SoppdataDTO> listContdata(int contNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listContdata", contNo);
	}

	@Override
	public List<SoppdataDTO> listSoppdata01_08(SoppDTO data) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listSoppdata01_08", data);
	}

	@Override
	public List<SoppdataDTO> listSoppdata01_showdetail(int soppNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listSoppdata01_showdetail", soppNo);
	}

	@Override
	public int insertdata01_defalut(SoppdataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sopp.insertdata01_defalut",dto);
	}

}
