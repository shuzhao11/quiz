package com.zhao.quiz.mapper;

import com.zhao.quiz.domain.Exam;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ExamMapper {
    List<Exam> queryAll();

    Exam check(Exam exam);
    @Select("select count(*) from exam")
    int queryCOuntALlstu();

    void AddExam(Exam exam);

    Exam getExamById(Integer id);

    void EditExam(Exam exam);
    @Delete("delete from exam where exam_id=#{id}")
    void deleteById(Integer id);

    List<Exam> queryAllExamById(Integer id);

    List<Exam> getAllS();
}
