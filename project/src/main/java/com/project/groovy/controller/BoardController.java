package com.project.groovy.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.groovy.model.Board;
import com.project.groovy.model.PageHandler;
import com.project.groovy.model.SearchCondition;
import com.project.groovy.model.User;
import com.project.groovy.service.BoardService;
import com.project.groovy.service.UserService;
import com.project.groovy.util.Time;

@Controller
@RequestMapping("board")
public class BoardController {
	
	private BoardService boardService;
	private UserService userService;
	
	public BoardController() {
		super();
	}

	@Autowired
	public BoardController(BoardService boardService, UserService userService) {
		super();
		this.boardService = boardService;
		this.userService = userService;
	}

	@GetMapping("list")
	public String board(SearchCondition sc, HttpServletRequest req, Model model) {
		
		if (!loginCheck(req)) {
			return "redirect:/login?toUrl=" + req.getRequestURL();
		}
		
		try {
			int totalCnt = boardService.searchResultCnt(sc);
			PageHandler pageHandler = new PageHandler(totalCnt, sc);
			System.out.println(sc);
			
			List<Board> list = boardService.searchSelectPage(sc);
			model.addAttribute("ph", pageHandler);
			model.addAttribute("list", list);
			
			Date now = new Date();
			model.addAttribute("now", now);
			model.addAttribute("time", Time.calculateTime(now));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board";
	}
	
	private boolean loginCheck(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		return session.getAttribute("id") != null;
	}
	
	@GetMapping("write")
	public String write(SearchCondition sc, Model model) {
		model.addAttribute("sc", sc);
		return "boardWrite";
	}
	
	@PostMapping("write")
	public String write(Board board, Integer page, Integer pageSize, Model model, HttpSession session, RedirectAttributes redatt) {
		try {
			redatt.addAttribute("page", page);
			redatt.addAttribute("pageSize", pageSize);
			String writer = (String)session.getAttribute("id");
			System.out.println(writer);
			User user = userService.select(writer);
			System.out.println(user);
			board.setWriter_nickname(user.getNickname());
			board.setWriter(writer);
			int rowCnt = boardService.insert(board);
			
			if (rowCnt == 1) {
				redatt.addFlashAttribute("msg", "write_ok");
				return "redirect:/board/list";
			}
			else {
				throw new Exception("board write error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("board", board);
			model.addAttribute("msg", "write_error");
			return "boardWrite";
		}
	}
	
	@GetMapping("read")
	public String read(SearchCondition sc, Integer num, Model model) {
		try {
			Board board = boardService.select(num);
			model.addAttribute("board", board);
			model.addAttribute("sc", sc);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/board/list" + sc.getQueryString();
		}
		return "boardView";
	}
	
	@GetMapping("modify")
	public String modify(Integer num, Model model, HttpSession session, RedirectAttributes reatt) {
		try {
			Board board = boardService.select(num);
			
			if (!board.getWriter().equals(session.getAttribute("id")+"") || session.getAttribute("id") == null) {
				reatt.addAttribute("msg", "modify_error");
				throw new Exception("modify error");
			}
			model.addAttribute("board", board);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/board/list";
		}
		return "boardEdit";
	}
	
	@PostMapping("modify")
	public String modify(Board board, SearchCondition sc, Model model, HttpSession session, RedirectAttributes reatt) {
		String writer = (String)session.getAttribute("id");
		board.setWriter(writer);
		
		try {
			System.out.println(board);
			int rowCnt = boardService.update(board);
			
			if (rowCnt == 1) {
				reatt.addFlashAttribute("msg", "modify_ok");
				return "redirect:/board/list" + sc.getQueryString();
			} else {
				throw new Exception("modify error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("board", board);
			model.addAttribute("msg", "modify_error");
			return "boardEdit";
		}
	}
	
	@PostMapping("remove")
	public String remove(Integer num, SearchCondition sc, Model model, HttpSession session, RedirectAttributes reatt) {
		try {
			String writer = (String)session.getAttribute("id");
			int rowCnt = boardService.delete(num, writer);
			
			if (rowCnt == 1) {
				reatt.addFlashAttribute("msg", "del");
				return "redirect:/board/list" + sc.getQueryString();
			}
			else {
				System.out.println(num + "/"  +writer);
				throw new Exception("board remove error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			reatt.addFlashAttribute("msg", "error");
		}
		return "redirect:/board/list" + sc.getQueryString();
	}
}
