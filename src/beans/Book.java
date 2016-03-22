package beans;

public class Book {
	String bookid;
	String bookname;
	double bookprice;
	
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public double getBookprice() {
		return bookprice;
	}
	public void setBookprice(double bookprice) {
		this.bookprice = bookprice;
	}
	
	public void disp(){
		System.out.println(bookid+" "+bookname+" "+bookprice);
	}
}
