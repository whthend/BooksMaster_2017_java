package beans;

public class Staff {
	private String operator_id;//
	private String pwd;//
	private String name;//
	private String tel;//
	private String gender;//
	
	
	
	public String getOperatorId(){
		return operator_id;
	}
	public void setOperatorId(String operator_id){
		this.operator_id=operator_id;
	}
	
	public String getPwd(){
		return pwd;
	}
	public void setPwd(String pwd){
		this.pwd=pwd;
	}
	
	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name=name;
	}
	
	public String getTel(){
		return tel;
	}
	public void setTel(String tel){
		this.tel=tel;
	}
	
	public String getGender(){
		return gender;
	}
	public void setGender(String gender){
		this.gender=gender;
	}
	
}
