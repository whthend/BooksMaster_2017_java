package beans;

public class Document {
	private String id;
	private String title;//书名
	private String author;//作者
	private String publisher;//出版社
	private String price;//价格
	private String stack;//所在书库
	private String leftCount;
	
	public String getId(){
		return id;
	}
	public void setId(String id){
		this.id=id;
	}
	
	public String getTitle(){
		return title;
	}
	public void setTitle(String title){
		this.title=title;
	}
	
	public String getAuthor(){
		return author;
	}
	public void setAuthor(String author){
		this.author=author;
	}
	
	public String getPublisher(){
		return publisher;
	}
	public void setPublisher(String publisher){
		this.publisher=publisher;
	}
	
	public String getPrice(){
		return price;
	}
	public void setPrice(String price){
		this.price=price;
	}
	
	public String getStack(){
		return stack;
	}
	public void setStack(String stack){
		this.stack=stack;
	}
	
	public String getLeftCount(){
		return leftCount;
	}
	public void setLeftCount(String leftCount){
		this.leftCount=leftCount;
	}
	
	
	
	
	
	
	
}
