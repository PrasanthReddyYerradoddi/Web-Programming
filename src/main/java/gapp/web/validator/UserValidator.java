package gapp.web.validator;

import gapp.model.Users;
import gapp.model.dao.UsersDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
	
	@Autowired
	UsersDao usersDao;
	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return Users.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Users users = (Users) target;
		String email = users.getEmail();
				
//		if (!StringUtils.hasText(users.getEmail()))
//			errors.rejectValue("email", "error.e.empty");
//		if (!StringUtils.hasText(users.getPassword()))
//			errors.rejectValue("password", "error.p.empty");
//		if (!StringUtils.hasText(users.getLast_name()))
//			errors.rejectValue("last_name", "error.e.empty");
//		if (!StringUtils.hasText(users.getFirst_name()))
//			errors.rejectValue("first_name", "error.f.empty");
		
		for(Users i : usersDao.getUser())
			if(email.equalsIgnoreCase(i.getEmail()))
				errors.rejectValue("email","error.field.exists");
	}

}
