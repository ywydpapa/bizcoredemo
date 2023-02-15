package kr.swcore.sderp.store.dao;

import kr.swcore.sderp.store.dto.StoreInoutDTO;

import java.util.List;
public interface StoreInoutDAO {
    List<StoreInoutDTO> listStore(StoreInoutDTO dto);

    int insertInoutStore(StoreInoutDTO dto);

    int updateStore(StoreInoutDTO dto);

    int deleteStore(StoreInoutDTO dto);

	List<StoreInoutDTO> getDetail(int productNo);

	List<StoreInoutDTO> getInoutStoreList(int prodcutNo);

	List<StoreInoutDTO> getAllList(StoreInoutDTO dto);


}
