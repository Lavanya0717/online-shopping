package com.niit.bokayflorist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Dao.CategoryDAO;
import com.Dao.ProductDAO;

@Controller
public class ProductController {
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping("/products/{cid}")
	public ModelAndView viewProductsByCat(@PathVariable int cid)
	{	ModelAndView m=new ModelAndView("viewProductByCategory");
		m.addObject("products",categoryDAO.getCategoryById(cid));
		return m;
	}
	
	@RequestMapping("/productDetails/{id}")
	public ModelAndView productDetails(@PathVariable int id)
	{	ModelAndView m=new ModelAndView("productDetails");
		m.addObject("product",productDAO.getProduct(id));
		return m;
	}
}

