package kr.swcore.sderp.board;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.HomeController;
import kr.swcore.sderp.board.Service.BoardService;
import kr.swcore.sderp.board.dto.BoardDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.user.service.UserService;

@Controller

@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	CodeService codeService;
	
	@Inject
	BoardService boardService;

	@Inject
	UserService userService;

	@RequestMapping("board.do")
	public String listboard(HttpSession session) {
		return "board/board";
	}

	@RequestMapping("regboard.do")
	public ModelAndView regboard(HttpSession session, ModelAndView mav) {
		mav.addObject("boardtype", codeService.listBoardtype(session));
		mav.addObject("userlist", userService.userList(session));
		mav.addObject("listboard", boardService.listboard(session));
		mav.setViewName("board/regboard");
		return mav;
	}

	@RequestMapping("listboard.do")
	public ModelAndView listboard(HttpSession session, ModelAndView mav) {
		mav.addObject("listboard", boardService.listboard(session));
		mav.setViewName("board/listboard");
		return mav;
	}


	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute BoardDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int boardInsertResult = boardService.insertBoard(session, dto);
		param.put("code", (String.valueOf(boardInsertResult))); 		
		return ResponseEntity.ok(param);
	}
	
}
