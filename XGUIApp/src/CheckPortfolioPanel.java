import javax.swing.*;
import javax.swing.table.*;
import java.awt.*;
import java.sql.*;
import java.sql.CallableStatement;
import java.util.*;

public class CheckPortfolioPanel extends JPanel{

    public CheckPortfolioPanel(Connection conn) {
        super(new GridBagLayout());
        this.conn = conn;
        setBackground(Color.decode("#82AEB1"));
        createPanel();
        setVisible(true);
    }

    private void createPanel() {
        gbc.gridx = 0;
        gbc.gridy = 0;
        add(labelFullName, gbc);

        gbc.gridx = 1;
        add(fieldFullName, gbc);

        buttonExecute.addActionListener(e -> {
            String input = fieldFullName.getText();
            input = input.replaceAll("\\s+", " ");
            input = input.trim();

            try {
                CallableStatement stmt = conn.prepareCall(query);
                stmt.setString(1, input);
                ResultSet rs = stmt.executeQuery();
                tablesResults = new JTable(buildTable(rs, (ResultSetMetaData) rs.getMetaData()));
                if(tablesResults.getModel().getRowCount() != 0)
                    JOptionPane.showMessageDialog(null, new JScrollPane(tablesResults));
                else
                    JOptionPane.showMessageDialog(null, "Not portfolio found for this user name.");
                fieldFullName.setText("");
                fieldFullName.requestFocus();
            }
            catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        });
        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.gridwidth = 2;
        add(buttonExecute, gbc);

        gbc.anchor = GridBagConstraints.NORTHEAST;
        buttonHelp.addActionListener(e -> makeEditor());
        add(buttonHelp, gbc);
    }

    private void makeEditor() {
        editorPane.setEditable(false);
        editorPane.setContentType("text/html");
        editorPane.setText("<h1>The &quot;Check Portfolio&quot; Option</h1>\n" +
                "\n" +
                "<h3>Given a user&#39;s full name (i.e.&nbsp;Ann Gaither), it will list all the stocks &amp; quanties thereof owned by the particular user.</h3>\n" +
                "\n" +
                "<p>This utilizes a stored procedure named <em>CheckPortfolio</em> on mydb, this is parametrized by an&nbsp;user&#39;s full name.</p>\n" +
                "\n" +
                "<blockquote>\n" +
                "<p>CALL CHECKPORTFOLIO(YOURINPUTNAME);</p>\n" +
                "</blockquote>\n" +
                "\n" +
                "<ol>\n" +
                "\t<li>Not case-sensitive, hence&nbsp;<strong>&quot;aNn gaiTheR&quot;&nbsp;</strong>is valid working input.</li>\n" +
                "\t<li>Not whitespace-sensitive, hence&nbsp;<strong>&quot; Ann &nbsp; Gaither &nbsp;&nbsp;&quot;&nbsp;</strong>is also valid working input</li>\n" +
                "</ol>\n" +
                "\n" +
                "<p>Under-the-hood of&nbsp;the <em>CheckPortfolio</em> procedure:</p>\n" +
                "\n" +
                "<blockquote>\n" +
                "<p>DELIMITER //</p>\n" +
                "\n" +
                "<p>CREATE PROCEDURE CheckPortfolio(<br />\n" +
                "&nbsp;&nbsp; &nbsp;IN userXFullName VARCHAR(90)<br />\n" +
                ")</p>\n" +
                "\n" +
                "<p>BEGIN<br />\n" +
                "&nbsp;&nbsp; &nbsp;SELECT USER.UserFullName,&nbsp;<br />\n" +
                "&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;STOCK.StockSymbol,&nbsp;<br />\n" +
                "&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;STOCK.StockName,&nbsp;<br />\n" +
                "&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;STOCK.StockPrice,&nbsp;<br />\n" +
                "&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SUM(MADEORDER.OrderedQuantity) AS &quot;QuantityOwned&quot;<br />\n" +
                "&nbsp;&nbsp; &nbsp;FROM USER<br />\n" +
                "&nbsp;&nbsp; &nbsp;JOIN MADEORDER ON (USER.UserID = MADEORDER.OrdererUserID)<br />\n" +
                "&nbsp;&nbsp; &nbsp;JOIN STOCK ON (STOCK.StockSymbol = MADEORDER.OrderedStockSymbol)<br />\n" +
                "&nbsp;&nbsp; &nbsp;WHERE userXFullName LIKE USER.UserFullName<br />\n" +
                "&nbsp;&nbsp; &nbsp;GROUP BY STOCK.StockSymbol, USER.UserFullName, STOCK.StockSymbol, STOCK.StockName, STOCK.StockPrice;<br />\n" +
                "END//</p>\n" +
                "\n" +
                "<p>DELIMITER ;</p>\n" +
                "</blockquote><p>Here&#39;s some inputs you can use:</p>\n" +
                "\n" +
                "<pre>\n" +
                "Aaron Scales\n" +
                "Amy Kim\n" +
                "Ann Gaither\n" +
                "Bran Ybarra\n" +
                "Darlene Brey\n" +
                "David Lopez\n" +
                "Edgar Hayes\n" +
                "Edward Smith\n" +
                "James Carter\n" +
                "James Rose\n" +
                "Jennifer Fogle\n" +
                "Linda Lewis\n" +
                "Maya Klotz\n" +
                "Rachel Smith\n" +
                "Raymond Martinez\n" +
                "Reggie Gorman\n" +
                "Robert Hinton\n" +
                "Ryan Hannan\n" +
                "So Escobedo\n" +
                "William Newsome</pre>\n" +
                "\n" +
                "\n" +
                "<p>&nbsp;</p>");

        editorPane.setCaretPosition(0);
        JScrollPane scrollEditorPane = new JScrollPane(editorPane);
        scrollEditorPane.setPreferredSize(new Dimension(720, 405));
        JOptionPane.showMessageDialog(null, scrollEditorPane);
    }

    public static DefaultTableModel buildTable(ResultSet rs, ResultSetMetaData rsms) throws SQLException {
        Vector<String> columnNames = new Vector<>();
        Vector<Vector<Object>> allData = new Vector<>();

        for (int column = 1; column <= rsms.getColumnCount(); column++)
            columnNames.add(rsms.getColumnName(column));

        while (rs.next()) {
            Vector<Object> rowData = new Vector<>();
            for (int columnIndex = 1; columnIndex <= rsms.getColumnCount(); columnIndex++)
                rowData.add(rs.getObject(columnIndex));
            allData.add(rowData);
        }
        return new DefaultTableModel(allData, columnNames);
    }


    private Connection conn;
    private final GridBagConstraints gbc = new GridBagConstraints();
    private JEditorPane editorPane = new JEditorPane();
    private final JLabel labelFullName = new JLabel("Full Name: ");
    private final JTextField fieldFullName = new JTextField(30);
    private final JButton buttonExecute = new JButton("Execute");
    private String query = "{CALL CheckPortfolio(?)}";
    private JTable tablesResults;
    private final JButton buttonHelp = new JButton("Help");
}