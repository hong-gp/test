package com.project.groovy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groovy.service.SpotifyService;

import se.michaelthelin.spotify.model_objects.specification.Album;
import se.michaelthelin.spotify.model_objects.specification.AlbumSimplified;

@Controller
public class SpotifyController {

	@Autowired
	private SpotifyService spotifyService;

	@GetMapping("/search")
	public String searchAlbum(@RequestParam(name = "query") String query, Model model) {
		List<Album> albums = spotifyService.searchAlbums(query);
		model.addAttribute("albums", albums);
		return "album-list";
	}

	@GetMapping("/latest-albums")
	public String getLatestAlbums(Model model) {
		List<AlbumSimplified> latestAlbums = spotifyService.getLatestAlbums();
		model.addAttribute("latestAlbums", latestAlbums);
		return "latest-album-list";
	}
}
