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
public class HomeController {
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		
		if(session.getAttribute("account") != null){
		
		int aid = ((Account)session.getAttribute("account")).getAid();
		
		Account account = accountService.getAccount( aid );
		
		model.addAttribute("account", account);}
		return "index";
	}

}
