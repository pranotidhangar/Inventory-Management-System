package com.system.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.system.model.Orders;



@Repository
public interface OrderRepo extends JpaRepository<Orders, Integer> {
	List<Orders> findByorderId(int id);
	
}
