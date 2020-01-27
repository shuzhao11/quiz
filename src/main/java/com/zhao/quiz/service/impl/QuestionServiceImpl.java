package com.zhao.quiz.service.impl;

import com.zhao.quiz.domain.PapIdQuesCourse;
import com.zhao.quiz.domain.Question;
import com.zhao.quiz.domain.QuestionPaper;
import com.zhao.quiz.mapper.QuestionMapper;
import com.zhao.quiz.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionMapper questionMapper;

    @Override
    public List<Question> getAll(Question question) {
        return questionMapper.queryAll(question);
    }

    @Override
    public void addQuestion(Question question) {
        questionMapper.addQuestion(question);
    }

    @Override
    public Question getQuestionById(Integer id) {
        return questionMapper.queryQuestionById(id);
    }

    @Override
    public void editQuestion(Question question) {
        questionMapper.editQuestion(question);
    }

    @Override
    public void deleteQuestionById(Integer id) {
        questionMapper.deleteQuestionById(id);
    }

    @Override
    public List<Question> queryAllType() {
        return questionMapper.queryAllType();
    }

    @Override
    public List<Question> queryAllCourse() {
        return questionMapper.queryAllCourse();
    }

    @Override
    public int queryAllQuestionNums() {
        return questionMapper.queryAllQuestionNums();
    }

    @Override
    public List<Map> queryNumOfQuestionType() {
        return questionMapper.queryNumOfQuestionType();
    }

    @Override
    public List<Question> queryAllQueIdNotInPaperById(PapIdQuesCourse papIdQuesCourse) {
        return questionMapper.queryAllQueIdNotInPaperById(papIdQuesCourse);
    }

    @Override
    public int AddAllQues(List<QuestionPaper> questionPapers) {
        int nums=questionMapper.AddAllQues(questionPapers);
        return nums;
    }

    @Override
    public int queryIdByPapQue(Integer[] ques) {
        return questionMapper.queryIdByPapQue(ques);
    }

    @Override
    public int queryCountAllQues() {
        return questionMapper.queryCountAllQues();
    }

}
