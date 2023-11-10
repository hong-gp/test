package com.project.groovy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.groovy.model.PageHandler;
import com.project.groovy.model.Review;
import com.project.groovy.model.SearchCondition;
import com.project.groovy.service.ReviewService;
import com.project.groovy.service.SpotifyService;
import com.project.groovy.service.UserService;

import se.michaelthelin.spotify.model_objects.specification.Album;
import se.michaelthelin.spotify.model_objects.specification.AlbumSimplified;

@Controller
@RequestMapping("review")
public class ReviewController {
	
	private SpotifyService spotifyService;
	private UserService userService;
	private ReviewService reviewService;
	
	@Autowired
	public ReviewController(SpotifyService spotifyService, UserService userService, ReviewService reviewService) {
		super();
		this.spotifyService = spotifyService;
		this.userService = userService;
		this.reviewService = reviewService;
	}

	@GetMapping("/list")
	public String getLatestAlbums(String order, SearchCondition sc, Model model) {
		if (order.equals("latest")) {
			List<AlbumSimplified> latestAlbums = spotifyService.getLatestAlbums();
			List<AlbumSimplified> list = new ArrayList<>();
			for (int i=sc.getPage()*10 - 10; i<sc.getPage()*10; i++) {
				list.add(latestAlbums.get(i));
			}
			PageHandler ph = new PageHandler(latestAlbums.size(), sc);
			model.addAttribute("ph", ph);
			model.addAttribute("latestAlbums", list);
		} else if (order.equals("popular")) {
			try {
				List<Review> list = reviewService.selectAllReview();
				List<Album> albums = new ArrayList<>();
				for (Review review : list) {
					albums.add(spotifyService.searchAlbumById(review.getAlbum_id()));
				}
				PageHandler ph = new PageHandler(albums.size(), sc);
				model.addAttribute("ph", ph);
				model.addAttribute("latestAlbums", albums);
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "error");
				return "review";
			}
		}
		return "review";
	}
	
	@GetMapping("/review")
	public String albumReview(String id, Model model) {
		Album album = spotifyService.searchAlbumById(id);
		try {
			List<Review> list = reviewService.selectAll(album.getId());
			for (int i=0; i<list.size(); i++) {
				list.get(i).setComment(list.get(i).getComment().replace("\r\n", "<br>"));
			}
			int cnt = reviewService.count(id);
			model.addAttribute("album", album);
			model.addAttribute("reviews", list);
			model.addAttribute("cnt", cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "reviewDetail";
	}
	
	@PostMapping("/write")
	public String write(Review review, HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		review.setUser_id(id);
		try {
			review.setUser_nickname(userService.select(id).getNickname());
			System.out.println(review);
			
			int rowCnt = reviewService.insert(review);
			
			if (rowCnt != 0) {
				model.addAttribute("msg", "write_ok");
				return "redirect:/review/review?id=" + review.getAlbum_id();
			} else {
				throw new Exception("write error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "write_error");
			return "redirect:/review/review?id=" + review.getAlbum_id();
		}
	}
	
	@PostMapping("/modify")
	public String modify(Review review, HttpSession session, Model model) {
		String user_id = (String)session.getAttribute("id");
		review.setUser_id(user_id);
		System.out.println(review);
		
		try {
			int res = reviewService.update(review);
			
			if (res != 1) throw new Exception("Modify Error");
			
			model.addAttribute("msg", "modify_ok");
			return "redirect:/review/review?id=" + review.getAlbum_id();
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "modify_error");
			return "redirect:/review/review?id=" + review.getAlbum_id();
		}
	}
	
	@PostMapping("/delete")
	public String delete(Review review, HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		try {
			int rowCnt = reviewService.delete(review.getNum(), id);
			
			if (rowCnt != 1) throw new Exception("Delete Error");
			
			model.addAttribute("msg", "delete_ok");
			return "redirect:/review/review?id=" + review.getAlbum_id();
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "delete_error");
			return "redirect:/review/review?id=" + review.getAlbum_id();
		}
	}
	
	@PostMapping("/like")
	@ResponseBody
	public ResponseEntity<Integer> like(Integer review_num, HttpSession session) {
		String id = (String)session.getAttribute("id");
		
		try {
			Review review = reviewService.selectReviewLike(id, review_num);
			System.out.println(review);
			int res = 0;
			int cnt = 0;
			
			if (review != null) {
				System.out.println(review.getNum());
				res = reviewService.deleteReviewLike(id, review.getNum());
				cnt = -1;
				System.out.println(res);
				System.out.println(cnt);
			}
			else {
				res = reviewService.insertReviewLike(id, review_num);
				cnt = 1;
			}
			
			if (res != 1) {
				throw new Exception("Like Error");
			}
			reviewService.updateLikeCnt(cnt, review_num);
			int rowCnt = reviewService.countReviewCnt(review_num);
			return new ResponseEntity<Integer>(rowCnt, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Integer>(-1, HttpStatus.BAD_REQUEST);
		}
	}
}
