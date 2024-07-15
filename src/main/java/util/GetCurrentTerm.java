package util;

import dal.SemesterDBContext;

public class GetCurrentTerm {
    public static final SemesterDBContext dao = new SemesterDBContext();

    public static int currentSemester = dao.getCurrentSemester();
}
