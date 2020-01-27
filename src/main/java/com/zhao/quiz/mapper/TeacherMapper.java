package com.zhao.quiz.mapper;

import com.zhao.quiz.domain.Teacher;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface TeacherMapper {
    List<Teacher> queryAll();

    void addTeacher(Teacher teacher);

    Teacher queryTeacherById(Integer id);

    void editTeacher(Teacher teacher);

    void deleteTeacherById(Integer id);

    List<Teacher> queryTeacherNotAdvisor();

    Teacher check(Teacher teacher);
    @Select("select count(*) from teacher")
    int queryCountAll();
}
