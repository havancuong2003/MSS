package dal;

import model.Account;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

public class Main {
    public static void main(String[] args) throws SQLException {
        AccountDBContext a  =new AccountDBContext();
        a.insertAccount("ed","a","a","2345676242","haa@gmail.com",3,1);
    }
}
