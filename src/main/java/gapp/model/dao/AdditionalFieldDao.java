package gapp.model.dao;

import java.util.List;

import gapp.model.ApplicationAdditionalFields;
import gapp.model.Departments;

public interface AdditionalFieldDao {

	ApplicationAdditionalFields addField(ApplicationAdditionalFields add);
	
	ApplicationAdditionalFields getField(Integer id);
	
	List<ApplicationAdditionalFields> getDepartments(Departments department);
	
	void removefield(Integer id);
}
