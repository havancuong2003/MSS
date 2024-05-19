package dal;

import model.Account;

import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException {
        AccountDBContext a = new AccountDBContext();
        Account b =a.get(1);
        System.out.println(b.getUsername());
    }
}
