package kr.swcore.sderp.bcode.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.bcode.dao.BcodeDAO;
import kr.swcore.sderp.code.dto.CodeDTO;

@Service
public class BcodeServiceImpl implements BcodeService {

	@Inject
	BcodeDAO bcodeDao;
	
	@Override
	public List<CodeDTO> listCode03(String code02) {
		// TODO Auto-generated method stub
		return bcodeDao.listCode03(code02);
	}

}
