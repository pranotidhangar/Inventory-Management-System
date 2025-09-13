package com.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.system.model.Inventory;
import com.system.repository.InventoryRepo;

@Controller
public class InventoryController {
    @Autowired
    public InventoryRepo irepo;

    @GetMapping("/inventory")
    public String inventory(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            @RequestParam(value = "category", required = false) String category,
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model,
            RedirectAttributes redirectAttributes) {

        Pageable pageable = PageRequest.of(page, size);
        Page<Inventory> inventoryPage;

        if (keyword != null && !keyword.isEmpty()) {
            // Search
            inventoryPage = irepo.findByProductNameContainingIgnoreCase(keyword, pageable);

            if (inventoryPage.isEmpty()) {
                redirectAttributes.addFlashAttribute("msg", "Inventory Not Found!");
                return "redirect:/inventory";
            }
        } else if (category != null && !category.equalsIgnoreCase("All Categories")) {
            // Filter by category
            inventoryPage = irepo.findByCategoryIgnoreCase(category, pageable);
        } else {
            // Default (all)
            inventoryPage = irepo.findAll(pageable);
        }

        model.addAttribute("inventory", inventoryPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", inventoryPage.getTotalPages());
        model.addAttribute("selectedCategory", category);
        model.addAttribute("keyword", keyword);

        return "inventory";
    }
}
