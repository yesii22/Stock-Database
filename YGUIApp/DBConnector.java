import java.sql.*;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import java.sql.CallableStatement;

public class DBConnector 
{
	public static Connection connectToDB()
	{
		System.out.println("\n\n***** MySQL JDBC Testing *****");
		Connection conn = null;
		try
		{
	        Class.forName ("com.mysql.cj.jdbc.Driver");
	        String userName = "root";
	        String password = "Ringo*2009";
	        String url = "jdbc:mysql://localhost/mydb";     
	        conn = DriverManager.getConnection(url,userName,password);
	        System.out.println ("\nDatabase Connection Established...");
		}
	    catch (Exception ex)
		{
	        System.err.println ("Cannot connect to database server");
	        ex.printStackTrace();
	    }
		
		return conn;
	}
	
	public static ObservableList<ModelTable> getDataList(String username)
	{
		Connection conn = connectToDB();
		ObservableList<ModelTable> list = FXCollections.observableArrayList();
		try 
		{
			CallableStatement cStmt = conn.prepareCall("{call find_user_portfolio(?)}");
	        cStmt.setString(1, username);
	        cStmt.execute();

	        ResultSet myRs = cStmt.getResultSet();
			
			while(myRs.next())
			{
				list.add(new ModelTable(myRs.getString("UserFullName"), myRs.getString("StockSymbol"), myRs.getString("StockName"),  myRs.getString("StockPrice"), Integer.parseInt(myRs.getString("OrderedQuantity")), myRs.getString("OrderDate")));
			}
		}
		catch(Exception e) {}
		
		return list;
	}
}
