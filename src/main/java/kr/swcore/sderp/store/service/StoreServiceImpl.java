package kr.swcore.sderp.store.service;

import kr.swcore.sderp.store.dto.StoreDTO;
import kr.swcore.sderp.store.dao.StoreDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class StoreServiceImpl implements StoreService{

    @Inject
    StoreDAO storeDao;


    @Override
    public List<StoreDTO> listStore() {
        return storeDao.listStore();
    }

    @Override
    public int insertStgore(StoreDTO dto) {
        return storeDao.insertStore(dto);
    }

    @Override
    public int updateStgore(StoreDTO dto) {
        return storeDao.updateStore(dto);
    }

    @Override
    public int deleteStgore(StoreDTO dto) {
        return storeDao.deleteStore(dto);
    }
}
