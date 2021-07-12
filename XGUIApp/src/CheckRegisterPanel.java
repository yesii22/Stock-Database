import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;
import java.util.Vector;

public class CheckRegisterPanel extends JPanel{

    public CheckRegisterPanel(Connection conn) {
        super(new GridBagLayout());
        this.conn = conn;
        setBackground(Color.decode("#9E8FB2"));
        createPanel();
        setVisible(true);
    }

    private void createPanel() {
        gbc.gridx = 0;
        gbc.gridy = 0;
        add(labelStockSymbol, gbc);

        gbc.gridx = 1;
        add(fieldStockSymbol, gbc);

        buttonExecute.addActionListener(e -> {
            String input = fieldStockSymbol.getText();
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
                    JOptionPane.showMessageDialog(null, "No holders found for this stock symbol.");
                fieldStockSymbol.setText("");
                fieldStockSymbol.requestFocus();
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
        editorPane.setText("<h1>The &quot;Check Register&quot; Option</h1>\n" +
                "\n" +
                "<h3>Given a stock&#39;s symbol&nbsp;(i.e. GE), it will orderly list particular users that are holders of the given stock &amp; how much they own.</h3>\n" +
                "\n" +
                "<p>This utilizes a stored procedure named <em>CheckPortfolio</em> on mydb, this is parametrized by a stock symbol.</p>\n" +
                "\n" +
                "<blockquote>\n" +
                "<p>CALL CHECKREGISTER(YOURINPUTSYMBOL);</p>\n" +
                "</blockquote>\n" +
                "\n" +
                "<ol>\n" +
                "\t<li>Not case-sensitive, hence&nbsp;<strong>&quot;ge&quot;&nbsp;</strong>is valid working input.</li>\n" +
                "\t<li>Not whitespace-sensitive, hence&nbsp;<strong>&quot; GE &nbsp;&nbsp;&quot;&nbsp;</strong>is also valid working input</li>\n" +
                "</ol>\n" +
                "\n" +
                "<p>Under-the-hood of&nbsp;the <em>CheckRegister</em>&nbsp;procedure:</p>\n" +
                "\n" +
                "<blockquote>\n" +
                "<p>DELIMITER //</p>\n" +
                "\n" +
                "<p>CREATE PROCEDURE CheckRegister(<br />\n" +
                "&nbsp;&nbsp; &nbsp;IN stockXSymbol VARCHAR(5)<br />\n" +
                ")</p>\n" +
                "\n" +
                "<p>BEGIN<br />\n" +
                "&nbsp;&nbsp; &nbsp;SELECT&nbsp;<br />\n" +
                "&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;USER.UserID,&nbsp;<br />\n" +
                "&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;USER.UserFullName AS &quot;StockOwner&quot;,&nbsp;<br />\n" +
                "&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;UPPER(MADEORDER.OrderedStockSymbol) AS &quot;XStockOwned&quot;,<br />\n" +
                "&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SUM(MADEORDER.OrderedQuantity) AS &quot;TotalStocksOwned&quot;<br />\n" +
                "&nbsp;&nbsp; &nbsp;FROM MADEORDER<br />\n" +
                "&nbsp;&nbsp; &nbsp;JOIN USER ON (MADEORDER.OrdererUserID = USER.UserID)<br />\n" +
                "&nbsp;&nbsp; &nbsp;JOIN COMPANY ON (MADEORDER.OrderedStockSymbol = COMPANY.CompanyStockSymbol)<br />\n" +
                "&nbsp;&nbsp; &nbsp;WHERE MADEORDER.OrderedStockSymbol = stockXSymbol<br />\n" +
                "&nbsp;&nbsp; &nbsp;GROUP BY MADEORDER.OrdererUserID, USER.UserID<br />\n" +
                "&nbsp;&nbsp; &nbsp;ORDER BY SUM(MADEORDER.OrderedQuantity) DESC;<br />\n" +
                "END//</p>\n" +
                "\n" +
                "<p>DELIMITER ;</p>\n" +
                "</blockquote><p>Here&#39;s some inputs you can use:</p>\n" +
                "\n" +
                "<pre>\n" +
                "APPL\n" +
                "BA\n" +
                "DIS\n" +
                "F\n" +
                "FB\n" +
                "GE\n" +
                "MSFT\n" +
                "NTDOY\n" +
                "SQ\n" +
                "WMT\n" +
                "</pre>\n" +
                "\n" +
                "<p>&nbsp;</p>");

        editorPane.setCaretPosition(0);
        JScrollPane scrollEditorPane = new JScrollPane(editorPane);
        scrollEditorPane.setPreferredSize(new Dimension(720, 405));
        JOptionPane.showMessageDialog(null, scrollEditorPane);
    }

    private static DefaultTableModel buildTable(ResultSet rs, ResultSetMetaData rsms) throws SQLException {
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
    private final JLabel labelStockSymbol = new JLabel("Stock Symbol: ");
    private final JTextField fieldStockSymbol = new JTextField(30);
    private final JButton buttonExecute = new JButton("Execute");
    private String query = "{CALL CheckRegister(?)}";
    private JTable tablesResults;
    private final JButton buttonHelp = new JButton("Help");
}