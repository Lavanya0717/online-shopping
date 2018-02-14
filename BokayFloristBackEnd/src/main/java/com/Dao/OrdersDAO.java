package com.Dao;

import java.util.List;

import com.Model.Orders;
import com.Model.ShippingAddress;

public interface OrdersDAO {
	public void insertOrders(Orders orders);
	public void insertShippingAddress(ShippingAddress address);
	public List<Orders> getOrdersByUser(String username);
}
