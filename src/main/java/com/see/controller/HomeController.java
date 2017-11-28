package com.see.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.spi.http.HttpContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public String home(HttpSession session, Model model,@RequestParam(defaultValue="1") int p) {
		
		if(session.getAttribute("account") != null){
			
			int aid = ((Account)session.getAttribute("account")).getAid();
	
			Page page =accountService.findAll(aid,p);
		
			model.addAttribute("page", page);
			
//			List<Weibo> weibos =accountService.findAll(aid);
//			
//			model.addAttribute("weibos", weibos);
			
			List<Weibo> weibo = weiboService.findTop(aid);
	
			model.addAttribute("weibo", weibo);	
			
            Account account = (Account)session.getAttribute("account");
           
			model.addAttribute("account", account);
		}
		
		return "index";
	}
	
	@RequestMapping(value="/fabu",method=RequestMethod.POST)
	public String fabu(HttpSession session,Weibo weibo,HttpServletRequest request, MultipartFile file) throws ParseException, IllegalStateException, IOException {
		int aid = ((Account)session.getAttribute("account")).getAid();
		
		/*******************上传图片********************/
		
		String path = request.getServletContext().getRealPath("/resources/image");
		System.out.println(path);
		
		System.out.println(file);
		File target = new File(path);
		
		String pic = UUID.randomUUID().toString() + file.getOriginalFilename();
		file.transferTo(new File(target, pic ));	
		
		weibo.setImgname(pic);	
		
		/*******************上传图片********************/
	
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
		System.out.println(page);
		
		List<Account> accounts=accountService.searchuser(q);
		System.out.println(accounts);
		model.addAttribute("accounts", accounts);
		
		//request.getRequestDispatcher("/WEB-INF/views/account/index.jsp")
		return "/search";
	}
	@RequestMapping(value="/find/{aid}",method=RequestMethod.GET)
	public String findUsers(@PathVariable("aid") int aid,Model model,HttpSession session)
	{
		Account account=accountService.findById(aid);
		System.out.println(aid);
		System.out.println(account);
		model.addAttribute("account", account);
		return "/find" ;
	}
		
	@RequestMapping(value="/showcomment/{wid}")
	public @ResponseBody List<Comment> comment(@PathVariable("wid") int wid,Model model) {
		
		List<Comment> comment=weiboService.showComment(wid);
	
		return comment;
	}
	
	@RequestMapping(value="/comment/{wid}",method=RequestMethod.POST)
	public @ResponseBody Weibo insercomment(@PathVariable("wid") int wid,HttpSession session,HttpServletRequest request){
		
		int aid = ((Account)session.getAttribute("account")).getAid();
		
		String ccontent=request.getParameter("comment");
		
		Weibo weibo=weiboService.insertComment(wid, aid, ccontent);

		return weibo;

	}	
}
