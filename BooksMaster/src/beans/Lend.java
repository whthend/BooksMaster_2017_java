package beans;

public class Lend {
	private String lend_id;//
	private String patron_id;//
	private String doc_id;//
	private String lendtime;//
	private String operator_id;//
	
	
	
	public String getLendId(){
		return lend_id;
	}
	public void setLendId(String lend_id){
		this.lend_id=lend_id;
	}
	
	public String getPatronId(){
		return patron_id;
	}
	public void setPatronId(String patron_id){
		this.patron_id=patron_id;
	}
	
	public String getDocId(){
		return doc_id;
	}
	public void setDocId(String doc_id){
		this.doc_id=doc_id;
	}
	
	public String getLendtime(){
		return lendtime;
	}
	public void setLendtime(String lendtime){
		this.lendtime=lendtime;
	}
	
	public String getReturntime(){
		return operator_id;
	}
	public void setOperatorId(String operator_id){
		this.operator_id=operator_id;
	}
	
}
