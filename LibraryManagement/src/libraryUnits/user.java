package libraryUnits;
import libraryUnits.books;

public class user {
	public String username;
	public String password;
	public books allotedBooks[];
	public String userType;
	public int totalbooksalloted;
	

	public user(String username, String password,String type) {
		// TODO Auto-generated constructor stub
		this.username = username;
		this.password = password;
		this.allotedBooks = new books[100];
		this.totalbooksalloted = 0;
		this.userType = type;
	}
	
	public void allotbooks(books book) {
		this.allotedBooks[this.totalbooksalloted] = book;
		this.totalbooksalloted++;
	}
	
	public void removeBook(int id) {
		books newbooklist[] = new books[100];
		int i=0,j=0;
		int flag=0;
		while(i<this.totalbooksalloted) {
			if(this.allotedBooks[i].bookid == id && flag==0) {
				this.allotedBooks[i].quantity++;
				flag=1;
				i++;
				continue;
			}
			else {
				newbooklist[j]=this.allotedBooks[i];
				i++;
				j++;
			}
		}
		this.allotedBooks = newbooklist;
		this.totalbooksalloted--;
	}

}
