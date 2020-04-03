package com.zhao.quiz.controller;

import com.zhao.quiz.domain.*;
import com.zhao.quiz.service.ClasseService;
import com.zhao.quiz.service.PaperService;
import com.zhao.quiz.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/record")
public class RecordController {
    @Autowired
    RecordService recordService;
    @Autowired
    PaperService paperService;
    @Autowired
    ClasseService classeService;

    //获取所有记录
    @RequestMapping("/getAllRecord")
    public String getAllRecord(Model model){
        List<Record> records=recordService.queryAll();
        model.addAttribute("records",records);
        return "record/RecordList";
    }
    //删除记录
    @RequestMapping("/deleteRecore/{id}")
    public String deleteRecore(@PathVariable ("id") Integer id){
        recordService.deleteById(id);
        return "redirect:/record/getAllRecord";
    }
    //根据记录id获取试卷详情
    @RequestMapping("/toShowExamHist/{id}")
    public String toShowExamHist(@PathVariable ("id")Integer id,Model model){
        //通过记录id查找试卷和答题记录
        Integer papid=recordService.queryByRecordId(id);
        String answers=recordService.queryAnsByRecordId(id);
        //原始试卷
        List<QuestionPaper> questionPapers = paperService.paperQueryALlQuestionByIdOrderByType(papid);
        //提交过的答案
        List<String> ans = Arrays.asList(answers.split(","));
        model.addAttribute("questionPapers",questionPapers);
        model.addAttribute("ans",ans);
        //2020-1-26-20:40
        return "record/showExamHist";
    }

    //显示所有班级记录
    @RequestMapping("/showClaAcc")
    public String showClaAcc(Model model){
        //查询所有测试名称
        List<Record> records=recordService.queryAllExam();
        List<ClaAcc> claAccRes=new ArrayList<>();
        //按照测试名称查询所有班级
        for(Record rec:records){
            //通过记录对应考试paperid查找总分***
            int paperid=rec.getPaperId();
            int toscore=recordService.queryToscore(paperid);
            //记录考试名
            String exaName=rec.getRecordName();
            List<Classe> clas=recordService.queryAllClass(exaName);
            //初始化所有人和及格人数
            int allScore=0;
            int accScore=0;
            for(Classe cla:clas){
                int claId=cla.getClasseId();
                //班级信息
                Classe claName=classeService.queryClaNameById(claId);
                RecordExam recordExam=new RecordExam();
                recordExam.setClaId(claId);
                recordExam.setExaName(exaName);
                double setToscore=toscore*0.6;
                recordExam.setToscore(setToscore);
                //对应每一个班级,查询考试人数和及格人数
                allScore=recordService.queryAllScore(recordExam);
                //及格人数默认>60***
                accScore=recordService.queryAccScore(recordExam);
                double accre=(double)accScore/allScore;
                //四舍五入保留2位
                double acc = (double) Math.round(accre * 100) / 100;

                ClaAcc claAcc=new ClaAcc();
                claAcc.setExamName(exaName);
                claAcc.setClaName(claName.getClasseName());
                claAcc.setToscPer(allScore);
                claAcc.setAcscPer(accScore);
                claAcc.setAcc(acc);
                //每个对象添加到list
                claAccRes.add(claAcc);
            }
        }
        model.addAttribute("claAccRes",claAccRes);
        return "record/claAcc";
    }
}
