package com.zhao.quiz.service;

import com.zhao.quiz.domain.Record;

import java.util.List;

public interface RecordService {
    //增加记录
    void addRecord(Record record);
    //查询记录
    List<Record> queryAll();
    //删除
    void deleteById(Integer id);
    //通过记录id查询对应试卷
    List<Record> queryAllExamById(Integer id);
    //查询记录通过id
    Integer queryByRecordId(Integer id);
    //查询答案
    String queryAnsByRecordId(Integer id);
    //查询分数排名
    List<Record> queryRankScoreRecord();
    //查询正确率排名
    List<Record> queryRankAccRecord();
}
