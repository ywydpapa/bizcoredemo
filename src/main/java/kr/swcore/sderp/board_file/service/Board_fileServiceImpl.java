package kr.swcore.sderp.board_file.service;
	

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.swcore.sderp.board_file.dao.Board_fileDAO;
import kr.swcore.sderp.board_file.dto.Board_fileDTO;
import kr.swcore.sderp.board_file.dto.Board_fileDataDTO;
import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.common.dto.WrapperDTO;
import kr.swcore.sderp.util.SessionInfoGet;


@Repository
public class Board_fileServiceImpl implements Board_fileService{
	
	@Inject
	Board_fileDAO board_fileDao;
	
	
	
	//게시판 등록 action
	@Override
	public void board_file_insert(Board_fileDTO dto) {
		// TODO Auto-generated method stub
		board_fileDao.board_file_insert(dto);
	}
	
	//게시판 list 출력
	@Override
	public List<Board_fileDTO> board_file_list(Board_fileDTO dto) {
		// TODO Auto-generated method stub
		return board_fileDao.board_file_list(dto);
	}
	//게시판 상세
	@Override
	public List<Board_fileDTO> board_file_detail(Board_fileDTO dto) {
		// TODO Auto-generated method stub
		return board_fileDao.board_file_detail(dto);
	}
	//게시판 삭제
	@Override
	public void board_file_delete(Board_fileDTO dto) {
		
		board_fileDao.board_file_delete(dto);	
	}
	//게시판 수정
	@Override
	public void board_file_update(Board_fileDTO dto) {
		// TODO Auto-generated method stub
		board_fileDao.board_file_update(dto);
	}

	@Override
	public List<Board_fileDTO> listFile(int bf_pk) {
		// TODO Auto-generated method stub
		return board_fileDao.listFile(bf_pk);
	}

	@Override
	public int uploadFile(HttpSession session, int bf_pk, MultipartHttpServletRequest fileList) throws IOException {
		MultipartFile file = fileList.getFile("file");
		Board_fileDataDTO board_Filelist = new Board_fileDataDTO();
		board_Filelist.setFileId(UUID.randomUUID().toString());
		board_Filelist.setFileName(file.getOriginalFilename());
		Path mimeType_base = Paths.get("D:/"+ file.getOriginalFilename());
		String mimeType = Files.probeContentType(mimeType_base);
		board_Filelist.setFileContent(file.getBytes());
		board_Filelist.setFileExtention(mimeType);
		board_Filelist.setFileSize(fileList.getParameter("fileSize"));
		board_Filelist.setFileDesc(fileList.getParameter("fileDesc"));
		board_Filelist.setBf_pk(bf_pk);
		board_Filelist.setUserNo(Integer.valueOf((String)session.getAttribute("userNo")));
		
		return board_fileDao.uploadFile(board_Filelist);
	}
	//자료실 filedata 상세 조회
	@Override
	public List<Board_fileDataDTO> board_filedata_detail(Board_fileDataDTO datadto) {
		// TODO Auto-generated method stub
		return board_fileDao.board_filedata_detail(datadto);
	}
	//유저이름
	@Override
	public List<Board_fileDTO> board_file_name(Board_fileDTO dto) {
		// TODO Auto-generated method stub
		return board_fileDao.board_file_name(dto);
	}
	
	
	@Override
	public Integer deleteFile(HttpSession session, Board_fileDataDTO dto) {
		// TODO Auto-generated method stub
		return board_fileDao.deleteFile(dto);
	}

	@Override
	public Board_fileDataDTO downloadFile(Board_fileDataDTO dto) {
		// TODO Auto-generated method stub
		return board_fileDao.downloadFile(dto);
	}
	
	

}
