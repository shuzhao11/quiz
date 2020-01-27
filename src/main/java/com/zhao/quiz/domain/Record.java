package com.zhao.quiz.domain;

import lombok.Data;

@Data
public class Record {
    private int recordId;
    private String recordName;
    private int studentId;
    private int paperId;
    private String recordAnswer;
    private Double recordAcc;
    private int recordScore;
    private Student student;
}
