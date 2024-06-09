package dal;

import model.Account;

import java.sql.SQLException;
import java.util.ArrayList;

public class PracticeDBContext  extends DBContext<Account>{
    @Override
    public ArrayList<Account> list() {
        return null;
    }

    @Override
    public void insert(Account entity) {

    }

    @Override
    public void update(Account entity) {

    }

    @Override
    public void delete(Account entity) {

    }

    @Override
    public Account get(int id) throws SQLException {
        return null;
    }


}
