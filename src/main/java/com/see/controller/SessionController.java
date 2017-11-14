package com.see.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.see.entity.Account;
import com.see.service.AccountService;

@Controller
public class SessionController {
	
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String get() {
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String email, String password, HttpSession session, Model model) {
		
		try {
			Account account = accountService.login(email, password);
			
			session.setAttribute("account", account);
			
			return "redirect:/";
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg",e.getMessage());
			return "login";
		}
		
	}

}
