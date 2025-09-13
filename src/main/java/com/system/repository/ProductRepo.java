package com.system.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.system.model.Product;



@Repository
public interface ProductRepo extends JpaRepository<Product, Integer> {
	List<Product> findByproductNameContainingIgnoreCase(String keyword);
	 long countByStatus(String status);
	 
	Product findByproductName(String orderedProduct);
	Page<Product> findAll(Pageable pageable);

    Page<Product> findByCategoryIgnoreCase(String category, Pageable pageable);
}

