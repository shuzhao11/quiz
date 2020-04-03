package com.zhao.quiz.controller;

import com.zhao.quiz.domain.*;
import com.zhao.quiz.service.ExamService;
import com.zhao.quiz.service.PaperService;
import com.zhao.quiz.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/exam")
public class ExamController {
    @Autowired
    private ExamService examService;
    @Autowired
    private PaperService paperService;
    @Autowired
    private RecordService recordService;

    //前台跳转
    @RequestMapping("/toExam")
    public String toExam(Model model){
        List<Exam> Exams = examService.getAll();
        model.addAttribute("Exams",Exams);
        return "exam/examplan";
    }

    @RequestMapping("/toHist/{id}")
    public String toHist(@PathVariable ("id") Integer id,Model model){
        List<Record> records=recordService.queryAllExamById(id);
        model.addAttribute("records",records);
        return "exam/histplan";
    }

    //从其他页面跳转到home
    @RequestMapping("/toHome")
    public String tohome(){
        return "redirect:/indexprexam";
    }

    //来到对应考试页面
    @RequestMapping("/toDoExam/{id}")
    public String toDoExam(@PathVariable ("id") Integer id,Model model,String examId){
        List<QuestionPaper> questionPapers = paperService.paperQueryALlQuestionByIdOrderByType(id);
        int exId=Integer.parseInt(examId);
        Exam examById = examService.getExamById(exId);
        Paper paperName = paperService.queryPaperNameById(examById.getPaperId());
        model.addAttribute("paperName",paperName);
        model.addAttribute("examById",examById);
        model.addAttribute("questionPapers",questionPapers);
        return "exam/doExam";
    }

    //提交试卷
    @RequestMapping("/submitExam")
    public String submitExam(Integer paperId, Integer studentId, HttpServletRequest request){
        List<QuestionPaper> questionPapers = paperService.paperQueryALlQuestionByIdOrderByType(paperId);
        List<String> ans=new ArrayList<>();
        List<String> RightAns=new ArrayList<>();
        for (QuestionPaper qb:questionPapers){
            RightAns.add(qb.getQuestion().getQuestionOpright());
            String parameter="";
            String []parameters;
            if(qb.getQuestion().getQuestionType().equals("y")){
                parameters= request.getParameterValues("optionsSelect" + qb.getQuestionId());
                for(String s:parameters){
                    parameter+=s;
                }
            }else {
                parameter = request.getParameter("optionsSelect" + qb.getQuestionId());
            }
            ans.add(parameter);
        }
        //核对答案得到成绩
        int k=0;    //哨兵
        Double y=0.0;    //正确数
        int score=0;    //得分
        int a=0;        //记录单选题个数
        int b=0;        //记录多选题个数
        int c=0;        //记录判断题个数
        int totalScore=0;
        for (QuestionPaper qb:questionPapers){
            //若为单选题则正确+单选题分数
            if(qb.getQuestion().getQuestionType().equals("x")){
                if(ans.get(k).equals(RightAns.get(k))){
                    score+=qb.getPaper().getScoreSin();
                    y++;
                }
                a++;
                k++;
            }else if(qb.getQuestion().getQuestionType().equals("y")){
                if(ans.get(k).equals(RightAns.get(k))){
                    score+=qb.getPaper().getScoreChe();
                    y++;
                }
                b++;
                k++;
            }else {
                if(ans.get(k).equals(RightAns.get(k))){
                    score+=qb.getPaper().getScoreJug();
                    y++;
                }
                c++;
                k++;
            }
        }
        int scoreSin1 = questionPapers.get(0).getPaper().getScoreSin();
        int scoreChe1 = questionPapers.get(0).getPaper().getScoreChe();
        int scoreJug1 = questionPapers.get(0).getPaper().getScoreJug();
        int bool=recordService.queryBooleanToscore(paperId);
        if (bool==0){
        totalScore=scoreSin1*a+scoreChe1*b+scoreJug1*c; //得到每张试卷总分
        Toscore toscore=new Toscore();
        toscore.setPaperId(paperId);
        toscore.setToscore(totalScore);
        recordService.AddToScore(toscore);
        }
        //保存答题记录
        String answer = String.join(",", ans);
        Paper paper = paperService.queryPaperNameById(paperId);
        String paperName = paper.getPaperName();
        Double recordAcc=y/k;
        int recordScore=score;
        Record record=new Record();
        record.setRecordName(paperName);
        record.setStudentId(studentId);
        record.setPaperId(paperId);
        record.setRecordAnswer(answer);
        record.setRecordAcc(recordAcc);
        record.setRecordScore(recordScore);
        recordService.addRecord(record);
        return "redirect:/exam/toExam";
    }
    /**
     * 考试后台
     * */
    //查看所有考试安排后台
    @RequestMapping("/getAllExam")
    public String getAllExam(Model model){
        List<Exam> Exams = examService.getAllS();
        model.addAttribute("Exams",Exams);
        return "exam/backexamlist";
    }

    //去往考试添加页面
    @RequestMapping("/toAddExam")
    public String toAddExam(Model model){
        List<Paper> papers = paperService.getAll();
        model.addAttribute("papers",papers);
        return "exam/AddExam";
    }
    //添加操作
    @RequestMapping("/addExam")
    public String addExam(Exam exam, String examBegins,String examEnds) throws ParseException {
        String t1 = examBegins.replace("T", " ");
        String t2 = examEnds.replace("T", " ");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date begin = sdf.parse(t1);
        Date end = sdf.parse(t2);
        exam.setExamBegin(begin);
        exam.setExamEnd(end);
        examService.AddExam(exam);
        return "redirect:/exam/getAllExam";
    }
    @RequestMapping("/deleteExam/{id}")
    public String toEditExam(@PathVariable ("id") Integer id,Model model){
        examService.deleteById(id);
        return "redirect:/exam/getAllExam";
    }
}
