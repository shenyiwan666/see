package com.see.controller;


import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.see.entity.Account;
import com.see.service.AccountService;
import com.see.vo.Page;

@Controller
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value="/account/{aid}",method=RequestMethod.GET)
	public String findAccount(@PathVariable("aid") int aid,Model model,HttpSession session)
	{
		Account account=accountService.findById(aid);
		System.out.println(aid);
		System.out.println(account);
		model.addAttribute("account", account);
		
		return "/account/index" ;
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
	@RequestMapping(value="/account/updatenickName/{aid}", method=RequestMethod.POST)
	public String updatenickName(@PathVariable("aid") int aid,Account account,HttpSession session)
	{
		
		accountService.updatenickName(account);
		System.out.println(account);
		return "redirect:/account/{aid}";
	}
	@RequestMapping(value="/account/updateemail/{aid}", method=RequestMethod.POST)
	public String updateemail(@PathVariable("aid") int aid,Account account,HttpSession session)
	{
		
		accountService.updateemail(account);
		System.out.println(account);
		return "redirect:/account/{aid}";
	}
	@RequestMapping(value="/account/updatepassword/{aid}", method=RequestMethod.POST)
	public String updatepassword(@PathVariable("aid") int aid,Account account,HttpSession session)
	{
		
		accountService.updatepassword(account);
		System.out.println(account);
		return "redirect:/account/{aid}";
	}
	@RequestMapping(value="/account/updatepic/{aid}", method=RequestMethod.POST)
	public String updatepic(@PathVariable("aid") int aid,Account account,HttpSession session,HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException
	{
		account=accountService.findById(aid);
		String path = request.getServletContext().getRealPath("/resources/image");
		System.out.println(path);
		
		System.out.println(file);
		File target = new File(path);
		
		String pic = UUID.randomUUID().toString() + file.getOriginalFilename();
		file.transferTo(new File(target, pic ));
		
		account.setPic(pic);
	    accountService.updatepic(account);
	    System.out.println("pic**********************pic");
		System.out.println(account);
		return "redirect:/account/{aid}";
	}
   
}
