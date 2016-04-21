package gapp.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="departments")
public class Departments {

	@Id
	@GeneratedValue
	private int department_id;
	
	private String department;
	
	@OneToMany(mappedBy="department")
	private List<Application> application;
	
	@OneToMany(mappedBy="department")
	private List<Programs> programs;

	@OneToMany(mappedBy="department")
	private List<ApplicationAdditionalFields> addField;
	
	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public List<Programs> getPrograms() {
		return programs;
	}

	public void setPrograms(List<Programs> programs) {
		this.programs = programs;
	}


	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public List<Application> getApplication() {
		return application;
	}

	public void setApplication(List<Application> application) {
		this.application = application;
	}

	public List<ApplicationAdditionalFields> getAddField() {
		return addField;
	}

	public void setAddField(List<ApplicationAdditionalFields> addField) {
		this.addField = addField;
	}

	
}
