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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.see.entity.Account;
import com.see.entity.Follow;
import com.see.entity.Liked;
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
	
		/****   Account account = accountService.findById(aid);   *****/
		
		/***********修改***************/
		List<Weibo> weibos =accountService.findAll(aid);
		/***********修改***************/
		
		model.addAttribute("weibos", weibos);/***********修改***************/
		
		List<Weibo> weibo = weiboService.findTop();
		
			for(int i=0;i<10;i++) {
				int topuser=weibo.get(i).getAccount().getAid();
				
				if(weiboService.findFollow(aid, topuser).equals("null")) {
					weibo.get(i).getAccount().setFollow("关注");
				}else {
					weibo.get(i).getAccount().setFollow("已关注");
				}
			}
			
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
		

		int useraid=((Account)session.getAttribute("account")).getAid();
		
		String s=weiboService.findLiked(useraid,weibo.getWid());
		
		if(s.equals("null")) {
			
			weibo.setLiked(weibo.getLiked()+1);
			
			Liked liked=new Liked();
			liked.setAid(useraid);
			liked.setWid(weibo.getWid());
			weiboService.likedinsert(liked);
			
		}else {
		
			weibo.setLiked(weibo.getLiked()-1);
			
			weiboService.likeddelete(useraid);
		}
		
		return weiboService.update(weibo);
	}
	
	
	@RequestMapping(value="/follow/{aid}")
	public @ResponseBody int follow(@PathVariable("aid") int aid,Model model,HttpSession session) {
		
		int useraid = ((Account)session.getAttribute("account")).getAid();
		
		
		
		String s=weiboService.findFollow(useraid, aid);
		
		if(s.equals("null")) {
			Follow follow=new Follow();
			follow.setAid(useraid);
			follow.setFollowAid(aid);
			weiboService.followinsert(follow);
			return 1;
		}else {
			weiboService.followdelete(aid);
			return 0;
		}
	
	}
	
	
	@RequestMapping(value="/search",method=RequestMethod.GET)
	public String search(String q, @RequestParam(defaultValue="1") int p, Model model) {
		
		Page page = accountService.search(q, p);
		model.addAttribute("page", page);
		
		//request.getRequestDispatcher("/WEB-INF/views/account/index.jsp")
		return "/search";
	}
		
}
