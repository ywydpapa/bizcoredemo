package kr.swcore.sderp.pps.service;

import kr.swcore.sderp.pps.dto.PpsDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface PpsService {
    List<PpsDTO> listPps(HttpSession session, PpsDTO dto);
    PpsDTO detailPps(int ppsId);
    int insertPps(PpsDTO dto);
    int updatePps(PpsDTO dto);
    PpsDTO checkPps(PpsDTO dto);
    int assignUpdate(PpsDTO dto);
    List<PpsDTO> ppsStatusList(HttpSession session, PpsDTO dto);
    List<PpsDTO> mppsStatusList(HttpSession session, PpsDTO dto);
    int mppsInsert(PpsDTO dto);
    int mppsUpdate(PpsDTO dto);
}
