package com.project.groovy.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.groovy.model.Board;
import com.project.groovy.service.BoardService;

@Controller
@RequestMapping("news")
public class NewsConroller {
	
	@Autowired
	BoardService boardService;

	@GetMapping("list")
	public String news(Model model) {
		try {
			todayBoard(model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "/";
		}
		return "news";
	}
	
	@GetMapping("insert")
	public String newsInsert() {
		return "insertNews";
	}
	
	private void todayBoard(Model model) throws Exception {
		List<Map> tmp = boardService.getBestBoard(); 
		List<Board> bestBoard = new ArrayList<>();
		for (Map map : tmp) {
			bestBoard.add(boardService.select((int)map.get("bno"))); 
		}
		model.addAttribute("bestBoard", bestBoard);
	}
	
}
