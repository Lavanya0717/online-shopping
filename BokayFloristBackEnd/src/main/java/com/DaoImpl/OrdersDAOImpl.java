package com.DaoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Dao.OrdersDAO;
import com.Model.Orders;
import com.Model.ShippingAddress;

@Repository("ordersDAO")
public class OrdersDAOImpl implements OrdersDAO {
	@Autowired
	SessionFactory sessionFactory;

	public OrdersDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public void insertOrders(Orders orders)
	{
		Session session=sessionFactory.getCurrentSession();
		session.save(orders);
	}
		
	public List<Orders> getOrdersByUser(String username)
	{
		Session session=sessionFactory.openSession();
		List<Orders> list=session.createQuery("from Orders where orderUserDetails.username=:username").setParameter("username", username).list();
		session.close();
		return list;
	}


	@Transactional
	public void insertShippingAddress(ShippingAddress address) {
		Session session=sessionFactory.getCurrentSession();
		session.save(address);
	}
	
}