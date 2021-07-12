import javax.swing.*;
import java.awt.*;
import java.sql.*;

public class MainPanel extends JPanel {

    public MainPanel(Connection conn) {
        this.conn = conn;
        setBackground(Color.LIGHT_GRAY);
        createPanel();
        setVisible(true);
    }

    private void createPanel() {
        editorPane.setBackground(Color.LIGHT_GRAY);
        editorPane.setContentType("text/html");
        editorPane.setEditable(false);
        editorPane.setText("<h2>Hi, Welcome To Stocks DB GUI App!</h2>\n" +
                "\n" +
                "<p>Please nagivate the <em>Switch</em> Menu above to desired Query.</p>\n" +
                "\n" +
                "<p>Also before starting, make sure you have executed (if not already)</p>\n" +
                "\n" +
                "<ol>\n" +
                "\t<li><strong><em>Schema.sql</em>&nbsp;</strong></li>\n" +
                "\t<li><strong><em>Entries.sql</em> </strong></li>\n" +
                "</ol>\n" +
                "\n" +
                "<p>both located in the&nbsp;Project zip folder.</p>\n" +
                "\n" +
                "<hr />\n" +
                "<p>This application is graphical end-user interface for some of our queries.</p>\n" +
                "\n" +
                "<p>It will execute procedures paramatrized by user input.</p>\n" +
                "\n" +
                "<hr />\n" +
                "<p>Group G of CSC 453-01 Fall 2020&nbsp;&copy;</p>\n" +
                "\n" +
                "<p>Arjaey Bautista, Saad Khan, Yesenia Galindo</p>\n" +
                "\n" +
                "<p>Credits to:&nbsp;<cite><em><a href=\"https://docs.oracle.com/javase/tutorial/uiswing/components/table.html\">docs.oracle.com</a></em></cite>&nbsp;for JDBM Tables Tutorial</p>\n" +
                "\n" +
                "<p>&nbsp;</p>\n" +
                "\n" +
                "<p>&nbsp;</p>");
        add(editorPane);
    }

    private Connection conn;
    private JEditorPane editorPane = new JEditorPane();
}