package com.zhao.quiz.controller;

import com.zhao.quiz.domain.Classe;
import com.zhao.quiz.domain.Teacher;
import com.zhao.quiz.service.ClasseService;
import com.zhao.quiz.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

@Controller
@RequestMapping("/classe")
public class ClasseController {
    @Autowired
    private ClasseService classeService;
    @Autowired
    private TeacherService teacherService;
//查看所有班级
    @RequestMapping("/getAllClasse")
    public String getAllClasse(Model model){
        List<Classe> classes = classeService.getAll();
        model.addAttribute("classes",classes);
        return "classe/classeList";
    }

//班级添加或者修改操作，先去添加页面
    @RequestMapping("/toAddClasse")
    public String toAddClasse(Model model){
        List<Teacher> teachers=teacherService.queryTeacherNotAdvisor();
        model.addAttribute("teachers",teachers);
        return "classe/classeAdd";
    }

//添加具体操作
    @RequestMapping("/addClasse")
    public String addClasse(Classe classe){
        classeService.addClasse(classe);
        return "redirect:/classe/getAllClasse";
    }

//班级去修改页面
    @RequestMapping("/toEditClasse/{id}")
    public String toEditClasse(@PathVariable("id") Integer id,Model model){
        //根据id查询班级
        Classe classe=classeService.getClasseById(id);
        //过去班级的班主任，回显
        int teacherIdd=classe.getTeacherId();
        Teacher teacherold=teacherService.getTeacherById(teacherIdd);
        //查询可分配班主任得教师
        List<Teacher> teachers=teacherService.queryTeacherNotAdvisor();
        teachers.add(teacherold);
        model.addAttribute("teachers",teachers);
        model.addAttribute("classe",classe);
        return "classe/classeEdit";
    }

//修改具体操作
    @RequestMapping("/EditClasse")
    public String EditClasse(Classe classe){
        classeService.editClasse(classe);
        return "redirect:/classe/getAllClasse";
    }

//班级删除
    @RequestMapping("/deleteClasse/{id}")
    public String deleteClasseById(@PathVariable("id") Integer id){
        classeService.deleteClasseById(id);
        return "redirect:/classe/getAllClasse";
    }

}
