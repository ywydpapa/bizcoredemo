package kr.swcore.sderp.store.dao;

import kr.swcore.sderp.store.dto.StoreInoutDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class StoreInoutDAOImpl implements StoreInoutDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public List<StoreInoutDTO> listStore(StoreInoutDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertInoutStore(StoreInoutDTO dto) {
		return sqlSession.insert("store.insertInoutStore", dto);

	}

	@Override
	public int deleteStore(StoreInoutDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StoreInoutDTO> getDetail(int productNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StoreInoutDTO> getInoutStoreList(int prodcutNo) {
		return sqlSession.selectList("storeInout.inoutList", prodcutNo);
	}

	@Override
	public List<StoreInoutDTO> getAllList(StoreInoutDTO dto) {
		return sqlSession.selectList("storeInout.inoutAllList", dto);

	}

	@Override
	public int updateInout(StoreInoutDTO dto) {
		return sqlSession.update("storeInout.updateInout", dto);

	}

	@Override
	public int updateStore(StoreInoutDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StoreInoutDTO> search(StoreInoutDTO sdto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("storeInout.search", sdto);

	}

	@Override
	public StoreInoutDTO getInOut(StoreInoutDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("storeInout.getInOut", dto);
	}

	@Override
	public int updateEtc(StoreInoutDTO idto) {
		return sqlSession.update("storeInout.updateEtc", idto);
	}

}
