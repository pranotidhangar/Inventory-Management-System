package com.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.system.model.Orders;
import com.system.model.Product;
import com.system.repository.OrderRepo;
import com.system.repository.ProductRepo;

@Controller
public class HomeController {
	@Autowired
	public ProductRepo prepo;
	
	@Autowired
	public OrderRepo orepo;
	
	@GetMapping("/")
	public String home(Model m) {
		    long totalProducts = prepo.count();
	        long totalOrders = orepo.count();
	        long lowStock = prepo.countByStatus("Low Stock");
	        long outOfStock = prepo.countByStatus("Out of Stock");
	       
	        m.addAttribute("totalProducts", totalProducts);
	        m.addAttribute("totalOrders", totalOrders);
	        m.addAttribute("lowStock", lowStock);
	        m.addAttribute("outOfStock", outOfStock);
		List<Product> product = prepo.findAll();
		m.addAttribute("product", product);
		List<Orders> order = orepo.findAll();
		m.addAttribute("order",order);
		return "home";
	}

		
}
