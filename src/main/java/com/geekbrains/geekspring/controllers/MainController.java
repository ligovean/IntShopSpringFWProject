package com.geekbrains.geekspring.controllers;

import com.geekbrains.geekspring.entities.Student;
import com.geekbrains.geekspring.services.StudentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class MainController {
    // https://getbootstrap.com/docs/4.1/getting-started/introduction/csrf

    private StudentsService studentsService;

    @Autowired
    public void setStudentsService(StudentsService studentsService) {
        this.studentsService = studentsService;
    }

    @RequestMapping("/")
    public String showHomePage(Model model) {
        List<Student> allStudents = studentsService.getAllStudentsList();
        model.addAttribute("studentsList", allStudents);
        return "index";
    }
}
