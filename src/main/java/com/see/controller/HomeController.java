package com.see.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.see.entity.Account;
import com.see.entity.Comment;
import com.see.entity.Weibo;
import com.see.service.AccountService;
import com.see.service.WeiboService;
import com.see.vo.Page;

@Controller
public class HomeController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private WeiboService weiboService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		
		if(session.getAttribute("account") != null){
			
			int aid = ((Account)session.getAttribute("account")).getAid();
	
			List<Weibo> weibos =accountService.findAll(aid);
		
			model.addAttribute("weibos", weibos);
			
			List<Weibo> weibo = weiboService.findTop(aid);
	
			model.addAttribute("weibo", weibo);	
		}
		
		return "index";
	}
	
	@RequestMapping(value="/fabu",method=RequestMethod.POST)
	public String fabu(HttpSession session,Weibo weibo) throws ParseException {
		int aid = ((Account)session.getAttribute("account")).getAid();
		
		weiboService.insert(aid,weibo);
		
		return "redirect:/";
	}	
	
	@RequestMapping(value="/like/{wid}")
	public @ResponseBody int update(@PathVariable("wid") int wid,Model model,HttpSession session) {
		
		int useraid=((Account)session.getAttribute("account")).getAid();
		
		return weiboService.setLiked(useraid, wid);
	}
	
	@RequestMapping(value="/follow/{aid}")
	public @ResponseBody int follow(@PathVariable("aid") int aid,Model model,HttpSession session) {
		
		int useraid = ((Account)session.getAttribute("account")).getAid();
		
		return weiboService.setFollow(useraid, aid);
	}
	
	@RequestMapping(value="/search",method=RequestMethod.GET)
	public String search(String q, @RequestParam(defaultValue="1") int p, Model model,HttpSession session) {
		
		int useraid = ((Account)session.getAttribute("account")).getAid();
		
		Page page = accountService.search(q, p,useraid);
		//System.out.println(page);
		model.addAttribute("page", page);
		
		//request.getRequestDispatcher("/WEB-INF/views/account/index.jsp")
		return "/search";
	}
		
	@RequestMapping(value="/comment/{wid}")
	public String comment(@PathVariable("wid") int wid,Model model) {
		
		List<Comment> comment=weiboService.showComment(wid);
		
		model.addAttribute("comments",comment);
		System.out.println(comment);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/comment/{wid}",method=RequestMethod.POST)
	public String insercomment(@PathVariable("wid") int wid,HttpSession session,Comment comment){
		int aid = ((Account)session.getAttribute("account")).getAid();
		
		weiboService.insertComment(wid, aid, comment);
	
		return "redirect:/";
	}	
}
