package com.zhao.quiz.service;

import com.zhao.quiz.domain.Exam;
import com.zhao.quiz.domain.Record;

import java.util.List;

public interface ExamService {
    //查看所有用户
    List<Exam> getAll();
    //统计所有考试
    int queryCOuntALlExam();
    //添加考试
    void AddExam(Exam exam);
    //根据id查询考试信息
    Exam getExamById(Integer id);
    //修改考试信息
    void EditExam(Exam exam);
    //删除考试通过id
    void deleteById(Integer id);
    //查询所有考试
    List<Exam> getAllS();
}
