package model;

public class Exercise_Constructor {
    private int exercise_id;
    private int basicQuestion;
    private int lowQuestion;
    private int highQuestion;

    public Exercise_Constructor(int exercise_id, int basicQuestion, int lowQuestion, int highQuestion) {
        this.exercise_id = exercise_id;
        this.basicQuestion = basicQuestion;
        this.lowQuestion = lowQuestion;
        this.highQuestion = highQuestion;
    }

    public Exercise_Constructor() {
    }

    public int getExercise_id() {
        return exercise_id;
    }

    public void setExercise_id(int exercise_id) {
        this.exercise_id = exercise_id;
    }

    public int getBasicQuestion() {
        return basicQuestion;
    }

    public void setBasicQuestion(int basicQuestion) {
        this.basicQuestion = basicQuestion;
    }

    public int getLowQuestion() {
        return lowQuestion;
    }

    public void setLowQuestion(int lowQuestion) {
        this.lowQuestion = lowQuestion;
    }

    public int getHighQuestion() {
        return highQuestion;
    }

    public void setHighQuestion(int highQuestion) {
        this.highQuestion = highQuestion;
    }
}
