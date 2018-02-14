package com.DaoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Dao.CartDAO;
import com.Model.Cart;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {
	@Autowired
	SessionFactory sessionFactory;

	public CartDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	@Transactional
	public void insertOrUpdateCart(Cart cart)
	{
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(cart);
	}
	
	public Cart getCart(int id,String username)
	{
		Session session=sessionFactory.openSession();
		Cart cart=(Cart)session.createQuery("from Cart where cartId=:id and cartUserDetails.username=:username").setParameter("id", id).setParameter("username", username).uniqueResult();
		session.close();
		return cart;
	}
	
	public List<Cart> getCartByUser(String username)
	{
		Session session=sessionFactory.openSession();
		List<Cart> list=session.createQuery("from Cart where cartUserDetails.username=:username").setParameter("username", username).list();
		session.close();
		return list;
	}
	
	@Transactional
	public void deleteCart(int cartId)
	{
		Session session=sessionFactory.getCurrentSession();
		session.delete(session.get(Cart.class, cartId));
	}


	public Cart getCartItemByUser(int id, String username) {
		Session session=sessionFactory.openSession();
		Cart cart=(Cart)session.createQuery("from Cart where cartProductId=:id and cartUserDetails.username=:username").setParameter("id", id).setParameter("username", username).uniqueResult();
		session.close();
		return cart;
	}
	
}