package gapp.model.dao;

import gapp.model.Application;
import gapp.model.Users;

import java.util.List;

public interface UsersDao {

	List<Users> getUsers(String email, String applicationstatus);
	
	Users register(Users register);
	
	List<Users> getEmails(String email);
	
	Users getEmail(String email);
	
	List<Users> getUser();
	
	List<Users> getUser(Integer id);
	
	Users getUsers(Integer id);
	
	
}
