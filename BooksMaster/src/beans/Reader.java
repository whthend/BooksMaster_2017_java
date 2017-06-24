package beans;

public class Reader {
	private String patron_id;//
	private String name;//
	private String gender;//
	private String pwd;//
	private String id;//
	private String tel;//
	private String itemcounts;//
	
	
	
	public String getPatronId(){
		return patron_id;
	}
	public void setPatronId(String patron_id){
		this.patron_id=patron_id;
	}
	
	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name=name;
	}
	
	public String getGender(){
		return gender;
	}
	public void setGender(String gender){
		this.gender=gender;
	}
	
	public String getPwd(){
		return pwd;
	}
	public void setPwd(String pwd){
		this.pwd=pwd;
	}
	
	public String getId(){
		return id;
	}
	public void setId(String id){
		this.id=id;
	}
	
	public String getTel(){
		return tel;
	}
	public void setTel(String tel){
		this.tel=tel;
	}
	
	public String getItemcounts(){
		return itemcounts;
	}
	public void setItemcounts(String itemcounts){
		this.itemcounts=itemcounts;
	}
}
