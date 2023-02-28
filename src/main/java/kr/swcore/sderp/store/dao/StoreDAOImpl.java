package kr.swcore.sderp.store.dao;

import kr.swcore.sderp.store.dto.StoreDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class StoreDAOImpl implements StoreDAO{

    @Inject
    SqlSession sqlSession;

    @Override
    public List<StoreDTO> listStore(StoreDTO dto) {
        return sqlSession.selectList("store.listStore", dto);
    }

    @Override
    public int insertStore(StoreDTO dto) {
        return sqlSession.insert("store.insertStore", dto);
    }

    @Override
    public int updateStore(StoreDTO dto) {
        return sqlSession.update("store.updateStore", dto);
    }

    @Override
    public int deleteStore(StoreDTO dto) {
        return sqlSession.delete("store.deleteStore", dto);
    }

	@Override
	public List<StoreDTO> getDetail(int storeNo) {
		 return sqlSession.selectList("store.detailStore", storeNo);
	
	}

	@Override
	public List<StoreDTO> getStoreList(StoreDTO dto) {
		 return sqlSession.selectList("store.storeList", dto);
		
	}
	
	
	//////// 수정코드 =================================================================

	@Override
	public int insertStore2(StoreDTO storeDto) {
		 return sqlSession.insert("store.insertStore2", storeDto);
			
	}

	@Override
	public int getLastStoreNo(StoreDTO storeDto) {
		 return sqlSession.selectOne("store.getLastStoreNo", storeDto);
	}

	@Override
	public int getStoreNo(int productNo) {
		
		return sqlSession.selectOne("store.getStoreNo", productNo);
	}
}
