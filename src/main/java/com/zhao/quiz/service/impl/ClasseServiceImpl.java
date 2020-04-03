package com.zhao.quiz.service.impl;

import com.zhao.quiz.domain.Classe;
import com.zhao.quiz.mapper.ClasseMapper;
import com.zhao.quiz.service.ClasseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class ClasseServiceImpl implements ClasseService {
    @Autowired
    private ClasseMapper classeMapper;

    @Override
    public List<Classe> getAll() {
        return classeMapper.queryAll();
    }

    @Override
    public void addClasse(Classe classe) {
        classeMapper.addClasse(classe);
    }

    @Override
    public Classe getClasseById(Integer id) {
        return classeMapper.queryClasseById(id);
    }

    @Override
    public void editClasse(Classe classe) {
        classeMapper.editClasse(classe);
    }

    @Override
    public void deleteClasseById(Integer id) {
        classeMapper.deleteClasseById(id);
    }

    @Override
    public Classe queryByTeacherId(Integer id) {
        return classeMapper.queryByTeacherId(id);
    }

    @Override
    public List<Classe> queryAllTeacherId() {
        return classeMapper.queryAllTeacherId();
    }

    @Override
    public Classe queryClaNameById(int claId) {
        return classeMapper.queryClaNameById(claId);
    }


}
