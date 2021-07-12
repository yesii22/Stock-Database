public class ModelTable
{
	private String UserFullName, StockSymbol, StockName, StockPrice, OrderDate;
	private Integer OrderedQuantity;
	
	public ModelTable(String username, String symbol, String name, String price, Integer quantity, String date)
	{
		setUserFullName(username);
		setStockSymbol(symbol);
		setStockName(name);
		setStockPrice(price);
		setOrderedQuantity(quantity);
		setOrderDate(date);
	}
	public String getUserFullName()
	{
		return UserFullName;
	}
	public String getStockSymbol()
	{
		return StockSymbol;
	}
	public String getStockName()
	{
		return StockName;
	}
	public String getStockPrice()
	{
		return StockPrice;
	}
	public String getOrderDate()
	{
		return OrderDate;
	}
	public int getOrderedQuantity()
	{
		return OrderedQuantity;
	}
	public void setUserFullName(String name)
	{
		UserFullName = name;
	}
	public void setStockSymbol(String symbol)
	{
		StockSymbol = symbol;
	}
	public void setStockName(String name)
	{
		StockName = name;
	}
	public void setStockPrice(String price)
	{
		StockPrice = price;
	}
	public void setOrderDate(String date)
	{
		OrderDate = date;
	}
	public void setOrderedQuantity(Integer q)
	{
		OrderedQuantity = q;
	}
	
	
}
