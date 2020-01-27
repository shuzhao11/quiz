package com.zhao.quiz.domain;

import lombok.*;

@Data
public class Teacher {
    private int teacherId;
    private String teacherName;
    private String teacherAccount;
    private String teacherEmail;
    private String teacherPwd;
    private int power;
}
