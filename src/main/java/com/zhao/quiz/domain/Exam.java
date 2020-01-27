package com.zhao.quiz.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;
@Data
public class Exam {
    private int examId;
    private int paperId;
    private Date examBegin;
    private Date examEnd;
    private Paper paper;
}
