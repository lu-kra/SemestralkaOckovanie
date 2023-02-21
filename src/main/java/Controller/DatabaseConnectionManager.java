package Controller;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DatabaseConnectionManager {

    public static Connection getConnection() throws NamingException, SQLException {
        DataSource ds;
        Context initContext;
        Connection con = null;

        initContext = new InitialContext();
        Context envContext = (Context) initContext.lookup("java:/comp/env");
        ds = (DataSource) envContext.lookup("mvcpool");

        con = ds.getConnection();

        return con;
    }

}
