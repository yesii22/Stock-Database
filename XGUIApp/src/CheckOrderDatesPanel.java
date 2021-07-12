import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.sql.*;
import java.text.*;
import java.util.*;
import java.util.Date;

public class CheckOrderDatesPanel extends JPanel{

    public CheckOrderDatesPanel(Connection conn) {
        super(new GridBagLayout());
        this.conn = conn;
        setBackground(Color.decode("#93C6D6"));
        createPanel();
        setVisible(true);
    }

    private void createPanel() {
        gbc.gridx = 0;
        gbc.gridy = 0;
        add(labelMonth, gbc);

        gbc.gridx = 1;
        String[] months = new DateFormatSymbols().getMonths();
        comboBoxMonth = new JComboBox<>(months);
        add(comboBoxMonth, gbc);
        comboBoxMonth.setSelectedIndex(0);

        gbc.gridx = 2;
        add(labelYear, gbc);

        gbc.gridx = 3;
        Integer[] years = {2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021};
        comboBoxYear = new JComboBox<>(years);
        add(comboBoxYear, gbc);
        comboBoxYear.setSelectedIndex(8);

        buttonExecute.addActionListener(e -> {
            try {
                actionPerformed(e);
            } catch (ParseException parseException) {
                parseException.printStackTrace();
            }
        });
        gbc.gridx = 1;
        gbc.gridy = 2;
        gbc.gridwidth = 3;
        add(buttonExecute, gbc);

        gbc.anchor = GridBagConstraints.NORTHEAST;
        buttonHelp.addActionListener(e -> makeEditor());
        add(buttonHelp, gbc);
    }

    private void makeEditor() {
        editorPane.setEditable(false);
        editorPane.setContentType("text/html");
        editorPane.setText("<h1>The &quot;Check Date Orders&quot; Option</h1>\n" +
                "\n" +
                "<h3>Given the selected month &amp; year&nbsp;(i.e. June 2020), it will list information of orders placed in the date and also info of&nbsp;users that placed them.</h3>\n" +
                "\n" +
                "<p>This utilizes a stored procedure named <em>CheckDateOrders</em> on mydb, this is parametrized by month and year Strings.</p>\n" +
                "\n" +
                "<blockquote>\n" +
                "<p>CALL CHECKDATEORDERS(YOURSELECTEDMONTH, YOURSELECTEDYEAR);</p>\n" +
                "</blockquote>\n" +
                "\n" +
                "<ul>\n" +
                "\t<li>Due to 77 entries in MadeOrder table&nbsp;and 144 possible selections of month &amp; year, it may not be possible to get results often for input</li>\n" +
                "\t<li>However, due to nature of entries, input of year 2020&nbsp;has most chance of returning results</li>\n" +
                "</ul>\n" +
                "\n" +
                "<p>Under-the-hood of&nbsp;the <em>CheckDateOrders</em>&nbsp;procedure:</p>\n" +
                "\n" +
                "<blockquote>\n" +
                "<p>DELIMITER //</p>\n" +
                "\n" +
                "<p>CREATE PROCEDURE CheckDateOrders(<br />\n" +
                "&nbsp;&nbsp; &nbsp;IN xMonth VARCHAR(2),<br />\n" +
                "&nbsp; &nbsp; IN xYear VARCHAR(4)<br />\n" +
                ")</p>\n" +
                "\n" +
                "<p>BEGIN<br />\n" +
                "&nbsp;&nbsp; &nbsp;SELECT MADEORDER.OrderDate AS &quot;PurchaseDate&quot;,<br />\n" +
                "&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;USER.UserFullName AS &quot;StockOwner&quot;,<br />\n" +
                "&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;USER.UserID,<br />\n" +
                "&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;STOCK.StockSymbol,&nbsp;<br />\n" +
                "&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;STOCK.StockName,<br />\n" +
                "&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;MADEORDER.OrderedQuantity<br />\n" +
                "&nbsp;&nbsp; &nbsp;FROM USER<br />\n" +
                "&nbsp;&nbsp; &nbsp;JOIN MADEORDER ON (USER.UserID = MADEORDER.OrdererUserID)<br />\n" +
                "&nbsp;&nbsp; &nbsp;JOIN STOCK ON (STOCK.StockSymbol = MADEORDER.OrderedStockSymbol)<br />\n" +
                "&nbsp;&nbsp; &nbsp;WHERE MADEORDER.OrderDate LIKE CONCAT(xYear, &#39;-&#39;, 0, xMonth, &#39;-&#39;, &#39;%&#39;);<br />\n" +
                "END//</p>\n" +
                "\n" +
                "<p>DELIMITER ;</p>\n" +
                "</blockquote>\n");

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

    private void actionPerformed(ActionEvent e) throws ParseException {
        String monthName = (String) comboBoxMonth.getSelectedItem();
        Date date = new SimpleDateFormat("MMMM", Locale.ENGLISH).parse(monthName);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);

        int month = cal.get(Calendar.MONTH);
        int year = (int) comboBoxYear.getSelectedItem();

        try {
            CallableStatement stmt = conn.prepareCall(query);
            stmt.setString(1, String.valueOf(month + 1));
            stmt.setString(2, String.valueOf(year));
            ResultSet rs = stmt.executeQuery();
            tablesResults = new JTable(buildTable(rs, (ResultSetMetaData) rs.getMetaData()));
            if(tablesResults.getModel().getRowCount() != 0)
                JOptionPane.showMessageDialog(null, new JScrollPane(tablesResults));
            else
                JOptionPane.showMessageDialog(null, "No orders found for this date.");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private Connection conn;
    private final GridBagConstraints gbc = new GridBagConstraints();
    private JEditorPane editorPane = new JEditorPane();
    private final JLabel labelMonth = new JLabel("Month: ");
    private JComboBox<String> comboBoxMonth;
    private final JLabel labelYear = new JLabel("Year: ");
    private JComboBox<Integer> comboBoxYear;
    private final JButton buttonExecute = new JButton("Execute");
    private String query = "{CALL CheckDateOrders(?, ?)}";
    private JTable tablesResults;
    private final JButton buttonHelp = new JButton("Help");
}