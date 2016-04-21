package gapp.model.dao;

import gapp.model.Application;
import gapp.model.Programs;
import gapp.model.Users;

import java.util.List;

public interface ApplicationDao {

	List<Application> getApplications(Integer id);
	
	Application getApplication(Integer id);
	
	Application newApplication(Application app);
	
	List<Application> getAppPgm(Programs pgm);
}
