package com.project.groovy.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.groovy.model.PageHandler;
import com.project.groovy.model.SearchCondition;
import com.project.groovy.service.ReviewService;
import com.project.groovy.service.SpotifyService;
import com.project.groovy.spotify.CreateToken;

import se.michaelthelin.spotify.model_objects.specification.Album;

@Controller
public class SearchController {

	private SpotifyService spotifyService;
	private ReviewService reviewService;
	
	@Autowired
	public SearchController(SpotifyService spotifyService, ReviewService reviewService) {
		super();
		this.spotifyService = spotifyService;
		this.reviewService = reviewService;
	}
	
	
	@GetMapping("/search")
	public String search(String search, SearchCondition sc, Model model) {
		try {
			List<Album> albums = spotifyService.searchAlbums(search);
			List<Map> map = new ArrayList<>();
			List<Album> list = new ArrayList<>();
			int tmp = 0;
			if (albums.size() < 10) tmp = albums.size();
			else tmp = sc.getPage() * 10;
			for (int i=sc.getPage()*10 - 10; i<tmp; i++) {
				list.add(albums.get(i));
			}
			for (Album album : albums) {
				String albumId = album.getId();
				map.add(reviewService.selectReviewAvg(albumId));
			}
			PageHandler ph = new PageHandler(albums.size(), sc);
			model.addAttribute("ph", ph);
			model.addAttribute("albums", list);
			model.addAttribute("avgs", map);
			return "search";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "search";
		}
	}
	
	@PostMapping("/recommend/search")
	@ResponseBody
	public ResponseEntity<String> searchRecommend(String keyword, String type, Model model) {
		try {
			String token = CreateToken.accesstoken();
			String str = spotifyService.search(token, keyword, type);
			JsonParser parser = new JsonParser();
			JsonObject jsonObject = (JsonObject) parser.parse(str);
			model.addAttribute("str", jsonObject);
			return new ResponseEntity<String>(str, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("SEARCH_ERROR", HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping("/test/search")
	public String searchTest(String keyword, Model model) {
		String token = CreateToken.accesstoken();
		String str = spotifyService.search(token, keyword, "artist,album");
		JsonParser parser = new JsonParser();
		JsonObject jsonObject = (JsonObject) parser.parse(str);
		model.addAttribute("str", jsonObject);
		return "test-recom";
	}

}
