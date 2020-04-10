package com.zhao.quiz.domain;

import lombok.Data;

/**
 * @Auther: swung
 * @Date: 2020/2/1 11:43
 * @Description:
 */
@Data
public class RecordExam {
    private int ReId;
    private Integer claId;
    private String exaName;
    private Double toscore;

    public RecordExam(Integer claId, String exaName, Double toscore) {
        this.claId = claId;
        this.exaName = exaName;
        this.toscore = toscore;
    }

    public RecordExam() {
    }

    public int getReId() {
        return ReId;
    }

    public void setReId(int reId) {
        ReId = reId;
    }

    public Integer getClaId() {
        return claId;
    }

    public void setClaId(Integer claId) {
        this.claId = claId;
    }

    public String getExaName() {
        return exaName;
    }

    public void setExaName(String exaName) {
        this.exaName = exaName;
    }

    public Double getToscore() {
        return toscore;
    }

    public void setToscore(Double toscore) {
        this.toscore = toscore;
    }
}
