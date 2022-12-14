package kr.swcore.sderp.store.service;

import kr.swcore.sderp.store.dto.StoreDTO;
import java.util.List;
public interface StoreService {

    List<StoreDTO> listStore();

    int insertStgore(StoreDTO dto);

    int updateStgore(StoreDTO dto);

    int deleteStgore(StoreDTO dto);

}
