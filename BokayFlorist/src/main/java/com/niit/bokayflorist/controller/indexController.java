package com.niit.bokayflorist.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class indexController {

	@RequestMapping("/")
	public String index(){
		return "index";
	}
	
	@RequestMapping("/aboutUs")
	public String aboutUs(){
		return "aboutUs";
	}
	
	
	@RequestMapping("error")
	public String Error(){
		return "error";
	}
}
	
	
	
	
	

	

