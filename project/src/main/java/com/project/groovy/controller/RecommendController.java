package com.project.groovy.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.groovy.model.Board;
import com.project.groovy.service.BoardService;
import com.project.groovy.service.SpotifyService;

import se.michaelthelin.spotify.model_objects.specification.Album;
import se.michaelthelin.spotify.model_objects.specification.AlbumSimplified;
import se.michaelthelin.spotify.model_objects.specification.Track;

@Controller
@RequestMapping("recommend")
public class RecommendController {
	
	SpotifyService spotifyService;
	BoardService boardService;

	@Autowired
	public RecommendController(SpotifyService spotifyService, BoardService boardService) {
		super();
		this.spotifyService = spotifyService;
		this.boardService = boardService;
	}

	@GetMapping("recommend")
	public String recommend(Model model) {
		try {
			todayBoard(model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "/";
		}
		return "recommend";
	}
	
	@GetMapping("result")
	public String result(String genre, String artist, String searchTrack, Model model) {
		try {
			List<Track> list = spotifyService.getRecommendAlbums(genre, artist, searchTrack);
			List<AlbumSimplified> albums = new ArrayList<>();
			
			for (Track track : list) {
				albums.add(track.getAlbum());
			}
			model.addAttribute("list", albums);
			todayBoard(model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "/";
		}
		return "recommendResult";
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
