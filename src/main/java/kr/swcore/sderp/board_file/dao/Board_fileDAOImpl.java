package kr.swcore.sderp.board_file.dao;


	import java.util.List;

	import javax.inject.Inject;

	import org.apache.ibatis.session.SqlSession;
	import org.springframework.stereotype.Repository;

import kr.swcore.sderp.board_file.dto.Board_fileDTO;
import kr.swcore.sderp.board_file.dto.Board_fileDataDTO;



	@Repository
	public class Board_fileDAOImpl implements Board_fileDAO{
		@Inject
		SqlSession sqlSession;
		
		
		//게시판 등록 action
		@Override
		public void board_file_insert(Board_fileDTO dto) {
			// TODO Auto-generated method stub
			sqlSession.insert("board_file.board_file_insert",dto);
		}
		//게시판 list 출력
		@Override
		public List<Board_fileDTO> board_file_list(Board_fileDTO dto) {
			// TODO Auto-generated method stub
			return sqlSession.selectList("board_file.board_file_list",dto);
		}
		//게시판 상세
		@Override
		public List<Board_fileDTO> board_file_detail(Board_fileDTO dto) {
			// TODO Auto-generated method stub
			return sqlSession.selectList("board_file.board_file_detail",dto);
		}
		//게시판 삭제
		@Override
		public void board_file_delete(Board_fileDTO dto) {
			// TODO Auto-generated method stub
			sqlSession.update("board_file.board_file_delete",dto);
		}
		//게시판 수정 
		@Override
		public void board_file_update(Board_fileDTO dto) {
			// TODO Auto-generated method stub
			sqlSession.update("board_file.board_file_update",dto);
		}

		//update
		
		@Override
		public List<Board_fileDTO> listFile(int bf_pk) {
			// TODO Auto-generated method stub
			return sqlSession.selectList("board_file.listFile", bf_pk);
		}

		@Override
		public int uploadFile(Board_fileDataDTO dto) {
			// TODO Auto-generated method stub
			return sqlSession.insert("board_file.uploadFile", dto);
		}
		
		//자료싱 filedata 조회
		@Override
		public List<Board_fileDataDTO> board_filedata_detail(Board_fileDataDTO datadto) {
			// TODO Auto-generated method stub
			return sqlSession.selectList("board_file.board_filedata_detail",datadto);
		}
		//유저이름
		@Override
		public List<Board_fileDTO> board_file_name(Board_fileDTO dto) {
			// TODO Auto-generated method stub
			return sqlSession.selectList("board_file.board_file_name",dto);
		}

		@Override
		public Integer deleteFile(Board_fileDataDTO dto) {
			// TODO Auto-generated method stub
			return sqlSession.delete("board_file.deleteFile", dto);
		}

		@Override
		public Board_fileDataDTO downloadFile(Board_fileDataDTO dto) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("board_file.downloadFile", dto);
		}
		
		
		
	}

