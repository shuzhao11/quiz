package com.zhao.quiz.domain;

import lombok.*;

import java.util.Date;

@Data
public class Student {
    private int studentId;
    private String studentName;
    private String studentAccount;
    private String studentGender;
    private String studentEmail;
    private String studentPwd;
    private int classeId;
    private Classe classe;

    public Student(int studentId, String studentName, String studentAccount, String studentGender, String studentEmail, String studentPwd, int classId, Classe classe) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.studentAccount = studentAccount;
        this.studentGender = studentGender;
        this.studentEmail = studentEmail;
        this.studentPwd = studentPwd;
        this.classeId = classId;
        this.classe = classe;
    }

    public Student() {
    }

    public Student(String studentAccount, String studentPwd) {
        this.studentAccount = studentAccount;
        this.studentPwd = studentPwd;
    }
}
