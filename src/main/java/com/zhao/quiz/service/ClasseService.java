package com.zhao.quiz.service;

import com.zhao.quiz.domain.Classe;

import java.util.List;

public interface ClasseService {
    //显示所有班级
    List<Classe> getAll();
    //添加一位班级
    void addClasse(Classe classe);
    //更具id查询班级
    Classe getClasseById(Integer id);
    //修改班级信息
    void editClasse(Classe classe);
    //删除指定id班级
    void deleteClasseById(Integer id);
    //根据教师id查找班级是否存在
    Classe queryByTeacherId(Integer id);
    //查询class表中所有对应教师
    List<Classe> queryAllTeacherId();
    //根据id查询班级名称
    Classe queryClaNameById(int claId);
}
