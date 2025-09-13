package com.system.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.system.model.UserAccount;
import com.system.repository.UserRepo;
import java.util.List;


@Controller
public class SettingsController {
    @Autowired
    public UserRepo userRepo;

    @GetMapping("/settings")
    public String settings(Model m) {
        List<UserAccount> users = userRepo.findAll();
        System.out.println("Users found: " + users.size());
        m.addAttribute("users", users);  
        return "settings";
    }

   
    @GetMapping("/settings/{id}")
    public String editUser(@PathVariable Integer id, Model m) {
        UserAccount user = userRepo.findById(id).orElseThrow();
        m.addAttribute("user", user);  // <-- single "user"
        List<UserAccount> users = userRepo.findAll();
        m.addAttribute("users", users); // <-- keep table also working
        return "settings";
    }

   
    @PostMapping("/settings")
    public String updateUser(@ModelAttribute UserAccount userAccount) {
        userRepo.save(userAccount);
        return "redirect:/settings";
    }
}
