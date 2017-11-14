package com.see.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.see.service.AccountService;
import com.see.vo.Page;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String search(String q, @RequestParam(defaultValue="1") int p, Model model) {
		
		
		Page page = accountService.search(q, p);
		model.addAttribute("page", page);
		
		//request.getRequestDispatcher("/WEB-INF/views/account/index.jsp")
		return "account/index";
	}
	
	@RequestMapping(value="/delete/{aid}")
	public String delete(@PathVariable("aid") int aid) {
		
		try {
			
			accountService.delete(aid);
			
			return "redirect:/account/";
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}
		
	}

}
