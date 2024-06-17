package dal;


import model.*;

import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
        CurriculumDBContext cdb  = new CurriculumDBContext();
        System.out.println(cdb.getCurriculum(1).getTerms().get(4).getCourses().size());

     }



}


