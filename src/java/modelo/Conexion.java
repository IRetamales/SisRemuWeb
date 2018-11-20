package modelo;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Kraken
 */
public final class Conexion {
    public Connection conn;
    private Statement statement;
    public static Conexion db;
    private String strError;
    
    private Conexion() {
        String url= "jdbc:mysql://localhost:3306/";
        String dbName = "sisremu";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "mysql";
        /*String url= "jdbc:mysql://localhost:3307/";
        String dbName = "sisremu";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "root";*/
        try {
            
            Class.forName(driver).newInstance();
            this.conn = (Connection)DriverManager.getConnection(url+dbName,userName,password);
        }
        catch (Exception sqle) {
            strError = sqle.toString();
            sqle.printStackTrace();
        }
    }

    public String getStrError() {
        return strError;
    }

    /**
     *
     * @return MysqlConnect Database connection object
     */
    public static synchronized Conexion getDbCon() {
        if ( db == null ) {
            db = new Conexion();
        }
        return db;
    }
   
    /**
     *
     * @param query String The query to be executed
     * @return a ResultSet object containing the results or null if not available
     * @throws SQLException
     */
    public ResultSet query(String query) throws SQLException{
        statement = db.conn.createStatement();
        ResultSet res = statement.executeQuery(query);
        return res;
    }
    /**
     * @desc Method to insert data to a table
     * @param insertQuery String The Insert query
     * @return boolean
     * @throws SQLException
     */
    public int insert(String insertQuery) throws SQLException {
        statement = db.conn.createStatement();
        int result = statement.executeUpdate(insertQuery);
        return result;
 
    }
 
}

/*public class Conexion {
    private String USERNAME = "root";
    private String PASSWORD = "mysql";
    private String HOST = "localhost";
    private String PORT = "3306";
    private String DATABASE = "sisremu";
    private String CLASSNAME = "com.mysql.jdbc.Driver";
    private String URL = "jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE;
    private Statement statement;
    private Connection con;
    private String error;
    
    public Conexion(){
        try{
            Class.forName(CLASSNAME);
            con=DriverManager.getConnection(URL,USERNAME,PASSWORD);
            statement = con.createStatement();
        }catch(ClassNotFoundException e){
            System.err.println("Error: " + e);
        }catch(SQLException e){
            System.err.println("Error: " + e);
        }
    }
    
    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
    public Connection getConexion(){
        return con;
    }
    
    public static void main(String[] args){
           Conexion con = new Conexion();
    }
    
    public ResultSet query(String query) throws SQLException{
        ResultSet res = statement.executeQuery(query);
        return res;
    }
    
    public int insert(String insertQuery) throws SQLException {
        int result = statement.executeUpdate(insertQuery);
        return result;
    }
}
*/