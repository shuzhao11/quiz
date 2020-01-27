package com.zhao.quiz.domain;

import lombok.Data;

import javax.validation.constraints.Null;
import java.util.List;

@Data
public class QuestionPaper {
    private int id;
    private int questionId;
    private int paperId;
    private Question question;
    private Paper paper;

    public QuestionPaper(int id, int questionId, int paperId, Question question, Paper paper) {
        this.id = id;
        this.questionId = questionId;
        this.paperId = paperId;
        this.question = question;
        this.paper = paper;
    }

    public QuestionPaper() {
    }

    public QuestionPaper(int questionId, int paperId) {
        this.questionId = questionId;
        this.paperId = paperId;
    }
}
