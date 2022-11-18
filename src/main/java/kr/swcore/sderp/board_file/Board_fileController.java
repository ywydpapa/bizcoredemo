package kr.swcore.sderp.board_file;



	import java.io.IOException;

	import java.util.HashMap;
	import java.util.List;
	import java.util.Map;


	import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;


	import org.springframework.http.HttpHeaders;
	import org.springframework.http.HttpStatus;
	import org.springframework.http.MediaType;
	import org.springframework.http.ResponseEntity;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;

	import org.springframework.web.bind.annotation.ModelAttribute;
	import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kr.swcore.sderp.board_file.dto.Board_fileDTO;
import kr.swcore.sderp.board_file.dto.Board_fileDataDTO;
import kr.swcore.sderp.board_file.service.Board_fileService;



	@Controller
	@RequestMapping("/board__file/*")
	public class Board_fileController {
		
		@Inject
		Board_fileService board_fileService;
		
		
		
		//게시판 리스트
			@RequestMapping("/board_file")
			public String board_file(HttpSession session, Board_fileDTO dto, Model model) {
				//List<Board_fileDTO> board_file_name =  board_fileService.board_file_name(dto);
				//model.addAttribute("board_file_name", board_file_name);
				
				//List<Board_fileDTO> board_file_list = board_fileService.board_file_list(dto);
				
				//model.addAttribute("board_file_list", board_file_list);
			
				
				return "board__file/board_file";
			}
			//게시판 등록 페이지
			@RequestMapping("/board_file_insert")
			public String board_file_insert() {
				
				
				return "board__file/board_file_insert";
			}
			
			//게시판 등록 action
			@RequestMapping(value="board__file/board_file_insert_action", method = RequestMethod.POST)
			public String board_file_insert_action(HttpSession session, Board_fileDTO dto) {
				
				board_fileService.board_file_insert(dto);
				 
				return "redirect:/board__file/board_file";
			}
			
			//게시판 상세
				@RequestMapping("/board_file_detail/{bf_pk}")
				public String board_file_detail(@PathVariable("bf_pk") int bf_pk, Board_fileDTO dto, Model model, Board_fileDataDTO datadto) {
					
					dto.setBf_pk(bf_pk);

					
					List<Board_fileDTO> board_file_detail = board_fileService.board_file_detail(dto);
					model.addAttribute("board_file_detail", board_file_detail);

					datadto.setBf_pk(bf_pk);
					List<Board_fileDataDTO> board_filedata_detail = board_fileService.board_filedata_detail(datadto);
					model.addAttribute("board_filedata_detail", board_filedata_detail);

					return "board__file/board_file_detail";
				}
				
				//게시판 삭제 action
						@RequestMapping("/board_file_delete/{bf_pk}")
						public String board_file_delete(@PathVariable("bf_pk") int bf_pk, Board_fileDTO dto) {
							
							dto.setBf_pk(bf_pk);
							
							board_fileService.board_file_delete(dto);
							
							return "redirect:/board__file/board_file";
						}
						
						//게시판 수정
						@RequestMapping("/board_file_update/{bf_pk}")
						public String board_file_update(@PathVariable("bf_pk") int bf_pk, Board_fileDTO dto, Model model) {

							dto.setBf_pk(bf_pk);
							
							List<Board_fileDTO> board_file_detail = board_fileService.board_file_detail(dto);
							model.addAttribute("board_file_detail", board_file_detail);
								
							return "board__file/board_file_update";
						}
						//게시판 수정 action
						@RequestMapping(value="board__file/board_file_update_action", method = RequestMethod.POST)
						public String board_file_update_action(HttpSession session, Board_fileDTO dto, Model model) {
							
							board_fileService.board_file_update(dto);
							
							
							
							return "redirect:/board__file/board_file";
						}
						
						
						//파일 업로드& etc test
						@RequestMapping("/uploadfile/{bf_pk}")
						public ResponseEntity<?> uploadFile(HttpSession session, @PathVariable("bf_pk") int bf_pk, @ModelAttribute Board_fileDataDTO dto, MultipartHttpServletRequest fileList) throws IOException {
							int uploadFile = board_fileService.uploadFile(session, bf_pk, fileList);
							Map<String, Object> param = new HashMap<>();
							if(uploadFile > 0) {
								param.put("code", "10001");
								param.put("data",board_fileService.listFile(bf_pk));
							} else {
								param.put("code", "20001");
							}
							return ResponseEntity.ok(param);
						}
						
						//파일 삭제 
						@RequestMapping("/deleteFile")
						public ResponseEntity<?> removeFile(HttpSession session, @ModelAttribute Board_fileDataDTO dto){
							int uploadFile = board_fileService.deleteFile(session, dto);

							Map<String, Object> param = new HashMap<>();
							if(uploadFile > 0) {
								param.put("code", "10001");
								param.put("data", board_fileService.listFile(dto.getBf_pk()));
							} else {
								param.put("code", "20001");
							}
							return ResponseEntity.ok(param);
						}
						//파일 다운로드
						@RequestMapping("/downloadfile")
						public ResponseEntity<?> downloadFile(HttpSession session, HttpServletResponse response, @ModelAttribute Board_fileDataDTO dto) throws IOException {
							Board_fileDataDTO board_File = board_fileService.downloadFile(dto);
							String fileName = board_File.getFileName();
							HttpHeaders headers = new HttpHeaders();
							headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
							headers.add("Content-Disposition", new String(fileName.getBytes("UTF-8"), "ISO-8859-1"));
							ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(board_File.getFileContent(), headers, HttpStatus.OK);
							
							return entity;
						}
						
						
						
						
						
		
	}
