package com.zhao.quiz.domain;

import lombok.Data;

/**
 * @Auther: swung
 * @Date: 2020/2/1 13:22
 * @Description:及格率展示
 */
@Data
public class ClaAcc {
    private int clasaccId;
    private String examName;
    private String claName;
    private int toscPer;
    private int acscPer;
    private double acc;

    public ClaAcc(String examName, String claName, int toscPer, int acscPer, double acc) {
        this.examName = examName;
        this.claName = claName;
        this.toscPer = toscPer;
        this.acscPer = acscPer;
        this.acc = acc;
    }

    public ClaAcc() {
    }
}
