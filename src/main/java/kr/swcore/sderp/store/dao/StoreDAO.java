package kr.swcore.sderp.store.dao;

import kr.swcore.sderp.store.dto.StoreDTO;

import java.util.List;
public interface StoreDAO {
    List<StoreDTO> listStore(StoreDTO dto);

    int insertStore(StoreDTO dto);

    int updateStore(StoreDTO dto);

    int deleteStore(StoreDTO dto);

	StoreDTO getDetail(int storeNo);



}
