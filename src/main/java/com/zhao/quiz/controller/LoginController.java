package com.zhao.quiz.controller;

import com.zhao.quiz.domain.*;
import com.zhao.quiz.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private PaperService paperService;
    @Autowired
    private ClasseService classeService;
    @Autowired
    private RecordService recordService;
    @RequestMapping("/")
    public String view(Model model){
        //查询所有用户
        int teas=teacherService.queryCountAll();
        int stus=studentService.queryCOuntALlstu();
        int alllogers=teas+stus;
        //统计试题
        int allQues=questionService.queryCountAllQues();
        //统计试卷
        int allPaps=paperService.queryCountALlPaps();
        model.addAttribute("allPaps",allPaps);
        model.addAttribute("allQues",allQues);
        model.addAttribute("alllogers",alllogers);
        return "stage/prexam";
    }
    //后台切换到前台登录
    @RequestMapping("/foreLogin")
    public String foreLogin(){
        return "stage/login";
    }
    //前台切换到后台登录
    @RequestMapping("/backLogin")
    public String backLogin(){
        return "stage/loginx";
    }

    //后台教师登录验证
    @ResponseBody
    @RequestMapping("/backLogin/check")
    public Object backCheck(Teacher teacher, HttpServletRequest request){
        AjaxResult result=new AjaxResult();
        HttpSession session=request.getSession();
        Teacher teac=teacherService.check(teacher);
        if(teac!=null){
            session.setAttribute("logerd",teac);
            result.setSuccess(true);
        }else {
            result.setSuccess(false);
        }
        return result;
    }

    @RequestMapping("/index")
    public String index(Model model){
        //查询所有用户
        int teas=teacherService.queryCountAll();
        int stus=studentService.queryCOuntALlstu();
        int alllogers=teas+stus;
        //统计试题
        int allQues=questionService.queryCountAllQues();
        //统计试卷
        int allPaps=paperService.queryCountALlPaps();
        List<Record> ScoreHStu=recordService.queryRankScoreRecord();
        List<Record> AccHStu=recordService.queryRankAccRecord();
        model.addAttribute("ScoreHStu",ScoreHStu);
        model.addAttribute("AccHStu",AccHStu);
        model.addAttribute("allPaps",allPaps);
        model.addAttribute("allQues",allQues);
        model.addAttribute("alllogers",alllogers);
        return "index";
    }

    //前台学生登录考试
    @ResponseBody
    @RequestMapping("/foreCheck/check")
    public Object foreCheck(Student student, HttpServletRequest request){
        AjaxResult result=new AjaxResult();
        HttpSession session=request.getSession();
        Student stud=studentService.check(student);
        if(stud!=null){
            session.setAttribute("loger",stud);
            result.setSuccess(true);
        }else {
            result.setSuccess(false);
        }
        return result;
    }
    //前台登录到展示页面
    @RequestMapping("/indexprexam")
    public String indexprexam(){
        return "stage/prexamed";
    }

    //退出系统
    @RequestMapping(value = {"*/logout","/logout","teacher/logout"})
    public String logout(HttpSession session) {
        //session里可能不止存放一个数据，移除麻烦，所以让其失效跟直接
        session.invalidate();
        return "redirect:/";
    }

    //学生注册
    //去添加页面
    @RequestMapping("/prexam/toAddStudent")
    public String toAddStudent(Model model){
        List<Classe> allClasees = classeService.getAll();
        model.addAttribute("allClasees",allClasees);
        return "stage/studentAdd";
    }
    //添加具体操作
    @RequestMapping("/prexam/AddStudent")
    public String AddStudent(Student student){
        studentService.AddStudent(student);
        return "redirect:/foreLogin";
    }
    @RequestMapping("/zhao")
    public String zhao(){
        return "stage/zhao";
    }
}
