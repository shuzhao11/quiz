package com.zhao.quiz.service;

import com.zhao.quiz.domain.PapIdQuesCourse;
import com.zhao.quiz.domain.Question;
import com.zhao.quiz.domain.QuestionPaper;

import java.util.List;
import java.util.Map;

public interface QuestionService {
    //显示所有试题
    List<Question> getAll(Question question);
    //添加一个试题
    void addQuestion(Question question);
    //根据id查询试题
    Question getQuestionById(Integer id);
    //修改试题信息
    void editQuestion(Question question);
    //删除指定id试题
    void deleteQuestionById(Integer id);
    //查找所有试题类型单选多选，判断
    List<Question> queryAllType();
    //查找所有课程
    List<Question> queryAllCourse();
    //查找总题量
    int queryAllQuestionNums();
    //查询各种科目题有多少
    List<Map> queryNumOfQuestionType();
    //根据试卷id和课程查找尚未对应分配试题
    List<Question> queryAllQueIdNotInPaperById(PapIdQuesCourse papIdQuesCourse);
    //批量增加
    int AddAllQues(List<QuestionPaper> questionPapers);
    //批量删除
    int queryIdByPapQue(Integer[] ques);
    //统计所有试题个数
    int queryCountAllQues();
}
