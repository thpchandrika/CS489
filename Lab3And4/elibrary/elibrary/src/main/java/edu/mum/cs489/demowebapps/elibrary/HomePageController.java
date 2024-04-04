package edu.mum.cs489.demowebapps.elibrary;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageController {

    @GetMapping(value = {"/", "/elibrary", "/elibrary/home"})
    public String displayHomePage(){
        return "home/index";
    }
}
