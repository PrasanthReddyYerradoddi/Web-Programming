package gapp.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "application")
public class Application {

	public Application() {

	}

	@Id
	@GeneratedValue
	private int application_id;
	
	private String firstname;
	
	private String lastname;
	
	private String email;

	private String term;

	private String cin;

	private String applicationStatus;

	private String toefl;

	private String gre;

	private String gpa;

	private String transcript;
	
	private Date date;

	@ManyToOne
	private Users user;

	@OneToMany(mappedBy="application")//,cascade=CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
	private List<Degree> degree;

	@OneToMany(mappedBy="application")
	private List<ApplicationAdditionalFields> additionalfields;

	@OneToMany(mappedBy="application")
	private List<ApplicationStatus> applicationstatus;

	@ManyToOne
	private Departments department;
	
	@OneToOne
	private Programs program;

	public int getApplication_id() {
		return application_id;
	}

	public void setApplication_id(int application_id) {
		this.application_id = application_id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getCin() {
		return cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}

	public String getApplicationStatus() {
		return applicationStatus;
	}

	public void setApplicationStatus(String applicationStatus) {
		this.applicationStatus = applicationStatus;
	}

	public String getToefl() {
		return toefl;
	}

	public void setToefl(String toefl) {
		this.toefl = toefl;
	}

	public String getGre() {
		return gre;
	}

	public void setGre(String gre) {
		this.gre = gre;
	}

	public String getGpa() {
		return gpa;
	}

	public void setGpa(String gpa) {
		this.gpa = gpa;
	}

	public String getTranscript() {
		return transcript;
	}

	public void setTranscript(String transcript) {
		this.transcript = transcript;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public List<Degree> getDegree() {
		return degree;
	}

	public void setDegree(List<Degree> degree) {
		this.degree = degree;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public List<ApplicationAdditionalFields> getAdditionalfields() {
		return additionalfields;
	}

	public void setAdditionalfields(
			List<ApplicationAdditionalFields> additionalfields) {
		this.additionalfields = additionalfields;
	}

	public List<ApplicationStatus> getApplicationstatus() {
		return applicationstatus;
	}

	public void setApplicationstatus(List<ApplicationStatus> applicationstatus) {
		this.applicationstatus = applicationstatus;
	}

	public Departments getDepartment() {
		return department;
	}

	public void setDepartment(Departments department) {
		this.department = department;
	}

	public Programs getProgram() {
		return program;
	}

	public void setProgram(Programs program) {
		this.program = program;
	}

	
	

}
