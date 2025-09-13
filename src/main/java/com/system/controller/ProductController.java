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

import com.system.model.Product;
import com.system.repository.OrderRepo;
import com.system.repository.ProductRepo;

@Controller
public class ProductController {
	
	@Autowired
	public ProductRepo prepo;
	
	@Autowired
	public OrderRepo orepo;
	
	@GetMapping("/product")
	public String product(
	        @RequestParam(value = "page", defaultValue = "0") int page,
	        @RequestParam(value = "category", required = false) String category,
	        Model model) {

	    int pageSize = 5; // number of products per page
	    Page<Product> productPage;

	   
	    if(category != null && !category.isEmpty()) {
	        productPage = prepo.findByCategoryIgnoreCase(category, PageRequest.of(page, pageSize));
	    } else {
	        productPage = prepo.findAll(PageRequest.of(page, pageSize));
	       
	    }
	    int totalPages = productPage.getTotalPages();
	    if (totalPages == 0) {
	        totalPages = 1;
	    }
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("product", productPage.getContent());
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", productPage.getTotalPages());
	    
	    model.addAttribute("selectedCategory", category);

	    return "product";
	}

	
	@PostMapping("/addProduct")
	public String addProduct(@ModelAttribute Product p, RedirectAttributes redirectAttributes) {
		System.out.println("Id: " + p.getProductId());
		System.out.println("Product Name: " + p.getProductName());
		System.out.println("SKU: " + p.getSku());
		System.out.println("Category: " + p.getCategory());
		System.out.println("Status: " + p.getStatus());
		System.out.println("Stock: " + p.getStock());
		System.out.println("Price:" + p.getPrice());
		prepo.save(p);

		redirectAttributes.addFlashAttribute("msg", "Product Added Successfully!");
		return "redirect:/";
	}

	@GetMapping("/edit/{id}")
	public String showEditPage(@PathVariable("id") int id, Model m) {
		Product ob = prepo.findById(id).orElseThrow(() -> new RuntimeException("Product not found"));
		m.addAttribute("ob", ob);
		return "editProduct";
	}

	@PostMapping("/edit/{id}")
	public String updateProduct(@PathVariable("id") int id, @ModelAttribute Product updateProduct,
			RedirectAttributes redirectAttributes) {
		prepo.findById(id).map(product -> {
			product.setProductName(updateProduct.getProductName());
			product.setSku(updateProduct.getSku());
			product.setCategory(updateProduct.getCategory());
			product.setPrice(updateProduct.getPrice());
			product.setStock(updateProduct.getStock());
			product.setStatus(updateProduct.getStatus());
			prepo.save(product);
			return product;
		}).orElseThrow(() -> new RuntimeException("Product not found"));

		redirectAttributes.addFlashAttribute("msg", "Product Updated Successfully!");
		return "redirect:/product";
	}

	@PostMapping("/delete/{id}")
	public String deleteProduct(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
		prepo.findById(id).ifPresent(product -> prepo.delete(product));
		redirectAttributes.addFlashAttribute("msg", "Product Deleted Successfully!");
		return "redirect:/product";
	}
	
	@GetMapping("/product/search")
	public String searchProduct(@RequestParam("keyword") String keyword, Model m,RedirectAttributes redirectAttributes) {
		 List<Product> products = prepo.findByproductNameContainingIgnoreCase(keyword);
		    if (products.isEmpty()) {
		        redirectAttributes.addFlashAttribute("msg", "Product Not Found!");
		        return "redirect:/product"; 
		    }
		    m.addAttribute("product", products);
		    return "product";
		
	}

}
