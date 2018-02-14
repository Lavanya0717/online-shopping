package com.niit.bokayflorist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Dao.SupplierDao;
import com.Model.Supplier;

public class SupplierController {

	
	@Autowired
	Supplier supplier;
	@Autowired
	SupplierDao supplierDao;
	
	
	@RequestMapping("/supplierManage")
	public String supplierManage(Model m) {
		List<Supplier> list=supplierDao.getAllSupplier();
		m.addAttribute("supList",list);
		return "supplierManage";
	}
	@RequestMapping("/addSupplier")
	public String addSupplier(@RequestParam String name) {
		supplier.setSid(0);
		supplier.setSupplierName(name);
		supplierDao.addSupplier(supplier);
		return "redirect:supplierManage";
	}
	
	@RequestMapping("/updateSupplier")
	public String updateSupplier(@RequestParam int id,@RequestParam String name) {
		supplier.setSid(id);
		supplier.setSupplierName(name);
		supplierDao.updateSupplier(supplier);
		return "redirect:supplierManage";
	}
	@RequestMapping("/deleteSupplier")
	public String deleteSupplier(@RequestParam int id) {
		Supplier supplier2=supplierDao.getSupplierById(id);
		supplierDao.deleteSupplier(supplier2);
		return "redirect:supplierManage";
	}
}

