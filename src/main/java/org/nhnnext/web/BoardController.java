package org.nhnnext.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@RequestMapping("/board/form")
	public String form() {
		return "form";
	}
	
	@RequestMapping(value="/board", method=RequestMethod.POST)
	public String create(String title, String contents) {
		System.out.println("title : " + title + " contents : " + contents);
		return "redirect:/";
	}
}
