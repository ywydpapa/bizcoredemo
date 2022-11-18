package kr.swcore.sderp.sched.dao;

import java.util.List;

import kr.swcore.sderp.sched.dto.SchedDTO;

public interface SchedDAO {
	
	List<SchedDTO> listSched();
	List<SchedDTO> listSched(SchedDTO dto);
	List<SchedDTO> listSreport(SchedDTO dto);
	int listSchedCnt(SchedDTO dto);
	List<SchedDTO> listconSched(SchedDTO dto);
	SchedDTO detailSched(int schedNo);
	int insertSched(SchedDTO dto);
	int insertSchedauto(SchedDTO dto);
	int deleteSched(int schedNo);
	int updateSched(SchedDTO dto);
	int insertSreport(SchedDTO dto);
	int insertSreport2(SchedDTO dto);
	List<SchedDTO> listMreport(SchedDTO dto);
	List<SchedDTO> listMreport2(SchedDTO dto);
	SchedDTO detailAddtext(int sreportNo);
	SchedDTO myAddtext(SchedDTO dto);
	SchedDTO myAddtext2(SchedDTO dto);
	List<SchedDTO> detailSreport(SchedDTO dto);
	int updateSreport(SchedDTO dto);
	int updateSreport1(SchedDTO dto);
	int updateSreport2(SchedDTO dto);
}
