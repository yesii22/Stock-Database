import java.net.URL;
import java.util.ResourceBundle;
import java.sql.*;
import javafx.fxml.FXML;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.Initializable;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.TableColumn;

public class SampleController implements Initializable {
	private String nameField;
	
	 @FXML
	 private TableView<ModelTable> portfolio_table;

	 @FXML
	 private TableColumn<ModelTable, String> col_user_full_name;
	 
	 @FXML
	 private TableColumn<ModelTable, String> col_stock_name;

	 @FXML
	 private TableColumn<ModelTable, String> col_stock_symbol;
	    
	 @FXML
	 private TableColumn<ModelTable, String> col_stock_price;
	 
	 @FXML
	 private TableColumn<ModelTable, Integer> col_ordered_quantity;
	 
	 @FXML
	 private TableColumn<ModelTable, String> col_order_date;

	 @FXML
	 private TextField search_field;

	 @FXML
	 void getValue(ActionEvent event) 
	 {
		nameField = search_field.getText();
		list = DBConnector.getDataList(nameField);
		portfolio_table.setItems(list);
	 }
	 
	 ObservableList<ModelTable> list;
	 Connection conn = null;
	 ResultSet rs = null;
	 PreparedStatement ps = null;
	 
	@Override
	public void initialize(URL url, ResourceBundle rb) {

		col_user_full_name.setCellValueFactory(new PropertyValueFactory<ModelTable, String>("UserFullName"));
		col_stock_symbol.setCellValueFactory(new PropertyValueFactory<ModelTable, String>("StockSymbol"));
		col_stock_name.setCellValueFactory(new PropertyValueFactory<ModelTable, String>("StockName"));
		col_stock_price.setCellValueFactory(new PropertyValueFactory<ModelTable, String>("StockPrice"));
		col_ordered_quantity.setCellValueFactory(new PropertyValueFactory<ModelTable, Integer>("OrderedQuantity"));
		col_order_date.setCellValueFactory(new PropertyValueFactory<ModelTable, String>("OrderDate"));
		
	}
	
	
}
