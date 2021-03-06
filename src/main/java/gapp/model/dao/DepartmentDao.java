package gapp.model.dao;

import gapp.model.Departments;

import java.util.List;

public interface DepartmentDao {

	List<Departments> getDepartments();

	List<Departments> getDepartment(String department, String term);

	Departments getDepartment(Integer id);

	Departments addDepartment(Departments dept);

	List<Departments> getProgram(Integer id);
}
