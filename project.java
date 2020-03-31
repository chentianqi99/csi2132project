package project.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import java.sql.ResultSet;



public class ProjectDao {
	private static String url =  "jdbc:postgresql://web0.site.uottawa.ca:15432/zyin043";
	private static String username ="zyin043";
	private static String password = "Qa.65627281";
	private Connection db;
	private Statement statement;
	private String sql;
	private ResultSet resultset;
	
	public ProjectDao() {
		try {
			db = DriverManager.getConnection(url, username, password);
		}catch(SQLException e) {
			e.printStackTrace();
			return;
		}
	}
	public void Printguestsinfo() {
		try {
			statement = db.createStatement();
			sql = "SELECT g_name,p_type,p_price,signingDate,b_name,typeOfPayment,paymentStatus FROM project.guests_info,project.property_info,project.agreement,project.branch_info,project.payment ORDER BY typeOfPayment ASC, signingDate DESC";
			resultset = statement.executeQuery(sql);
			while(resultset.next()) {
				System.out.println(resultset.getString(1)+"");
				System.out.println(resultset.getString(2)+"");
				System.out.println(resultset.getDouble(3)+"");
				System.out.println(resultset.getDate(4) +"");
				System.out.println(resultset.getString(5)+"");
				System.out.println(resultset.getString(6)+"");
				System.out.println(resultset.getString(7)+"");
				System.out.println();
			}
		
		
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	public void closeDB() {
		try {
			if(statement != null) {
				statement.close();
			}if(resultset != null) {
				statement.close();
			}if(db != null) {
				db.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
