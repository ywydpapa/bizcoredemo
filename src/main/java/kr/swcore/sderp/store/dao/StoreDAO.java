package kr.swcore.sderp.store.dao;

import kr.swcore.sderp.store.dto.StoreDTO;

import java.util.List;
public interface StoreDAO {
    List<StoreDTO> listStore(StoreDTO dto);

    int insertStore(StoreDTO dto);

    int updateStore(StoreDTO dto);

    int deleteStore(StoreDTO dto);

	List<StoreDTO> getDetail(int productNo);

	List<StoreDTO> getStoreList(StoreDTO dto);

	int insertStore2(StoreDTO storeDto);

	int getLastStoreNo(StoreDTO storeDto);



}
