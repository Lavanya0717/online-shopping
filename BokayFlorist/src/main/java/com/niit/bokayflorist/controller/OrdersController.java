package com.niit.bokayflorist.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Dao.CartDAO;
import com.Dao.OrdersDAO;
import com.Model.Cart;
import com.Model.Orders;
import com.Model.ShippingAddress;
import com.Model.User;

@Controller
public class OrdersController {
	@Autowired
	CartDAO cartDAO;
	@Autowired
	OrdersDAO ordersDAO;
	@Autowired
	Orders orders;
	
	@RequestMapping("/user/myOrders")
	public ModelAndView myOrders() {
		ModelAndView m = new ModelAndView("orders");
		List<Orders> list=ordersDAO.getOrdersByUser(SecurityContextHolder.getContext().getAuthentication().getName());
		m.addObject("orderList", list);
		return m;
	}
	@RequestMapping("/user/thankYou")
	public ModelAndView thankYou() {
		ModelAndView m = new ModelAndView("ThankYou");
		return m;
	}
	@RequestMapping(value="/user/placeOrder",method=RequestMethod.POST)
	public ModelAndView placeOrder(@RequestParam Map<String,String> data) {
		ModelAndView m = new ModelAndView("redirect:/user/thankYou");
		ShippingAddress shippingAddress=new ShippingAddress();
		shippingAddress.setHouse_locality(data.get("locality"));
		shippingAddress.setCity(data.get("city"));
		shippingAddress.setPincode(Integer.parseInt(data.get("pincode")));
		shippingAddress.setState(data.get("state"));
		ordersDAO.insertShippingAddress(shippingAddress);
		orders.setShippingAddress(shippingAddress);
		User userDetails=new User();
		userDetails.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		orders.setOrderUserDetails(userDetails);
		orders.setOrderId((long)(Math.random()*100000000));
		List<Cart> list=cartDAO.getCartByUser(SecurityContextHolder.getContext().getAuthentication().getName());
		for(Cart c:list){
			orders.setId(0);
			
			orders.setOrderImage(c.getCartImage());
			orders.setOrderPrice(c.getCartPrice()*c.getCartQuantity());
			orders.setOrderQuantity(c.getCartQuantity());
			orders.setOrderProductName(c.getCartProductName());
			orders.setPayMode(data.get("payMode"));
			ordersDAO.insertOrders(orders);
			cartDAO.deleteCart(c.getCartId());
		}
		return m;
	}
}