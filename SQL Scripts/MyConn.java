import java.sql.*;

public class MyConn
{
    public static void main (String[] args)
    {
        System.out.println("\n\n***** MySQL JDBC Testing *****");
        Connection conn = null;
        try
        {
            Class.forName ("com.mysql.cj.jdbc.Driver").newInstance ();
            String userName = "root";
            String password = "1234";
            String url = "jdbc:MySQL://localhost/sakila";        
            conn = DriverManager.getConnection(url,userName,password); //conn = DriverManager.getConnection(url,args[0],args[1]);
            System.out.println ("\nDatabase Connection Established...");
            Statement stmt=conn.createStatement();  
            //ResultSet rs=stmt.executeQuery("select * from city where city like \"A%\" "); 
            ResultSet rs=stmt.executeQuery("SELECT actor.last_name as Last_name, actor.first_name as"+
            " First_name FROM actor"+
            " where last_name like (\'Mc%\')"+
            " ORDER BY last_name desc");

            while(rs.next())  
                System.out.println(rs.getString(1)+","+rs.getString(2));
                //System.out.println(rs.getInt(1)+"|| "+rs.getString(2)+"|| "+rs.getString(3)+"|| "+ rs.getString(4)); 
            conn.close();  
        }
        catch (Exception ex)
        {
            System.err.println ("Cannot connect to database server");
            ex.printStackTrace();
        }
    }
}
