package kr.swcore.sderp.sched.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.sched.dto.SchedDTO;

public interface SchedService {
	
	List<SchedDTO> listSched();
	Object listSched(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response);
	Object listSreport(HttpSession session, HttpSession session2, Object object, Object object2);
	List<SchedDTO> listconSched(HttpSession session, SchedDTO dto);
	SchedDTO detailSched(int schedNo);
	int insertSched(SchedDTO dto);
	int insertSchedauto(SchedDTO dto);
	int insertSched(HttpSession session, SchedDTO dto);
	int deleteSched(int schedNo);
	int updateSched(SchedDTO dto);
	int insertSreport(SchedDTO dto);
	int insertSreport2(SchedDTO dto);
	List<SchedDTO> listMreport(HttpSession session);
	List<SchedDTO> listMreport2(HttpSession session);
	SchedDTO detailAddtext(int sreportNo);
	Object detailSreport(HttpSession session,SchedDTO dto);
	SchedDTO myAddtext(HttpSession session,SchedDTO dto);
	SchedDTO myAddtext2(HttpSession session,SchedDTO dto);
	int updateSreport(SchedDTO dto);
	int updateSreport1(SchedDTO dto);
	int updateSreport2(SchedDTO dto);
}
