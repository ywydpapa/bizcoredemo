package kr.swcore.sderp.pps.dao;

import kr.swcore.sderp.pps.dto.PpsDTO;

import java.util.List;

public interface PpsDAO {
    List<PpsDTO> listPps(PpsDTO dto);
    PpsDTO detailPps(int ppsId);
    int insertPps(PpsDTO dto);
    int updatePps(PpsDTO dto);
    PpsDTO checkPps(PpsDTO dto);
    int assignUpdate(PpsDTO dto);
    List<PpsDTO> ppsStatusList(PpsDTO dto);
    List<PpsDTO> mppsStatusList(PpsDTO dto);
    int mppsInsert(PpsDTO dto);
    int mppsUpdate(PpsDTO dto);
}
