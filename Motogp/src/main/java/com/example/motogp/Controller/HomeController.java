package com.example.motogp.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("")
    public String Home(){
        return "index";
    }

    @GetMapping("/login.html")
    public String Login(){
        return "login";
    }
}
