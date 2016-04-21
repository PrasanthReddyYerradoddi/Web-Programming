package gapp.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="applicationadditionalfields")
public class ApplicationAdditionalFields {

	@Id
	@GeneratedValue
	private int field_id;
	
	private String field_name;
	
	private String field_type;
	
	private String field_status;
	
	@ManyToOne
	private Application application;
	
	@ManyToOne
	private Departments department;

	public int getField_id() {
		return field_id;
	}

	public void setField_id(int field_id) {
		this.field_id = field_id;
	}

	public String getField_name() {
		return field_name;
	}

	public void setField_name(String field_name) {
		this.field_name = field_name;
	}

	public String getField_type() {
		return field_type;
	}

	public void setField_type(String field_type) {
		this.field_type = field_type;
	}

	public String getField_status() {
		return field_status;
	}

	public void setField_status(String field_status) {
		this.field_status = field_status;
	}

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public Departments getDepartment() {
		return department;
	}

	public void setDepartment(Departments department) {
		this.department = department;
	}
	
	
}
