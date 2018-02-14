package com.niit.bokayflorist.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Dao.CategoryDAO;
import com.Dao.UserDao;
import com.Model.Category;
import com.Model.User;

@Controller
public class UserController {
	
	@Autowired
	User user;
	@Autowired
	UserDao userDao;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@RequestMapping("/login")
	public String login(@RequestParam(value="id",required=false) String id,Model m) {
		if(id!=null){
		if(id.equals("1"))
			m.addAttribute("msg","Invalid Username or Password");
		else if(id.equals("2"))
			m.addAttribute("msg","You've been logged out");
		else if(id.equals("3"))
			m.addAttribute("msg","Registered Successfully...");
		}
		return "login";
	}
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	@RequestMapping("/addUser")
	public String addUser(@RequestParam Map<String,String> user1,Model m) {
		user.setFull_name(user1.get("full_name"));
		user.setEmail(user1.get("email"));
		user.setMobile(Long.parseLong(user1.get("mobile")));
		user.setAddress(user1.get("address"));
		user.setUsername(user1.get("username"));
		user.setPassword(user1.get("password"));
		user.setEnabled(true);
		user.setRole("ROLE_USER");
		if(userDao.addUserDetails(user))
			return "redirect:login?id=3";
		return "register";
	}
	
	@RequestMapping("/login_success")
	public String perform_login(@RequestParam Map<String,String> user,Model m,HttpSession httpSession) {
			List<Category> catList=categoryDAO.getAllCategory();
			httpSession.setAttribute("categoryList",catList);
			httpSession.setAttribute("loggedIn", true);
			return "redirect:/";
	}
	
}
	
	
	
