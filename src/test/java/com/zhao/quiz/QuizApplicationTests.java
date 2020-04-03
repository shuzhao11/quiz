package com.zhao.quiz;

import com.zhao.quiz.domain.Paper;
import com.zhao.quiz.domain.Question;
import com.zhao.quiz.domain.QuestionPaper;
import com.zhao.quiz.domain.RecordExam;
import com.zhao.quiz.mapper.PaperMapper;
import com.zhao.quiz.mapper.QuestionMapper;
import com.zhao.quiz.service.RecordService;
import org.apache.tomcat.util.buf.StringUtils;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@MapperScan("com.zhao.quiz.mapper")
@SpringBootTest
class QuizApplicationTests {
    @Autowired
    private PaperMapper paperMapper;
    @Autowired
    private QuestionMapper questionMapper;
    @Autowired
    private RecordService recordService;

    @Test
    void contextLoads() {
    }
    @Test
    public void test1(){
        List<QuestionPaper> questionPapers = paperMapper.paperQueryALlQuestionById(1);
        System.out.println(questionPapers);
    }

    @Test
    public void test2(){
//        List<QuestionCount> questionCounts = questionMapper.queryNumOfQuestionType();
        List<Map> maps = questionMapper.queryNumOfQuestionType();

//        Map<Integer, String> integerStringMap = questionMapper.queryNumOfQuestionType();
//        System.out.println(integerStringMap);
        System.out.println(maps);
    }
    @Test
    public void test3(){
        System.out.println("+++++++++++++++++++++++++++++++++");
                 System.out.println("List转字符串");
                 List<String> list1 = new ArrayList<String>();
                list1.add("1");
                 list1.add("2");
                list1.add("3");
                 String ss = String.join(",", list1);
                 System.out.println(ss);
                 System.out.println("+++++++++++++++++++++++++++++++++");
                System.out.println("字符串转List");
                 List<String> listString = Arrays.asList(ss.split(","));
                 for (String string : listString) {
                         System.out.println(string);
                    }
                System.out.println("+++++++++++++++++++++++++++++++++");

    }
    @Test
    public void test4(){
        RecordExam recordExam=new RecordExam();
        recordExam.setClaId(1);
        recordExam.setExaName("java综合测试");
        System.out.println(recordExam);
        int i = recordService.queryAllScore(recordExam);
        System.out.println(i);
    }

}
