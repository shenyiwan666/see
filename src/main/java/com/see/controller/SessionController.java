package com.see.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register() {
		return "register";
	}
	

	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String register(Account account, HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {
	
			String path = request.getServletContext().getRealPath("/resources/image");
			System.out.println(path);
			
			System.out.println(file);
			File target = new File(path);
			
			String pic = UUID.randomUUID().toString() + file.getOriginalFilename();
			file.transferTo(new File(target, pic ));
			
			account.setPic(pic);
			
			System.out.println(account);
			accountService.insert(account);
		
			
			return "redirect:/login";
	
		
		
		
	}
	

}
