package com.system.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.system.model.Inventory;

@Repository
public interface InventoryRepo extends JpaRepository<Inventory, Integer>{
	Page<Inventory> findByProductNameContainingIgnoreCase(String keyword, Pageable pageable);
	

	List<Inventory> findByCategoryIgnoreCase(String category);
	Page<Inventory> findAll(Pageable pageable);
	Page<Inventory> findByCategoryIgnoreCase(String category, Pageable pageable);

}
