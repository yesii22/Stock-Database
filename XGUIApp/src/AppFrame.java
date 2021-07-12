import javax.swing.*;
import java.awt.*;
import java.sql.Connection;

public class AppFrame extends JFrame {

    public AppFrame(Connection conn) {
        super("Stocks DB GUI App");
        this.conn = conn;
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(720, 405);
        setResizable(false);
        setLocation(dimens.width / 2 - this.getSize().width / 2,
                dimens.height / 2 - this.getSize().height / 2);
        createJMenuBar();
        add(new MainPanel(conn));
        setVisible(true);
    }

    private void createJMenuBar() {
        exitMenuItem.addActionListener(e -> System.exit(0));
        appMenu.add(exitMenuItem);

        jMenuBar.add(appMenu);

        checkPortfolioMenuItem.addActionListener(e -> {
            getContentPane().removeAll();
            add(new CheckPortfolioPanel(conn));
            revalidate();});
        switchMenu.add(checkPortfolioMenuItem);

        checkRegisterMenuItem.addActionListener(e -> {
            getContentPane().removeAll();
            add(new CheckRegisterPanel(conn));
            revalidate();});
        switchMenu.add(checkRegisterMenuItem);

        checkDateOrdersMenuItem.addActionListener(e -> {
            getContentPane().removeAll();
            add(new CheckOrderDatesPanel(conn));
            revalidate();});
        switchMenu.add(checkDateOrdersMenuItem);

        jMenuBar.add(switchMenu);

        setJMenuBar(jMenuBar);
    }

    private Connection conn;
    private final Dimension dimens = Toolkit.getDefaultToolkit().getScreenSize();
    private final JMenuBar jMenuBar = new JMenuBar();
    private final JMenu appMenu = new JMenu("App");
    private final JMenuItem exitMenuItem = new JMenuItem("Exit");
    private final JMenu switchMenu = new JMenu("Switch");
    private final JMenuItem checkPortfolioMenuItem = new JMenuItem("Check Portfolio");
    private final JMenuItem checkRegisterMenuItem = new JMenuItem("Check Register");
    private final JMenuItem checkDateOrdersMenuItem = new JMenuItem("Check Date Orders");
}