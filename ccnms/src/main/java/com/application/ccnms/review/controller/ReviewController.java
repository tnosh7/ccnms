package com.application.ccnms.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.application.ccnms.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
}
