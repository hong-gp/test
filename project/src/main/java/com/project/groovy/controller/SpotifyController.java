package com.project.groovy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groovy.service.SpotifyService;

import se.michaelthelin.spotify.model_objects.specification.Album;

@Controller
public class SpotifyController {
	
	 @Autowired
	 private SpotifyService spotifyService;

	 @GetMapping("/search")
	 public String searchAlbum(@RequestParam(name = "query") String query, Model model) {
		 List<Album> albums = spotifyService.searchAlbums(query);
		 model.addAttribute("albums", albums);
		 return "album-list"; // Thymeleaf 템플릿 파일 이름
	 }
}
