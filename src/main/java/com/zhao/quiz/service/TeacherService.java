package com.zhao.quiz.service;

import com.zhao.quiz.domain.Teacher;
import org.springframework.stereotype.Service;

import java.util.List;

public interface TeacherService {
    //显示所有教师
    List<Teacher> getAll();
    //添加一位教师
    void addTeacher(Teacher teacher);
    //更具id查询教师
    Teacher getTeacherById(Integer id);
    //修改教师信息
    void editTeacher(Teacher teacher);
    //删除指定id教师
    void deleteTeacherById(Integer id);
    //查询不是班主任得教师
    List<Teacher> queryTeacherNotAdvisor();
    //登录验证
    Teacher check(Teacher teacher);
    //统计总教师数
    int queryCountAll();
}
