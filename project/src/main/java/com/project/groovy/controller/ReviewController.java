package com.project.groovy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.groovy.service.SpotifyService;

import se.michaelthelin.spotify.model_objects.specification.AlbumSimplified;

@Controller
@RequestMapping("review")
public class ReviewController {
	
	@Autowired
	private SpotifyService spotifyService;
	
	@GetMapping("/list")
	public String getLatestAlbums(Model model) {
		List<AlbumSimplified> latestAlbums = spotifyService.getLatestAlbums();
		model.addAttribute("latestAlbums", latestAlbums);
		return "review";
	}
}
