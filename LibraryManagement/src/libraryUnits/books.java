package libraryUnits;

public class books {
	public int bookid;
	public String name;
	public int quantity;
	public String author;
	

	public books(String name,String author,int quantity,int id) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.author = author;
		this.quantity = quantity;
		this.bookid = id;
	}
	
	public boolean CheckQuantity() {
		if(this.quantity==0) {
			return false;
		}
		else {
			this.quantity--;
			return true;
		}
	}

}
