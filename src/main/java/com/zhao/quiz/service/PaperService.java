package com.zhao.quiz.service;

import com.zhao.quiz.domain.Paper;
import com.zhao.quiz.domain.Question;
import com.zhao.quiz.domain.QuestionPaper;

import java.util.List;

public interface PaperService {
    //显示所有试卷
    List<Paper> getAll();
    //添加一份试卷
    void addPaper(Paper paper);
    //更具id查询试卷
    Paper getPaperById(Integer id);
    //修改试卷信息
    void editPaper(Paper paper);
    //删除指定id试卷
    void deletePaperById(Integer id);
    //查询不是班主任得试卷
    List<Paper> queryPaperNotAdvisor();
    //查询所有试卷中已存在所有问题id
    List<Question> queryALlQuestionId();
    //根据paperid查询所有试题
    List<QuestionPaper> paperQueryALlQuestionById(Integer id);
    //查询所有paperid对用的试题
    List<Question> queryALlQuestionIdInPaperById(Integer paperId);
    //根据id查询时间名字
    Paper queryPaperNameById(Integer id);
    //添加试题到试卷通过试题id
    void AddQuestionToPaperById(QuestionPaper questionPaper);
    //从试卷移除试题
    void detachQuestionById(Integer qpId);
    //统计试卷
    int queryCountALlPaps();
    //根据paperid查询所有试题按照类型排序
    List<QuestionPaper> paperQueryALlQuestionByIdOrderByType(Integer id);
}
