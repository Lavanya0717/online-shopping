package com.niit.bokayflorist.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Dao.CategoryDAO;
import com.Dao.ProductDAO;
import com.Dao.SupplierDao;
import com.Model.Category;
import com.Model.Product;
import com.Model.Supplier;

@Controller
public class AdminController {
	@Autowired
	Category category;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	Supplier supplier;

	@Autowired
	SupplierDao supplierDAO;
		
	@Autowired
	ProductDAO productDAO;
	
	

	@RequestMapping("/admin/home")
	public String Home(){
		return "home";
	}
	
	@RequestMapping("/admin/adminAdding")
	public ModelAndView addDetailsAdmin(@ModelAttribute("product") Product product){
		ModelAndView m= new ModelAndView("adminAdding");
		List<Supplier> supList=supplierDAO.getAllSupplier();
		m.addObject("supList",supList);
		List<Category> catList=categoryDAO.getAllCategory();
		m.addObject("catList",catList);
		return m;
	}
	
	@RequestMapping("/admin/viewDetailsAdmin")
	public ModelAndView viewDetailsAdmin(){
		ModelAndView m=new ModelAndView("viewDetailsAdmin");
		List<Supplier> supList=supplierDAO.getAllSupplier();
		m.addObject("supList",supList);
		List<Category> catList=categoryDAO.getAllCategory();
		m.addObject("catList",catList);
		List<Product> proList=productDAO.getAllProduct();
		m.addObject("proList",proList);
		return m;
	}

	
	@RequestMapping("/admin/addCategory")
	public String addCategory(@RequestParam String name) {
		category.setCid(0);
		category.setCategoryName(name);
		categoryDAO.addCategory(category);
		return "redirect:viewDetailsAdmin";
	}
	
	@RequestMapping("/admin/updateCategory")
	public String updateCategory(@RequestParam int id,@RequestParam String name) {
		category.setCid(id);
		category.setCategoryName(name);
		categoryDAO.updateCategory(category);
		return "redirect:viewDetailsAdmin";
	}
	
	@RequestMapping("/admin/deleteCategory")
	public ModelAndView deleteCategory(@RequestParam int id) {
		ModelAndView m = new ModelAndView("redirect:viewDetailsAdmin");
		Category category2 = categoryDAO.getCategoryById(id);
		try {
			categoryDAO.deleteCategory(category2);
		} catch (Exception e) {
			m.addObject("warning", "Remove the associated product first!!!");
			m.setViewName("viewDetailsAdmin");
		}
		return m;
	}
	
	@RequestMapping("/admin/addSupplier")
	public String addSupplier(@RequestParam String name) {
		supplier.setSid(0);
		supplier.setSupplierName(name);
		supplierDAO.addSupplier(supplier);
		return "redirect:viewDetailsAdmin";
	}
	
	@RequestMapping("/admin/updateSupplier")
	public String updateSupplier(@RequestParam int id,@RequestParam String name) {
		supplier.setSid(id);
		supplier.setSupplierName(name);
		supplierDAO.updateSupplier(supplier);
		return "redirect:viewDetailsAdmin";
	}
	
	@RequestMapping("/admin/deleteSupplier")
	public ModelAndView deleteSupplier(@RequestParam int id) {
		ModelAndView m = new ModelAndView("redirect:viewDetailsAdmin");
		Supplier supplier2 = supplierDAO.getSupplierById(id);
		try {
			supplierDAO.deleteSupplier(supplier2);
		} catch (Exception e) {
			m.addObject("warning", "Remove the associated product first!!!");
			m.setViewName("viewDetailsAdmin");
		}
		return m;
	}
	
	@RequestMapping(value="/admin/addProduct",method=RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") Product product,HttpSession session)
	{	
		ModelAndView m=new ModelAndView("redirect:viewDetailsAdmin");
		MultipartFile image=product.getProImage();
		String imgpath=session.getServletContext().getRealPath("/resources/images/");
		String file_info=imgpath+image.getOriginalFilename()+".jpg";
		if (!image.isEmpty()) {
			File f = new File(file_info);
			try {
				byte buff[] = image.getBytes();
				BufferedOutputStream bs = new BufferedOutputStream(new FileOutputStream(f));
				bs.write(buff);
				bs.close();
				product.setImageName(image.getOriginalFilename());
				productDAO.insertOrUpdateProduct(product);
			} catch (Exception e) {
				System.out.println("Exception");
			}
		} else {
			productDAO.insertOrUpdateProduct(product);

		}
		return m;
	}
	
	
	@RequestMapping("/admin/deleteProduct")
	public ModelAndView deleteProduct(@RequestParam("proId") int proId) {
		ModelAndView m = new ModelAndView("redirect:viewDetailsAdmin");
		Product product = productDAO.getProduct(proId);
		try {
			productDAO.deleteProduct(product);
		} catch (Exception e) {
			m.addObject("warning", "You cannot delete this product!!!");
			m.setViewName("viewDetailsAdmin");
		}
		return m;
	}
	
	
	@RequestMapping("/admin/updateProduct")
	public ModelAndView updateProduct(@RequestParam("proId") int proId){
		ModelAndView m= new ModelAndView("updateProduct");
		Product product=productDAO.getProduct(proId);
		List<Supplier> supList=supplierDAO.getAllSupplier();
		m.addObject("supList",supList);
		List<Category> catList=categoryDAO.getAllCategory();
		m.addObject("catList",catList);
		m.addObject("product",product);
		return m;
	}
	
}


