package com.Dao;

import java.util.List;

import com.Model.Cart;

public interface CartDAO {
	public void insertOrUpdateCart(Cart cart);
	public Cart getCart(int id,String username);
	public Cart getCartItemByUser(int id,String username);
	public List<Cart> getCartByUser(String username);
	public void deleteCart(int cartId);
}
