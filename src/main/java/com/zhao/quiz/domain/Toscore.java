package com.zhao.quiz.domain;

/**
 * @Auther: swung
 * @Date: 2020/2/9 10:15
 * @Description:
 */
public class Toscore {
    private int toscoreId;
    private int paperId;
    private int toscore;

    public Toscore(int paperId, int toscore) {
        this.paperId = paperId;
        this.toscore = toscore;
    }

    public Toscore() {
    }

    public int getToscoreId() {
        return toscoreId;
    }

    public void setToscoreId(int toscoreId) {
        this.toscoreId = toscoreId;
    }

    public int getPaperId() {
        return paperId;
    }

    public void setPaperId(int paperId) {
        this.paperId = paperId;
    }

    public int getToscore() {
        return toscore;
    }

    public void setToscore(int toscore) {
        this.toscore = toscore;
    }
}
