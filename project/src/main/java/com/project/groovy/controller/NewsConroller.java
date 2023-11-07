package com.project.groovy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("news")
public class NewsConroller {

	@GetMapping("list")
	public String news() {
		return "news";
	}
}
