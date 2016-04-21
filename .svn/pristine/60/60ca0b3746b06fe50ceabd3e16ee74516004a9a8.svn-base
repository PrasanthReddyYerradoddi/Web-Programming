package gapp.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "gappDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class gappDaoTest extends AbstractTransactionalTestNGSpringContextTests {

    @Autowired
    DepartmentDao departmentDao;
    
    @Autowired
    UsersDao usersDao;
    
    @Test
    public void getDepartments(){
    	assert departmentDao.getDepartments().size() == 2;
    }

    @Test
    public void getDepartment()
    {
    	assert departmentDao.getDepartment("Accounting","Fall 2016").size() == 1;
    }
    
    @Test
    public void getUsers()
    {
    	assert usersDao.getUsers("student1@localhost.localdomain","New").size() == 1;
    }
}
