package com.zhao.quiz.mapper;

import com.zhao.quiz.domain.Classe;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ClasseMapper {
    List<Classe> queryAll();

    void addClasse(Classe classe);

    Classe queryClasseById(Integer id);

    void editClasse(Classe classe);

    void deleteClasseById(Integer id);

    Classe queryByTeacherId(Integer id);

    List<Classe> queryAllTeacherId();

    Classe queryClaNameById(int claId);
}
