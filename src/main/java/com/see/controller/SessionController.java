package com.see.controller;

import java.awt.Font;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import javax.swing.UIManager;
import javax.swing.plaf.FontUIResource;

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
			UIManager.put("OptionPane.buttonFont", new FontUIResource(new Font("微软雅黑", Font.BOLD, 13)));
			UIManager.put("OptionPane.messageFont", new FontUIResource(new Font("微软雅黑", Font.BOLD, 13)));
			JOptionPane.showMessageDialog(null, "账号或密码错误！", "登陆失败", JOptionPane.WARNING_MESSAGE); 
			return "login";
		}
		
	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register() {
		return "register";
	}
	

	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String register(Account account, HttpServletRequest request,HttpServletResponse response, MultipartFile file) throws IllegalStateException, IOException {
	
			String path = request.getServletContext().getRealPath("/resources/image");
			System.out.println(path);
			
			System.out.println(file);
			File target = new File(path);
			
			String pic = UUID.randomUUID().toString() + file.getOriginalFilename();
			file.transferTo(new File(target, pic ));
			
			account.setPic(pic);
		
			int result= accountService.insert(account);	
			
			if(result == 1) {
				return "redirect:/login";
			}else {
				UIManager.put("OptionPane.buttonFont", new FontUIResource(new Font("微软雅黑", Font.BOLD, 13)));
				UIManager.put("OptionPane.messageFont", new FontUIResource(new Font("微软雅黑", Font.BOLD, 13)));
				JOptionPane.showMessageDialog(null, "邮箱或昵称已被注册！", "注册失败", JOptionPane.WARNING_MESSAGE); 
				return  "redirect:/register";
			}	
	}
	
}
