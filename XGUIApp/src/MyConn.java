import javax.swing.*;
import java.awt.*;
import java.sql.*;

//Extra Credit Option Group G CSC453-01 Fall2020
//Arjaey Bautista, Saad Khan, Yesenia Galindo

public class MyConn {

    public static void main (String[] args) throws SQLException {
        System.out.println("\n\n***** MySQL JDBC Testing *****");
        Connection conn = null;
        try {
            conn = connectionHelper(conn);
            System.out.println ("\nDatabase Connection Established...");
            new AppFrame(conn);
        }
        catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Unable to connect/bad credentials.");
            System.err.println ("Cannot connect to database server");
            ex.printStackTrace();
            System.exit(0);
        }
    }

    public static Connection connectionHelper(Connection conn) throws SQLException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        Class.forName ("com.mysql.cj.jdbc.Driver").newInstance ();

        JTextField url = new JTextField(50);
        url.setText("jdbc:MySQL://localhost/mydb");
        JTextField username = new JTextField(30);
        username.setText("root");
        JPasswordField password = new JPasswordField(30);

        JPanel myPanel = new JPanel(new GridLayout(0,1));

        myPanel.add(new JLabel("SQL URL:"));
        myPanel.add(url);
        myPanel.add(new JLabel("Username:"));
        myPanel.add(username);
        myPanel.add(new JLabel("Password:"));
        myPanel.add(password);

        int result = JOptionPane.showConfirmDialog(null, myPanel, "Please Enter the Credentials", JOptionPane.OK_CANCEL_OPTION);

        if (result == JOptionPane.OK_OPTION)
            return DriverManager.getConnection(url.getText(), username.getText(), password.getText());
        else if (result == JOptionPane.CANCEL_OPTION || result == JOptionPane.CLOSED_OPTION) {
            JOptionPane.showMessageDialog(null, "Why you cancel?");
            System.exit(0);
        }

        return null;
    }
}