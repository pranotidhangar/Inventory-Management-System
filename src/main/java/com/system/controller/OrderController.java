package com.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.system.model.Orders;
import com.system.model.Product;
import com.system.repository.OrderRepo;
import com.system.repository.ProductRepo;

@Controller
public class OrderController {
	@Autowired
	public OrderRepo orepo;
	
	@Autowired
	public ProductRepo prepo;
	
	
	@GetMapping("/order")
	public String order(
	        @RequestParam(defaultValue = "0") int page,
	        @RequestParam(defaultValue = "5") int size,
	        Model model) {

	    PageRequest pageable = PageRequest.of(page, size);
	    Page<Orders> orderPage = orepo.findAll(pageable);

	    model.addAttribute("order", orderPage.getContent());
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", orderPage.getTotalPages());

	    return "orders";
	}

	@PostMapping("/addOrder")
	public String addOrder(@ModelAttribute Orders o, RedirectAttributes redirectAttributes) {
		Product product = prepo.findByproductName(o.getOrderedProduct());
	    
	    if (product != null) {
	        int actualTotal = product.getPrice() * o.getItems();
	        o.setTotal(actualTotal);
	    } else {
	        o.setTotal(0); 
	    }
		System.out.println(o);
		orepo.save(o);
		redirectAttributes.addFlashAttribute("msg", "Order Added Successfully!");
		return "redirect:/order";
	}
	
	@PostMapping("deleteOrder/{id}")
	public String deleteOrder(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
		orepo.findById(id).ifPresent(order->orepo.delete(order));
		redirectAttributes.addFlashAttribute("msg","Order Deleted Successfully!");
		return "redirect:/";
	}
	@GetMapping("/order/search")
	public String searchOrder(
	        @RequestParam("keyword") int id,
	        Model m,
	        RedirectAttributes redirectAttributes) {

	    List<Orders> orders = orepo.findByorderId(id);

	    if (orders.isEmpty()) {
	        redirectAttributes.addFlashAttribute("msg", "Order Not Found!");
	        return "redirect:/order";
	    }

	    m.addAttribute("order", orders);
	    m.addAttribute("currentPage", 0);
	    m.addAttribute("totalPages", 1);

	    return "orders";
	}
}
