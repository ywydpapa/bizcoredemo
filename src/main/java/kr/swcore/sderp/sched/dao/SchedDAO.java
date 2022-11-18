package kr.swcore.sderp.sched.dao;

import java.util.List;

import kr.swcore.sderp.sched.dto.SchedDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

public interface SchedDAO {
	
	List<SchedDTO> listSched();
	List<SchedDTO> listSched(SchedDTO dto);
	List<SchedDTO> listSreport(SchedDTO dto);
	int listSchedCnt(SchedDTO dto);
	List<SchedDTO> listconSched(SchedDTO dto);
	SchedDTO detailSched(int schedNo);
	int insertSched(SchedDTO dto);
	int deleteSched(int schedNo);
	int updateSched(SchedDTO dto);
	int insertSreport(SchedDTO dto);
	List<SchedDTO> listMreport(SchedDTO dto);
	SchedDTO detailAddtext(int sreportNo);
	SchedDTO myAddtext(SchedDTO dto);
	List<SchedDTO> detailSreport(SchedDTO dto);
}
