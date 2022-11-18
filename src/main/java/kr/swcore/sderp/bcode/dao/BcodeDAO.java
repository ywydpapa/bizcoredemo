package kr.swcore.sderp.bcode.dao;

import java.util.List;

import kr.swcore.sderp.code.dto.CodeDTO;

public interface BcodeDAO {

	List<CodeDTO> listCode03(String code02);
}
