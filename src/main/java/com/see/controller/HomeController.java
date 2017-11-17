package com.see.controller;




import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.see.entity.Account;
import com.see.entity.Follow;
import com.see.entity.Liked;
import com.see.entity.Weibo;
import com.see.service.AccountService;
import com.see.service.WeiboService;

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
		
		Account account = accountService.findById(aid);
		
		model.addAttribute("account", account);
		
		List<Weibo> weibo = weiboService.findTop();
		
		model.addAttribute("weibo", weibo);
		
		}
		return "index";
	}
	
	
	@RequestMapping(value="/fabu",method=RequestMethod.POST)
	public String fabu(HttpSession session,Weibo weibo) throws ParseException {
		int aid = ((Account)session.getAttribute("account")).getAid();
		
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date now=dateFormat.parse(dateFormat.format(new Date()));
		java.sql.Date time=new java.sql.Date(now.getTime());
	
		weibo.setLastUpdateTime(time);
		weibo.setAid(aid);
		weibo.setLiked(0);
		weibo.setComment(0);
		
		weiboService.insert(weibo);
		
		return "redirect:/";
	}	
	
	@RequestMapping(value="/like/{wid}")
	public @ResponseBody int update(@PathVariable("wid") int wid,Model model,HttpSession session) {
		
		Weibo weibo=weiboService.findByWid(wid);
		
		int aid = ((Account)session.getAttribute("account")).getAid();
		
		String s=weiboService.findLiked(aid, weibo.getWid());
		
		if(s.equals("null")) {
			
			weibo.setLiked(weibo.getLiked()+1);
			
			Liked liked=new Liked();
			liked.setAid(aid);
			liked.setWid(weibo.getWid());
			weiboService.likedinsert(liked);
			
		}else {
		
			weibo.setLiked(weibo.getLiked()-1);
			
			weiboService.likeddelete(aid);
		}
		
		return weiboService.update(weibo);
	}
	
	
	@RequestMapping(value="/follow/{aid}")
	public @ResponseBody String follow(@PathVariable("aid") int aid,Model model,HttpSession session) {
		
		
		int useraid = ((Account)session.getAttribute("account")).getAid();
		
		String s=weiboService.findFollow(useraid, aid);
		
		if(s.equals("null")) {
			Follow follow=new Follow();
			follow.setAid(useraid);
			follow.setFollowAid(aid);
			weiboService.followinsert(follow);
		}else {
			weiboService.followdelete(aid);
		}
		
		return "redirect:/";
	}
		
}
