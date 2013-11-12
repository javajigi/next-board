package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login")
public class LoginController {
	@RequestMapping("/form")
	public String form() {
		return "login";
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public String login(String userId, String password, HttpSession session) {
		session.setAttribute("userId", userId);
		return "redirect:/";
	}
}
